using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SandlerModels;
using System.IO;

namespace SandlerUpdates
{
    class Program
    {
        static void Main(string[] args)
        {
            //Create Log File if it does not exist
            StreamWriter sw = new StreamWriter("SandlerNightLogs.txt", true);
            try
            {
                //Start the Process
                sw.WriteLine("Reset fields process started on " + DateTime.Now);
                //Perform Night work
                SandlerRepositories.NightProcessRepository nightProcessRepository = new SandlerRepositories.NightProcessRepository();
                nightProcessRepository.ResetFields();
                sw.WriteLine("Comitted changes to database");
                //End the Process
                sw.WriteLine("Reset fields process completed on " + DateTime.Now);

            }
            catch (Exception ex)
            {
                //Log the Exception
                sw.WriteLine(string.Format("Error encountered during processing: {0}", ex.Message));
            }
            finally
            {
                //Close the SW
                sw.Close();
            }
            
        }
                
    }
}
