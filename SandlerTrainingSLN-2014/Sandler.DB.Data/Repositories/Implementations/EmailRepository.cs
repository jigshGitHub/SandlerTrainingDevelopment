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

    public class EmailRepository : RepositoryBase<TBL_BlastEmailGroup>, IEmailRepository 
    {
        public EmailRepository(IDBContext dbContext) : base(dbContext)
        {
        }

        public IEnumerable<TBL_BlastEmailGroup> GetBlastEmailGroups(string role)
        {
            return (DBContext.Get() as SandlerDBEntities).GetBlastEmailGroups(role);
        }

        public IEnumerable<TBL_UserEmailGroup> GetUserEmailGroups(string UserId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetUserEmailGroups(UserId);
        }

        public IEnumerable<EmailAddressInfo> GetAllCoachAddresses()
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllCoachAddresses();
        }


        public IEnumerable<EmailAddressInfo> GetAllFranchiseeAddresses(string Role)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllFranchiseeAddresses(Role);
        }
        
        public IEnumerable<EmailAddressInfo> GetFranchiseeAddresses(string Role,int FrId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetFranchiseeAddresses(Role,FrId);
        }

        public IEnumerable<EmailAddressInfo> GetAllContactsAddresses(int FrId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllContactsAddresses(FrId);
        }

        public IEnumerable<EmailAddressInfo> GetUserEmailGroupAddresses(int GroupId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetUserEmailGroupAddresses(GroupId);
        }
        
        public IEnumerable<CoachEmailInfo> GetAllCoachAddressesByFrId(int FrId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllCoachAddressesByFrId(FrId);
        }

        public IEnumerable<FranchiseeEmailInfo> GetAllFranchiseeAddressesByFrId(string Role,int FrId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllFranchiseeAddressesByFrId(Role,FrId);
        }

        public IEnumerable<ContactEmailInfo> GetAllContactsAddressesByFrId(int FrId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetAllContactsAddressesByFrId(FrId);
        }
        
        //For Adding User Email Group....
        public bool AddEmailUserGroup(string GroupName, string CoachIds, string FrOwnerIds, string FrUsersIds, string FrContactsIds, string UserId)
        {
            string _sql = string.Format("Insert into Tbl_UserEmailGroup  (UserId, GroupName, CreatedDate, IsActive,CoachIds,FrOwnerIds,FrUsersIds,FrContactsIds) values ('{0}', '{1}', '{2}',1,'{3}','{4}','{5}','{6}') Select 1 as responseId", UserId, GroupName, DateTime.Now, CoachIds, FrOwnerIds, FrUsersIds, FrContactsIds);
            var _message = (DBContext.Get() as SandlerDBEntities).Database.SqlQuery<ReponseMessage>(_sql).FirstOrDefault();
            //Now return the response
            if (_message.responseId > 0)
            {
                //All Ok - Record is Inserted 
                return true;
            }
            else
            {
                //something went wrong
                return false;
            }
        }
        
        public IEnumerable<Tbl_MeetingType> GetMeetingTypeOptions()
        {
            return (DBContext.Get() as SandlerDBEntities).GetMeetingTypeOptions();
        }


        public string GetMeetingTypeName(int typeId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMeetingTypeName(typeId);
        }

        public string GetMeetingFreqTypeName(int freqId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetMeetingFreqTypeName(freqId);
        }
        

        public IEnumerable<Tbl_MeetingFrequencyType> GetMeetingFrequencyTypes()
        {
            return (DBContext.Get() as SandlerDBEntities).GetMeetingFrequencyTypes();
        }

        
    }
  
}
