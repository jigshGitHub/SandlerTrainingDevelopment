using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;

namespace SandlerRepositories
{
    public partial class NightProcessRepository
    {
        DBFactory db = new DBFactory();
        public void ResetFields()
        {
            //Reset Fields
            db.ExecuteNonQuery("sp_ResetFields");
        }
    }
}
