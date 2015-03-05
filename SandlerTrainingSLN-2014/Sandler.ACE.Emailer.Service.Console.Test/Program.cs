using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.ACE.Emailer.Service.Console.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            ACEmailer aceEmailer;
            try
            {
                aceEmailer = new ACEmailer();
                aceEmailer.ProcessPreCampaigns();
                aceEmailer.ProcessPostCampaigns();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
