using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// Summary description for EventCalendar
/// </summary>
namespace ExtendedControls
{
    public class EventCalendar : System.Web.UI.WebControls.Calendar
    {
        // **********************************************************
        // Gets or Sets the Name of source DataTable  
        /// <summary>
        /// If this is specified, then Date and EventHeader are mandatory
        /// </summary>
        public DataTable EventSource
        {
            get
            {
                if (ViewState["EventSource"] == null)
                    return null;
                else
                    return ((DataTable)ViewState["EventSource"]);
            }
            set { ViewState["EventSource"] = value; }
        }
        // **********************************************************
                
        // Gets or sets the Date in the DataTable
        public string Date
        {
            get
            {
                if (ViewState["Date"] == null)
                    return string.Empty;
                else
                    return (ViewState["Date"].ToString());
            }
            set { ViewState["Date"] = value; }
        }

        // Gets or sets the Description in the DataTable
        public string Description
        {
            get
            {
                if (ViewState["Description"] == null)
                    return string.Empty;
                else
                    return (ViewState["Description"].ToString());
            }
            set { ViewState["Description"] = value; }
        }

        // Gets or sets the Phone in the DataTable
        public string Phone
        {
            get
            {
                if (ViewState["Phone"] == null)
                    return string.Empty;
                else
                    return (ViewState["Phone"].ToString());
            }
            set { ViewState["Phone"] = value; }
        }
                
        
        public EventCalendar() : base()
        {
            DayRender += new DayRenderEventHandler(EventCalendarDayRender);
        }

        protected void EventCalendarDayRender(object sender, DayRenderEventArgs e)
        {
            CalendarDay d = ((DayRenderEventArgs)e).Day;
            TableCell c = ((DayRenderEventArgs)e).Cell;

            // If there is nothing to bind
            if (this.EventSource == null)
                return;

            DataTable dt = this.EventSource;

            foreach (DataRow dr in dt.Rows)
            {
                if (Date == string.Empty)
                    throw new ApplicationException("Must set EventCalendar's Date property when EventSource is specified");
                if (Description == string.Empty)
                    throw new ApplicationException("Must set EventCalendar's Description property when EventSource is specified");
                if (Phone == string.Empty)
                    throw new ApplicationException("Must set EventCalendar's Phone property when EventSource is specified");

                if (!d.IsOtherMonth && d.Date == Convert.ToDateTime(dr[this.Date]).Date)
                {
                    System.Web.UI.WebControls.Label lbl = new System.Web.UI.WebControls.Label();

                    // Show the Event Text
                    lbl.Text = "<BR />" + dr[Description].ToString();
                    //check how many controls are present. this shows how many events are added for this date
                    if (c.Controls.Count < 3)
                    {
                        //Add Label
                        c.Controls.Add(lbl);
                    }
                    else if (c.Controls.Count < 4)
                    {
                        lbl.Text = "<BR /><BR />" + "More to do list items available..";
                        lbl.ForeColor = System.Drawing.Color.Green; 
                        c.Controls.Add(lbl);
                    }
                    else if (c.Controls.Count == 4)
                    {
                        //do not add anything in the cell as 
                        //we are not showing more than 2 events in the cell
                    }
                    
                }
            }
        }
    }
}
