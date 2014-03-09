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
        public IEnumerable<GlobalSearchView> GetGlobalSearchRecords(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, string userId, string searchText, string searchRecordType)
        {
            return (DBContext.Get() as SandlerDBEntities).GetGlobalSearchRecords(orderBy, pageSize, pageNo, coachId, franchiseeId,userId, searchText, searchRecordType);
        }
        public IEnumerable<ContactView> GetArchiveContacts(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel)
        {
            return (DBContext.Get() as SandlerDBEntities).GetArchiveContactView(orderBy, pageSize, pageNo, coachId, franchiseeId, companyId, userId, searchText, selectForExcel);
        }
        //For Archive Contact
        public bool ArchiveContact(int contactId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_Contacts Set IsActive = 0, UpdatedDate = GetDate(), UpdatedBy = '{0}' where ContactsId = {1} Update TBL_OPPORTUNITIES Set IsActive = 0 , UpdatedDate = GetDate(), UpdatedBy = '{0}' where ContactId = {1} Select 1 as responseId", userId, contactId);
            
            var _message = (DBContext.Get() as SandlerDBEntities).Database.SqlQuery<ReponseMessage>(_sql).FirstOrDefault();
            //Now return the response
            if (_message.responseId > 0)
            {
                //All Ok - Record is marked as Archived
                return true;
            }
            else
            {
                //something went wrong
                return false;
            }
        }

        public bool UnArchiveContact(int contactId, string userId)
        {
            string _sql = string.Format("UPDATE Tbl_Contacts Set IsActive = 1, UpdatedDate = GetDate(), UpdatedBy = '{0}' where ContactsId = {1} Update TBL_OPPORTUNITIES Set IsActive = 1 , UpdatedDate = GetDate(), UpdatedBy = '{0}' where ContactId = {1} Select 1 as responseId", userId, contactId);
            
            var _message = (DBContext.Get() as SandlerDBEntities).Database.SqlQuery<ReponseMessage>(_sql).FirstOrDefault();
            //Now return the response
            if (_message.responseId > 0)
            {
                //All Ok - Record is marked as Archived
                return true;
            }
            else
            {
                //something went wrong
                return false;
            }
        }
    }
}
