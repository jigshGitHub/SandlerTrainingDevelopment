//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sandler.DB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_PerformanceGoals
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string Year { get; set; }
        public Nullable<int> Month { get; set; }
        public Nullable<int> CallsGoal { get; set; }
        public Nullable<int> MeetingsGoal { get; set; }
        public Nullable<decimal> SalesGoal { get; set; }
    }
}
