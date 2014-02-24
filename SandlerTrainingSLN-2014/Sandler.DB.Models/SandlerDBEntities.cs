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
        public List<CompanyView> GetCompanyView(string orderBy, int? pageSize, int? pageNo, int? coachId,int? franchiseeId)
        {
            string whereClause="";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;

            string query = string.Format("exec [sp_CompanyView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , orderBy, pageSize, pageNo, whereClause);

            var q = Database.SqlQuery<CompanyView>(query);

            return q.ToList();
        }

        public List<ContactView> GetContactView(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId)
        {
            string whereClause = "";
            if (coachId.HasValue)
                whereClause = whereClause + ",@coachId=" + coachId.Value;
            if (franchiseeId.HasValue)
                whereClause = whereClause + ",@franchiseeId=" + franchiseeId.Value;
            if (companyId.HasValue)
                whereClause = whereClause + ",@companyId=" + franchiseeId.Value;
            if (!string.IsNullOrEmpty(userId))
                whereClause = whereClause + ",@userId=" + franchiseeId.Value;

            string query = string.Format("exec [sp_ContactView] @orderBy='{0}' ,@pageSize={1},@pageNo={2}{3}"
                , orderBy, pageSize, pageNo, whereClause);

            var q = Database.SqlQuery<ContactView>(query);

            return q.ToList();
        }

        public List<OpportunityView> GetOpportunityView(string orderBy, int? pageSize, int? pageNo, Guid userId, int? companyId)
        {
            string whereClause = "";
            if (companyId.HasValue)
                whereClause = whereClause + ", @companyId=" + companyId.Value;

            string query = string.Format("exec [sp_OpportunityView] @userId='{0}', @orderBy='{1}', @pageSize={2}, @pageNo={3}{4}"
                , userId.ToString(), orderBy, pageSize, pageNo, whereClause);

            var q = Database.SqlQuery<OpportunityView>(query);

            return q.ToList();
        }
    }
}
