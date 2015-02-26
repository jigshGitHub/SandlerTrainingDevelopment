using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    
    public partial class AceMainView
    {
        public int TotalCount { get; set; }
        public int AceId { get; set; }
        public string CampaignName { get; set; }
        public Nullable<short> CampaignTypeId { get; set; }
        public Nullable<System.DateTime> EventDate { get; set; }
        public string CampaignPurpose { get; set; }
        public Nullable<short> MessageNumber { get; set; }
        public Nullable<int> DaysFromEvent { get; set; }
        public string MessageSubject { get; set; }
        public string Recipients { get; set; }
        public string EmailGroupIds { get; set; }
        public string ResponseTo { get; set; }
        public Nullable<short> CallToActionId { get; set; }
        public string MessageText { get; set; }
        public Nullable<int> AttachFileId { get; set; }
        public Nullable<System.DateTime> MessageSentDate { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
        public Nullable<double> ResponseRate { get; set; }

    }
}
