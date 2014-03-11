using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
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
                whereClause = whereClause + ",@userId=" + userId;
            if (!string.IsNullOrEmpty(searchText))
                whereClause = whereClause + ", @searchText=" + searchText;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=" + selectForExcel;

            string query = string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , orderBy, pageSize, pageNo, whereClause);

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
                whereClause = whereClause + ",@userId=" + userId;
            if (!string.IsNullOrEmpty(searchText))
                whereClause = whereClause + ", @searchText=" + searchText;
            if (selectForExcel)
                whereClause = whereClause + ",@selectForExcel=" + selectForExcel;

            string query = string.Format("exec [sp_ArchiveContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , orderBy, pageSize, pageNo, whereClause);

            var q = Database.SqlQuery<ContactView>(query);

            return q.ToList();
        }

        public List<OpportunityView> GetOpportunityView(string orderBy, int? pageSize, int? pageNo, Guid userId, int? companyId, string searchText, bool bringArchive)
        {
            string whereClause = "";
            if (companyId.HasValue)
                whereClause = whereClause + ", @companyId=" + companyId.Value;
            if (!string.IsNullOrEmpty(searchText))
                whereClause = whereClause + ", @searchText=" + searchText;
            if (bringArchive)
                whereClause = whereClause + ", @isActive=0";

            string query = string.Format("exec [sp_OpportunityView] @userId='{0}', @orderBy='{1}', @pageSize={2}, @pageNo={3}{4}"
                , userId.ToString(), orderBy, pageSize, pageNo, whereClause);

            var q = Database.SqlQuery<OpportunityView>(query);

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

        public List<GlobalSearchView> GetGlobalSearchRecords(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, string userId, string searchText, string searchRecordType)
        {
            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (!string.IsNullOrEmpty(searchText))
                whereClause = whereClause + ", @searchText=" + searchText;

            string query = string.Format("exec [sp_AdvancedSearch] @userId='{0}' ,@orderBy='{1}', @pageSize={2},@pageNo={3}{4},@searchRecordType='{5}'"
               , userId.ToString(), orderBy, pageSize, pageNo, whereClause, searchRecordType);



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


    }
}
