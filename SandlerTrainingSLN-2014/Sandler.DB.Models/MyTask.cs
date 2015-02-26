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
    //public partial class MyTaskView 
    //{
    //    public Nullable<DateTime> StartTime { get; set; }

    //    public Nullable<DateTime> TaskDate { get; set; }

    //    public string Description { get; set; }

    //    public string Topic { get; set; }

    //    public string Phone { get; set; }

    //    public int UniqueID { get; set; }

    //    public Nullable<DateTime> NextDay { get; set; }

    //}

    public partial class MyTaskView
    {
        public Nullable<DateTime> StartTime { get; set; }

        public Nullable<DateTime> TaskDate { get; set; }

        public string Description { get; set; }

        public string Topic { get; set; }

        public int count_ { get; set; }

        public string Phone { get; set; }

        public string AssignTo { get; set; }

        public int UniqueID { get; set; }

        public Nullable<DateTime> NextDay { get; set; }

        public string CompanyName { get; set; }
        public Nullable<DateTime> FollowUpDate { get; set; }
        public Nullable<DateTime> CompanyNextContactDate { get; set; }
        public Nullable<DateTime> ContactNextContactDate { get; set; }
        public int TotalCount { get; set; }
        public string FullName { get; set; }
        public string Location { get; set; }
        public Nullable<int> HowManyAttended { get; set; }
        public string Discussion { get; set; }
        public Nullable<DateTime> ContactDate { get; set; }
        public string OpportunityName { get; set; }
        public Nullable<decimal> VALUE { get; set; }
        public Nullable<DateTime> CloseDate { get; set; }

        public Nullable<DateTime> NEXT_CONTACT_DATE { get; set; }
        public string ActionStep { get; set; }
        public string Status { get; set; }

    }

    public partial class FranchiseePersonnel
    {
        public string UserName { get; set; }

        public string ASPUserId { get; set; }

    }
    
}
