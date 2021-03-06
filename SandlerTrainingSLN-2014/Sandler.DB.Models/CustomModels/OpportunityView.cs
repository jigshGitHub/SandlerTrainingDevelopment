﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public partial class OpportunityView
    {
        public int TotalCount { get; set; }
        public string COMPANYNAME { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string WhyLost { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public string ProductTypeName { get; set; }
        public string Source { get; set; }
        public int ID { get; set; }
        public int COMPANYID { get; set; }
        public int CONTACTID { get; set; }
        public string NAME { get; set; }
        public int ProductID { get; set; }
        public string SALESREPLASTNAME { get; set; }
        public string SALESREPFIRSTNAME { get; set; }
        public string SALESREP { get; set; }
        public Nullable<int> STATUSID { get; set; }
        public Nullable<decimal> VALUE { get; set; }
        public string WINPROBABILITY { get; set; }
        public Nullable<decimal> WEIGHTEDVALUE { get; set; }
        public Nullable<System.DateTime> CLOSEDATE { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<int> OpportunityID { get; set; }
        public Nullable<int> SourceID { get; set; }
        public Nullable<int> TypeID { get; set; }
        public Nullable<int> WhyLostID { get; set; }
        public string Description { get; set; }
        public string Notes { get; set; }
        public Nullable<decimal> ActualValue { get; set; }
        public Nullable<decimal> ProductCost { get; set; }
        public Nullable<System.DateTime> OppCreationDate { get; set; }
        public string Pain { get; set; }
        public string LengthofProblem { get; set; }
        public string CostToFix { get; set; }
        public string Alternatives { get; set; }
        public Nullable<bool> IsBudgeIdentified { get; set; }
        public Nullable<bool> IsMoveForward { get; set; }
    }    
}
