﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace Sandler.ACE.Emailer.Service
{
    public partial class ServiceMain : ServiceBase
    {
        private System.Diagnostics.EventLog eventLog;
        public ServiceMain()
        {
            InitializeComponent();

            this.AutoLog = false;
            eventLog = new System.Diagnostics.EventLog();
            if (!System.Diagnostics.EventLog.SourceExists("SandlerAppEventSource"))
            {
                System.Diagnostics.EventLog.CreateEventSource("SandlerAppEventSource","SandlerAppEventLog");
            }
            eventLog.Source = "SandlerAppEventSource";
            eventLog.Log = "SandlerAppEventLog";
        }

        protected override void OnStart(string[] args)
        {
            eventLog.WriteEntry("Starting SandlerACEEmailer...");

            // Set up a timer to trigger every minute.
            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Interval = 60000 * Convert.ToDouble(ConfigurationManager.AppSettings["IntervalMinutes"]);
            timer.Elapsed += new System.Timers.ElapsedEventHandler(this.OnTimer);
            timer.Start();
        }

        public void OnTimer(object sender, System.Timers.ElapsedEventArgs args)
        {
            eventLog.WriteEntry("Calling ACEEmailer Process|" + DateTime.Now.ToShortTimeString(), EventLogEntryType.Information);
            ACEmailer aceEmailer;
            try{
                aceEmailer = new ACEmailer();
                aceEmailer.ProcessPreCampaigns();
                aceEmailer.ProcessPostCampaigns();
            }
            catch(Exception ex){
                eventLog.WriteEntry("Error in ACEEmailer Process|" + DateTime.Now.ToShortTimeString() + "|" + ex.Message , EventLogEntryType.Error);
            }
            eventLog.WriteEntry("ACEEmailer Complete|" + DateTime.Now.ToShortTimeString(), EventLogEntryType.Information);
        }

        protected override void OnStop()
        {
            eventLog.WriteEntry("Stopping SandlerACEEmailer...");
        }
    }
}
