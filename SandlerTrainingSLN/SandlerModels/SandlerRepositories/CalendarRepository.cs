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
    public partial class CalendarRepository
    {
        DBFactory db = new DBFactory();
        public DataSet GetAllEvents()
        {
            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Get All Events for this user
            return db.ExecuteDataset("sp_GetAllEvents", "GetAllEvents", 
                new SqlParameter("@Role", _user.Role.ToString()),
                new SqlParameter("@UserId", _user.UserId.ToString()),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID),
                new SqlParameter("@RegionId", _user.RegionID));
        }
        
        public void Add(DateTime FollowUpDate,string Description, string Phone)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Add
            db.ExecuteNonQuery("sp_AddFollowUpItem", 
            new SqlParameter("@UserId", _user.UserId.ToString()),
            new SqlParameter("@FollowUpDate", FollowUpDate),
            new SqlParameter("@Description", Description),
            new SqlParameter("@Phone", Phone));
            
        }

    }
}
