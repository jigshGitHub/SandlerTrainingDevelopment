//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

namespace SandlerModels
{
    public partial class TBL_GA_SalesCycleTime
    {
        public TBL_GA_SalesCycleTime()
        {
            this.TBL_GA_Tracker = new HashSet<TBL_GA_Tracker>();
            this.TBL_GA_Tracker1 = new HashSet<TBL_GA_Tracker>();
        }
    
        public string SalesCycleTime { get; set; }
        public Nullable<int> PercentOfIndustryAve { get; set; }
        public int Id { get; set; }
    
        internal ICollection<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
        internal ICollection<TBL_GA_Tracker> TBL_GA_Tracker1 { get; set; }
    }
    
}
