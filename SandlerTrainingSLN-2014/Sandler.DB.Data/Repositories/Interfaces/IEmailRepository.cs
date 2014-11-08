using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Sandler.DB.Data.Repositories.Interfaces
{
    public interface IEmailRepository
    {
        IEnumerable<TBL_BlastEmailGroup> GetBlastEmailGroups(string role);
        IEnumerable<TBL_UserEmailGroup> GetUserEmailGroups(string UserId);
        IEnumerable<EmailAddressInfo> GetAllCoachAddresses();
        IEnumerable<EmailAddressInfo> GetAllFranchiseeAddresses(string Role);
        IEnumerable<EmailAddressInfo> GetFranchiseeAddresses(string Role, int FrId);
        IEnumerable<EmailAddressInfo> GetAllContactsAddresses(int FrId);
        IEnumerable<EmailAddressInfo> GetUserEmailGroupAddresses(int GroupId);

        IEnumerable<CoachEmailInfo> GetAllCoachAddressesByFrId(int FrId);
        IEnumerable<FranchiseeEmailInfo> GetAllFranchiseeAddressesByFrId(string Role,int FrId);
        IEnumerable<ContactEmailInfo> GetAllContactsAddressesByFrId(int FrId);
        bool AddEmailUserGroup(string GroupName, string CoachIds, string FrOwnerIds, string FrUsersIds, string FrContactsIds, string UserId);


        IEnumerable<Tbl_MeetingType> GetMeetingTypeOptions();
        string GetMeetingTypeName(int typeId);
        string GetMeetingFreqTypeName(int freqId);

        IEnumerable<Tbl_MeetingFrequencyType> GetMeetingFrequencyTypes();

        
                
    }
}
