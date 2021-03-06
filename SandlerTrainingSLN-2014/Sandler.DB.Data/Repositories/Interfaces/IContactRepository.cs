﻿using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IContactRepository
    {
        IEnumerable<vw_Contacts> Get(Guid userId);
        IEnumerable<GetNewAppointmentsWithAppointmentSource> GetNewAppointmentsWithAppointmentSource(Nullable<int> month, Nullable<int> year, Nullable<System.Guid> userId);
        IEnumerable<ContactView> Get(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel);
        //For Archive Feature
        bool ArchiveContact(int contactId, string userId);
        bool UnArchiveContact(int contactId, string userId);
        IEnumerable<ContactView> GetArchiveContacts(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, int? companyId, string userId, string searchText, bool selectForExcel);
        IEnumerable<GlobalSearchView> GetGlobalSearchRecords(string orderBy, int? pageSize, int? pageNo, int? coachId, int? franchiseeId, string userId, string searchText, string searchRecordType);
    }
}
