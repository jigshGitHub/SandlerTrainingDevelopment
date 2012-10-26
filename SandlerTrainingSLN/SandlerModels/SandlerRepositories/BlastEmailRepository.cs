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
    public partial class BlastEmailRepository
    {
        DBFactory db = new DBFactory();
        public DataSet GetBlastEmailGroupsByRole()
        {
            //Get the User Session
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Get Groups
            return  db.ExecuteDataset("sp_GetBlastEmailGroupsByRole", "GroupsByRole", new SqlParameter("@Role", _user.Role.ToString()));
        }
        public DataSet GetMeetingTypeOptions()
        {
            //Get All Coach Addresses
            return db.ExecuteDataset("sp_GetMeetingTypeOptions", "MeetingTypeOptions");
        }
        public DataSet GetMeetingFrequencyType()
        {
            //Get All Coach Addresses
            return db.ExecuteDataset("sp_GetMeetingFrequencyType", "GetMeetingFrequencyType");
        }
        public DataSet GetAllCoachAddresses()
        {
            //Get All Coach Addresses
            return db.ExecuteDataset("sp_GetAllCoachAddresses", "AllCoachAddresses");
        }
        public DataSet GetAllFranchiseeAddresses(string RoleName)
        {
            //Get All Franchisee Addresses
            return db.ExecuteDataset("sp_GetAllFranchiseeAddresses", "AllFranchiseeAddress", new SqlParameter("@RoleName", RoleName));
        }

        #region For Email Group
        
        //For NonCorporate User - Start
        public DataSet GetAllFrOwnerAddressesByFrId()
        {
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetAllFranchiseeAddressesByFrId", "AllFranchiseeAddress", new SqlParameter("@RoleName", SandlerRoles.FranchiseeOwner.ToString()), new SqlParameter("@FranchiseeId", _user.FranchiseeID));
        }
        public DataSet GetAllFrUsersAddressesByFrId()
        {
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetAllFranchiseeAddressesByFrId", "AllFranchiseeAddress", new SqlParameter("@RoleName", SandlerRoles.FranchiseeUser.ToString()), new SqlParameter("@FranchiseeId", _user.FranchiseeID));
        }
        public DataSet GetAllFrContactsAddressesByFrId()
        {
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
        }
        public DataSet GetAllCoachAddressesByFrId()
        {
            //Get All Franchisee Addresses
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetAllCoachAddressesByFrId", "GetAllCoachAddressesByFrId", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
        }
        //Non Corporate User - done

        //For Corporate User - Start
        public DataSet GetAllCoachAddressesByFrId(int ID)
        {
            //Get All Franchisee Addresses
            return db.ExecuteDataset("sp_GetAllCoachAddressesByFrId", "GetAllCoachAddressesByFrId", new SqlParameter("@FranchiseeId", ID));
        }
        public DataSet GetAllFrContactsAddressesByFrId(int ID)
        {
            return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", ID));
        }
        public DataSet GetAllFrOwnerAddressesByFrId(int ID)
        {
            return db.ExecuteDataset("sp_GetAllFranchiseeAddressesByFrId", "AllFranchiseeAddress", new SqlParameter("@RoleName", SandlerRoles.FranchiseeOwner.ToString()), new SqlParameter("@FranchiseeId", ID));
        }
        public DataSet GetAllFrUsersAddressesByFrId(int ID)
        {
            return db.ExecuteDataset("sp_GetAllFranchiseeAddressesByFrId", "AllFranchiseeAddress", new SqlParameter("@RoleName", SandlerRoles.FranchiseeUser.ToString()), new SqlParameter("@FranchiseeId", ID));
        }
        //Corporate User - done       
        public DataSet GetUserEmailGroup()
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetUserEmailGroup", "UserEmailGroup", new SqlParameter("@UserId", _user.UserId.ToString()));
        }
        public DataSet GetUserEmailGroupAddresses(int grpId)
        {
            //Get the User Group Email Addresses Info
            return db.ExecuteDataset("sp_GetUserEmailGroupAddresses", "UserEmailGroupAdrs", new SqlParameter("@GroupId", grpId));
        }
        public void AddGroup(string GroupName, string CoachIds, string FrOwnerIds, string FrUsersIds, string FrContactsIds)
        {
            //Get the User Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            //Add
            db.ExecuteNonQuery("sp_AddUserEmailGroup",
            new SqlParameter("@UserId", _user.UserId.ToString()),
            new SqlParameter("@GroupName", GroupName), new SqlParameter("@CoachIds", CoachIds),
            new SqlParameter("@FrOwnerIds", FrOwnerIds), new SqlParameter("@FrUsersIds", FrUsersIds),
            new SqlParameter("@FrContactsIds", FrContactsIds));

        }
        #endregion

        public DataSet GetAllContactsAddresses()
        {
            //Get All Franchisee Addresses
            int FrId = 0;
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            if ((_user.Role == SandlerRoles.Corporate) || (_user.Role == SandlerRoles.SiteAdmin))
            {
                return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", FrId));
            }
            else
            {
                return db.ExecuteDataset("sp_GetAllContactsAddresses", "ContactAddress", new SqlParameter("@FranchiseeId", _user.FranchiseeID));
            }
                       
        }
        public DataSet GetFranchiseeAddresses(string RoleName,int FranchiseeId)
        {
            //Get Franchisee Addresses
            return db.ExecuteDataset("sp_GetFranchiseeAddresses", "FranchiseeAddress", new SqlParameter("@RoleName", RoleName), new SqlParameter("@FranchiseeId", FranchiseeId));
        }
        public DataSet GetLoggedInUserAddress(string UserId)
        {
            //Get Franchisee Addresses
            return db.ExecuteDataset("sp_GetLoggedInUserAddress", "LoggedinUserAddress", new SqlParameter("@UserId", UserId));
        }
        public void UpdateSubscriptionInfo(string UserId, string Response)
        {
            //Update the Subscription Information
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            db.ExecuteNonQuery("sp_UpdateSubscriptionInfo", new SqlParameter("@UserId", UserId),  new SqlParameter("@Response", Response),new SqlParameter("@Role", _user.Role.ToString()));
        }
        public DataSet GetSubscriptionInfo(string UserId)
        {
            //Get User Subscirption Info
            UserModel _user = (UserModel)HttpContext.Current.Session["CurrentUser"];
            return db.ExecuteDataset("sp_GetSubscriptionInfo", "SubscriptionInfo", new SqlParameter("@UserId", UserId), new SqlParameter("@Role", _user.Role.ToString()));
            
        }
                
    }
}
