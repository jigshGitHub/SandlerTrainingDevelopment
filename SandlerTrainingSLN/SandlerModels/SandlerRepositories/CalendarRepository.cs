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
        public DataSet GetAllEvents(UserModel _user)
        {
            //Get the User Session
            
            //Get All Events for this user
            return db.ExecuteDataset("sp_GetAllEvents", "GetAllEvents", 
                new SqlParameter("@Role", _user.Role.ToString()),
                new SqlParameter("@UserId", _user.UserId.ToString()),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID),
                new SqlParameter("@RegionId", _user.RegionID));
        }

        public void Add(DateTime FollowUpDate, string Description, string Topic, string Phone, UserModel _user)
        {
            
            //Add
            db.ExecuteNonQuery("sp_AddFollowUpItem", 
            new SqlParameter("@UserId", _user.UserId.ToString()),
            new SqlParameter("@FollowUpDate", FollowUpDate),
            new SqlParameter("@Description", Description),
            new SqlParameter("@Topic", Topic),
            new SqlParameter("@Phone", Phone));
            
        }

    }
}
