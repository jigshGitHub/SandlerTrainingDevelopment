using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using SandlerModels;
using SandlerModels.DataIntegration;

namespace SandlerRepositories
{
    public partial class QuickStartRepository
    {
        DBFactory db = new DBFactory();

        public DataSet GetYesNoOptions()
        {
            return (db.ExecuteDataset("sp_GetYesNoOptions", "GetYesNoOptions"));
        }

        public DataSet GetProductTypeByRole(UserModel _user)
        {
            //Get the User Session
            
            //Get All Events for this user
            return db.ExecuteDataset("sp_GetProductTypeByRole", "GetProdcutTypes", new SqlParameter("@Role", _user.Role.ToString()), new SqlParameter("@FranchiseeId", _user.FranchiseeID));
        }

        public DateTime IsValidDateCheck(DateTime inputDate)
        {
            if (inputDate.ToString() == "1/1/0001 12:00:00 AM")
            {
                return default(System.DateTime).AddYears(1754);
            }
            return inputDate;
        }

        public string IsValidStringEntered(string EnteredValue)
        {
            if (string.IsNullOrEmpty(EnteredValue))
            {
                EnteredValue = "";
            }
            return EnteredValue;
        }
        
        public void InsertQuickStartRecord(
                string COMPANYNAME, string FirstName,
                string LastName, string Phone,
                string Email, string OPPNAME,string SalesRepLastName, string SalesRepFirstName,
                string Pain, string LengthProblem,
                string Alternatives, string CostToFix,
                int BudgeIdentifiedValue, int MoveForwardValue,
                int ProductID, int OppStatusID,
                int OppSourceID,int OppTypeID,
                string OPPVALUE, string ACTIONSTEP,
            int Value, int ApptSourceId, int RegForTrainingId,
            int CourseId, DateTime CourseTrngDate, string TrainingCourseName, string HowManyAttended,int IsNewcompany, int IndID,
                DateTime NextContactDate, DateTime OppCloseDate,string Notes, UserModel _user)
        {

            //Get the User Session
            
            //For Date Fields
            NextContactDate = IsValidDateCheck(NextContactDate);
            OppCloseDate = IsValidDateCheck(OppCloseDate);
            //For string Fields
            COMPANYNAME = IsValidStringEntered(COMPANYNAME);
            FirstName = IsValidStringEntered(FirstName);
            LastName = IsValidStringEntered(LastName);
            Phone = IsValidStringEntered(Phone);
            Email = IsValidStringEntered(Email);
            OPPNAME = IsValidStringEntered(OPPNAME);
            SalesRepLastName = IsValidStringEntered(SalesRepLastName);
            SalesRepFirstName = IsValidStringEntered(SalesRepFirstName);
            Pain = IsValidStringEntered(Pain);
            LengthProblem = IsValidStringEntered(LengthProblem);
            Alternatives = IsValidStringEntered(Alternatives);
            CostToFix = IsValidStringEntered(CostToFix);
            OPPVALUE = IsValidStringEntered(OPPVALUE);
            ACTIONSTEP = IsValidStringEntered(ACTIONSTEP);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            TrainingCourseName = IsValidStringEntered(TrainingCourseName);
            HowManyAttended = IsValidStringEntered(HowManyAttended);
            Notes = IsValidStringEntered(Notes);

            
            //Create the record
            db.ExecuteNonQuery("sp_InsertQuickStartRecord",
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@FirstName", FirstName),
                new SqlParameter("@LastName", LastName),
                new SqlParameter("@Phone", Phone),
                new SqlParameter("@Email", Email),
                new SqlParameter("@OPPNAME", OPPNAME),                
                new SqlParameter("@Pain", Pain),
                new SqlParameter("@LengthProblem", LengthProblem),
                new SqlParameter("@Alternatives", Alternatives),
                new SqlParameter("@CostToFix", CostToFix),
                new SqlParameter("@BudgeIdentifiedValue", BudgeIdentifiedValue),
                new SqlParameter("@MoveForwardValue", MoveForwardValue),
                new SqlParameter("@ProductID", ProductID),
                new SqlParameter("@OppStatusID", OppStatusID),
                new SqlParameter("@OppSourceID", OppSourceID),
                new SqlParameter("@OppTypeID", OppTypeID),
                new SqlParameter("@OPPVALUE", OPPVALUE),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@NewAppointment", Value),
                new SqlParameter("@AppointmentSource", ApptSourceId),
                new SqlParameter("@RegisteredForTraining", RegForTrainingId),
                new SqlParameter("@CourseType", CourseId),
                new SqlParameter("@CourseTrainingDate", CourseTrngDate),    
                new SqlParameter("@TrainingCourseName", TrainingCourseName),
                new SqlParameter("@HeadCount", HowManyAttended),
                new SqlParameter("@IsNewcompany", IsNewcompany),                
                new SqlParameter("@Industry", IndID),
                new SqlParameter("@NextContactDate", NextContactDate),
                new SqlParameter("@OppCloseDate", OppCloseDate),
                new SqlParameter("@CreatedBy", _user.UserId),
                new SqlParameter("@LoggedInUserName", _user.UserName),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID),
                new SqlParameter("@SalesRepLastName", SalesRepLastName),
                new SqlParameter("@SalesRepFirstName", SalesRepFirstName),
                new SqlParameter("@Notes", Notes));
            
            UserEntitiesFactory.ReLoad();

        }

        public DataSet GetQuickStartInformationByCompanyandOpportunityIDs(int COMPANIESID, int OppsID)
        {
            //Get the User Info
            System.Data.DataSet ds = db.ExecuteDataset("sp_GetQuickStartInformationByCompanyandOpportunityIDs", "QuickStart", new SqlParameter("@CompanyID", COMPANIESID), new SqlParameter("@OpportunityID", OppsID));
            return ds;           

        }
        public void UpdateQuickStartRecord(
               string COMPANYNAME, string FirstName,
               string LastName, string Phone,
               string Email, string OPPNAME, string SalesRepLastName, string SalesRepFirstName,
               string Pain, string LengthProblem,
               string Alternatives, string CostToFix,
               int BudgeIdentifiedValue, int MoveForwardValue,
               int ProductID, int OppStatusID,
               int OppSourceID, int OppTypeID,
               string OPPVALUE, string ACTIONSTEP,
           int Value, int ApptSourceId, int RegForTrainingId,
           int CourseId, DateTime CourseTrngDate, 
            string TrainingCourseName, string HowManyAttended, int IsNewcompany, int IndID,
               DateTime NextContactDate, DateTime OppCloseDate, string Notes, UserModel _user, int CompanyID, int OpportunityID)
        {

            NextContactDate = IsValidDateCheck(NextContactDate);
            OppCloseDate = IsValidDateCheck(OppCloseDate);
            //For string Fields
            COMPANYNAME = IsValidStringEntered(COMPANYNAME);
            FirstName = IsValidStringEntered(FirstName);
            LastName = IsValidStringEntered(LastName);
            Phone = IsValidStringEntered(Phone);
            Email = IsValidStringEntered(Email);
            OPPNAME = IsValidStringEntered(OPPNAME);
            SalesRepLastName = IsValidStringEntered(SalesRepLastName);
            SalesRepFirstName = IsValidStringEntered(SalesRepFirstName);
            Pain = IsValidStringEntered(Pain);
            LengthProblem = IsValidStringEntered(LengthProblem);
            Alternatives = IsValidStringEntered(Alternatives);
            CostToFix = IsValidStringEntered(CostToFix);
            OPPVALUE = IsValidStringEntered(OPPVALUE);
            ACTIONSTEP = IsValidStringEntered(ACTIONSTEP);
            CourseTrngDate = IsValidDateCheck(CourseTrngDate);
            TrainingCourseName = IsValidStringEntered(TrainingCourseName);
            HowManyAttended = IsValidStringEntered(HowManyAttended);
            Notes = IsValidStringEntered(Notes);


            //Create the record
            db.ExecuteNonQuery("sp_UpdateQuickStartRecord",
                new SqlParameter("@COMPANYNAME", COMPANYNAME),
                new SqlParameter("@FirstName", FirstName),
                new SqlParameter("@LastName", LastName),
                new SqlParameter("@Phone", Phone),
                new SqlParameter("@Email", Email),
                new SqlParameter("@OPPNAME", OPPNAME),
                new SqlParameter("@Pain", Pain),
                new SqlParameter("@LengthProblem", LengthProblem),
                new SqlParameter("@Alternatives", Alternatives),
                new SqlParameter("@CostToFix", CostToFix),
                new SqlParameter("@BudgeIdentifiedValue", BudgeIdentifiedValue),
                new SqlParameter("@MoveForwardValue", MoveForwardValue),
                new SqlParameter("@ProductID", ProductID),
                new SqlParameter("@OppStatusID", OppStatusID),
                new SqlParameter("@OppSourceID", OppSourceID),
                new SqlParameter("@OppTypeID", OppTypeID),
                new SqlParameter("@OPPVALUE", OPPVALUE),
                new SqlParameter("@ACTIONSTEP", ACTIONSTEP),
                new SqlParameter("@NewAppointment", Value),
                new SqlParameter("@AppointmentSource", ApptSourceId),
                new SqlParameter("@RegisteredForTraining", RegForTrainingId),
                new SqlParameter("@CourseType", CourseId),
                new SqlParameter("@CourseTrainingDate", CourseTrngDate),
                new SqlParameter("@TrainingCourseName", TrainingCourseName),
                new SqlParameter("@HeadCount", HowManyAttended),
                new SqlParameter("@IsNewcompany", IsNewcompany),
                new SqlParameter("@Industry", IndID),
                new SqlParameter("@NextContactDate", NextContactDate),
                new SqlParameter("@OppCloseDate", OppCloseDate),
                new SqlParameter("@CreatedBy", _user.UserId),
                new SqlParameter("@LoggedInUserName", _user.UserName),
                new SqlParameter("@FranchiseeId", _user.FranchiseeID),
                new SqlParameter("@SalesRepLastName", SalesRepLastName),
                new SqlParameter("@SalesRepFirstName", SalesRepFirstName),
                new SqlParameter("@Notes", Notes),
                new SqlParameter("@CompanyID", CompanyID),
                new SqlParameter("@OpportunityID", OpportunityID));

            UserEntitiesFactory.ReLoad();

        }


    }
}
