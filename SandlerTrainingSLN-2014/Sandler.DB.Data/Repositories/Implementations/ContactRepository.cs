using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Implementations
{
    public class ContactRepository : RepositoryBase<TBL_CONTACTS>, IContactRepository 
    {
        public ContactRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public IEnumerable<vw_Contacts> Get(Guid userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetContactsByUser(userId);
        }
        public IEnumerable<GetNewAppointmentsWithAppointmentSource> GetNewAppointmentsWithAppointmentSource(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetNewAppointmentsWithAppointmentSource(month, year, userId);
        }
        public IEnumerable<ContactView> Get(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetContactView(orderBy, pageSize, pageNo, coachId, franchiseeId, companyId, userId,searchText, selectForExcel);
        }
    }
}
