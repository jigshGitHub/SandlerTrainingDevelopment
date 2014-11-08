using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public static class Extentions
    {
        public static IEnumerable<T> DistinctBy<T, TKey>(this IEnumerable<T> items, Func<T, TKey> property)
        {
            return items.GroupBy(property).Select(x => x.First());
        }
    }
    public partial class SandlerDBEntities : DbContext
    {

        public List<CompanyView> GetCompanyView(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=1";

            string query = string.Format("exec [sp_CompanyView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<CompanyView>(query).DistinctBy(r => r.COMPANIESID);

            return q.ToList();
        }

        public List<CompanyView> GetCompanyOpportunitiesView(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=1";

            string query = string.Format("exec [sp_CompanyHasOpporunitiesView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<CompanyView>(query).DistinctBy(r => r.COMPANIESID);

            return q.ToList();
        }

        public List<CompanyView> GetCompanyLookup(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=1";

            string query = string.Format("exec [sp_CompanyLookup] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<CompanyView>(query);

            return q.ToList();
        }

        public List<MyTaskView> GetMyTaskView(string Role, string UserId, int? FranchiseeId, int? RegionId)
        {
            string query = string.Format("exec [sp_GetAllTasks] @Role='{0}',@UserId= '{1}',@FranchiseeId={2},@RegionId={3} ", Role, UserId, FranchiseeId, RegionId);

            var q = Database.SqlQuery<MyTaskView>(query);

            return q.ToList();
        }

        public List<MyTaskView> GetMyTaskViewByDate(string Role, string UserId, int? FranchiseeId, int? RegionId, DateTime seldate)
        {
            string dateonly = seldate.ToString("d");

            string query = string.Format("exec [sp_GetAllTasksByDate] @Role='{0}',@UserId= '{1}',@FranchiseeId={2},@RegionId={3},@SelDate='{4}' ", Role, UserId, FranchiseeId, RegionId, dateonly);

            var q = Database.SqlQuery<MyTaskView>(query);

            return q.ToList();
        }

        public List<CompanyView> GetArchiveCompanyView(string searchText, string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, bool selectForExcel)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=1";

            string query = string.Format("exec [sp_ArchiveCompanyView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<CompanyView>(query);

            return q.ToList();
        }

        public List<ContactView> GetContactView(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel)
        {
            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (companyId.HasValue)
                whereClause = whereClause + ",@companyId=" + companyId.Value;
            if (!string.IsNullOrEmpty(userId))
                whereClause = whereClause + ",@userId='" + userId + "'";
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=" + selectForExcel;

            string query = string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<ContactView>(query);

            return q.ToList();
        }

        public List<ContactView> GetArchiveContactView(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel)
        {
            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (companyId.HasValue)
                whereClause = whereClause + ",@companyId=" + companyId.Value;
            if (!string.IsNullOrEmpty(userId))
                whereClause = whereClause + ",@userId=" + userId + "'";
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=" + selectForExcel;

            string query = string.Format("exec [sp_ArchiveContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<ContactView>(query);

            return q.ToList();
        }

        public List<OpportunityView> GetOpportunityView(string orderBy, int? pageSize, int? pageNo, Guid userId, int? companyId, string searchText, bool bringArchive)
        {
            string whereClause = "";
            if (companyId.HasValue)
                whereClause = whereClause + ", @companyId=" + companyId.Value;
            if (bringArchive)
                whereClause = whereClause + ", @isActive=0";

            string query = string.Format("exec [sp_OpportunityView] @userId='{0}', @orderBy='{1}', @pageSize={2}, @pageNo={3}{4}, @searchText='{5}'"
                , userId.ToString(), orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<OpportunityView>(query);

            return q.ToList();
        }

        public List<FranchiseeUsersView> GetFranchiseeUsersView(string orderBy, int? pageSize, int? pageNo, Guid userId, string searchText)
        {

            string query = string.Format("exec [sp_FranchiseeUsersView] @userId='{0}', @orderBy='{1}', @pageSize={2}, @pageNo={3}, @searchText='{4}'"
                , userId, orderBy, pageSize, pageNo, searchText);

            var q = Database.SqlQuery<FranchiseeUsersView>(query);

            return q.ToList();
        }


        public List<FranchiseeView> GetFranchiseeView(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel, Guid userId, bool bringArchive)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";

            if (selectForExcel)
                whereClause = whereClause + ", @selectForExcel=1";
            if (bringArchive)
                whereClause = whereClause + ", @isActive=0";

            string query = string.Format("exec [sp_FranchiseeView] @userId='{0}', @orderBy='{1}' ,@pageSize={2},@pageNo={3}{4},@searchText='{5}'"
                , userId.ToString(), orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<FranchiseeView>(query);

            return q.ToList();
        }

        public List<ReportView> GetReportData(string reportType, string orderBy, int? pageSize, int? pageNo, string recordType)
        {


            string query = string.Format("[" + reportType + "] @orderBy='{0}', @pageSize={1},@pageNo={2},@recordType='{3}'"
                , orderBy, pageSize, pageNo, recordType);

            var q = Database.SqlQuery<ReportView>(query);

            return q.ToList();
        }

        public List<GlobalSearchView> GetGlobalSearchRecords(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, string userId, string searchText, string searchRecordType)
        {
            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;


            string query = string.Format("exec [sp_AdvancedSearch] @userId='{0}' ,@orderBy='{1}', @pageSize={2},@pageNo={3}{4},@searchRecordType='{5}',@searchText='{6}'"
               , userId.ToString(), orderBy, pageSize, pageNo, whereClause, searchRecordType, searchText);



            var q = Database.SqlQuery<GlobalSearchView>(query);

            return q.ToList();
        }

        public List<FranchiseeView> GetArchiveFranchiseeView(string searchText, string orderBy, int? pageSize, int? pageNo, bool selectForExcel)
        {
            if (string.IsNullOrEmpty(searchText))
                searchText = "";

            string whereClause = "";

            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=1";

            string query = string.Format("exec [sp_ArchiveFranchiseeView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3},@searchText='{4}'"
                , orderBy, pageSize, pageNo, whereClause, searchText);

            var q = Database.SqlQuery<FranchiseeView>(query);

            return q.ToList();
        }

        public List<MyTaskView> GetmytasksList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            //string whereClause = "";
            //if (CoachId.HasValue)
            //    whereClause = whereClause + ",@CoachId=" + CoachId.Value;
            //if (FranchiseeId.HasValue)
            //    whereClause = whereClause + ",@FranchiseeId=" + FranchiseeId.Value;

            //string query = string.Format("exec [sp_GetMyTaskList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}'{4} ", orderBy, pageSize, pageNo, UserId, whereClause);
            string query = string.Format("exec [sp_GetMyTaskList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}' ", orderBy, pageSize, pageNo, UserId);

            var q = Database.SqlQuery<MyTaskView>(query);

            return q.ToList();
        }

        public List<MyTaskView> GetmyAppointmentsList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            //string whereClause = "";
            //if (CoachId.HasValue)
            //    whereClause = whereClause + ",@CoachId=" + CoachId.Value;
            //if (FranchiseeId.HasValue)
            //    whereClause = whereClause + ",@FranchiseeId=" + FranchiseeId.Value;

            //string query = string.Format("exec [sp_GetMyAppointmentList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}'{4} ", orderBy, pageSize, pageNo, UserId, whereClause);
            string query = string.Format("exec [sp_GetMyAppointmentList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}' ", orderBy, pageSize, pageNo, UserId);

            var q = Database.SqlQuery<MyTaskView>(query);

            return q.ToList();

        }

        public List<MyTaskView> GetmyOpportunityList(string orderBy, int? pageSize, int? pageNo, string UserId, int? FranchiseeId, int? CoachId)
        {
            //string whereClause = "";
            //if (CoachId.HasValue)
            //    whereClause = whereClause + ",@CoachId=" + CoachId.Value;
            //if (FranchiseeId.HasValue)
            //    whereClause = whereClause + ",@FranchiseeId=" + FranchiseeId.Value;

            //string query = string.Format("exec [sp_GetMyOpportunityList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}'{4} ", orderBy, pageSize, pageNo, UserId, whereClause);
            string query = string.Format("exec [sp_GetMyOpportunityList] @orderBy='{0}' ,@pageSize={1},@pageNo={2}, @UserId='{3}' ", orderBy, pageSize, pageNo, UserId);

            var q = Database.SqlQuery<MyTaskView>(query);

            return q.ToList();
        }


        public List<initiativePieCHARTdata> GetPieChartData()
        {
            string query = "SELECT [_activityGROUPid] ,[_activityGROUP] ,[_activityCODEid] ,[_activityCODE] ,[_activityYvalue] ,[_activityXlabel] FROM [dbo].[initiativePieCHARTdata]";

            var q = Database.SqlQuery<initiativePieCHARTdata>(query);

            return q.ToList();
        }

        public List<initiativescrollLineCHARTdata> GetScrollLineChartData()
        {
            string query = "SELECT [_date],[_monthYear] ,[_signUpCount] ,[_uniqActivityCount] FROM [dbo].[initiativescrollLineCHARTdata]";

            var q = Database.SqlQuery<initiativescrollLineCHARTdata>(query);

            return q.ToList();
        }

        public List<initiativeLineCHARTdata> GetLineChartData()
        {
            string query = "SELECT [_week] ,[_batchdte] ,[_date] ,[_date1] ,[_donationCOUNT] ,[_donationDOLLAR] FROM [dbo].[initiativeLineCHARTdata]";

            var q = Database.SqlQuery<initiativeLineCHARTdata>(query);

            return q.ToList();
        }

        #region [[ For Email related by Bhavesh ]]

        public List<EmailAddressInfo> GetAllCoachAddresses()
        {
            string query = string.Format("exec [sp_GetAllCoachAddresses]");

            var q = Database.SqlQuery<EmailAddressInfo>(query);

            return q.ToList();
        }

        public List<Tbl_MeetingType> GetMeetingTypeOptions()
        {
            string query = string.Format("exec [sp_GetMeetingTypeOptions]");

            var q = Database.SqlQuery<Tbl_MeetingType>(query);

            return q.ToList();
        }


        public string GetMeetingTypeName(int typeId)
        {
            string query = string.Format("SELECT TypeName FROM Tbl_MeetingType where TypeId = {0}", typeId);

            var q = Database.SqlQuery<string>(query);

            return q.FirstOrDefault();
        }

        public string GetMeetingFreqTypeName(int freqId)
        {
            string query = string.Format("SELECT FreqType FROM Tbl_MeetingFrequencyType where FreqId = {0}", freqId);

            var q = Database.SqlQuery<string>(query);

            return q.FirstOrDefault();
        }

        public List<Tbl_MeetingFrequencyType> GetMeetingFrequencyTypes()
        {
            string query = string.Format("exec [sp_GetMeetingFrequencyType]");

            var q = Database.SqlQuery<Tbl_MeetingFrequencyType>(query);

            return q.ToList();
        }

        public List<EmailAddressInfo> GetAllFranchiseeAddresses(string Role)
        {
            string query = string.Format("exec [sp_GetAllFranchiseeAddresses] @RoleName='{0}'", Role);

            var q = Database.SqlQuery<EmailAddressInfo>(query);

            return q.ToList();
        }

        public List<EmailAddressInfo> GetFranchiseeAddresses(string Role, int FrId)
        {
            string query = string.Format("exec [sp_GetFranchiseeAddresses] @RoleName='{0}',@FranchiseeId={1}", Role, FrId);

            var q = Database.SqlQuery<EmailAddressInfo>(query);

            return q.ToList();
        }

        public List<EmailAddressInfo> GetAllContactsAddresses(int FrId)
        {
            string query = string.Format("exec [sp_GetAllContactsAddresses] @FranchiseeId={0}", FrId);

            var q = Database.SqlQuery<EmailAddressInfo>(query);

            return q.ToList();
        }

        public List<EmailAddressInfo> GetUserEmailGroupAddresses(int GroupId)
        {
            string query = string.Format("exec [sp_GetUserEmailGroupAddresses] @GroupId={0}", GroupId);

            var q = Database.SqlQuery<EmailAddressInfo>(query);

            return q.ToList();
        }

        public List<TBL_BlastEmailGroup> GetBlastEmailGroups(string Role)
        {
            string query = string.Format("exec [sp_GetBlastEmailGroupsByRole] @Role='{0}'", Role);

            var q = Database.SqlQuery<TBL_BlastEmailGroup>(query);

            return q.ToList();
        }

        public List<TBL_UserEmailGroup> GetUserEmailGroups(string UserId)
        {
            string query = string.Format("exec [sp_GetUserEmailGroup] @UserId='{0}'", UserId);

            var q = Database.SqlQuery<TBL_UserEmailGroup>(query);

            return q.ToList();
        }

        #endregion

        #region [[ For Create Email Group by Bhavesh ]]

        public List<CoachEmailInfo> GetAllCoachAddressesByFrId(int FrId)
        {
            string query = string.Format("exec [sp_GetAllCoachAddressesByFrId] @FranchiseeId={0}", FrId);

            var q = Database.SqlQuery<CoachEmailInfo>(query);

            return q.ToList();
        }

        public List<FranchiseeEmailInfo> GetAllFranchiseeAddressesByFrId(string Role, int FrId)
        {
            string query = string.Format("exec [sp_GetAllFranchiseeAddressesByFrId] @RoleName='{0}',@FranchiseeId={1}", Role, FrId);

            var q = Database.SqlQuery<FranchiseeEmailInfo>(query);

            return q.ToList();
        }

        public List<ContactEmailInfo> GetAllContactsAddressesByFrId(int FrId)
        {
            string query = string.Format("exec [sp_GetAllContactsAddressesByFrId] @FranchiseeId={0}", FrId);

            var q = Database.SqlQuery<ContactEmailInfo>(query);

            return q.ToList();
        }

        #endregion

    }
}
