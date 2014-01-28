﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Data.Objects.DataClasses;
    using System.Linq;
    
    public partial class SandlerDBEntities : DbContext
    {
        public SandlerDBEntities()
            : base("name=SandlerDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Tbl_AppointmentsSource> Tbl_AppointmentsSource { get; set; }
        public DbSet<Tbl_AwardLevel> Tbl_AwardLevel { get; set; }
        public DbSet<Tbl_BehindAmount> Tbl_BehindAmount { get; set; }
        public DbSet<TBL_BlastEmailGroup> TBL_BlastEmailGroup { get; set; }
        public DbSet<Tbl_CertifiedLevel> Tbl_CertifiedLevel { get; set; }
        public DbSet<TBL_CHART> TBL_CHART { get; set; }
        public DbSet<TBL_COACH> TBL_COACH { get; set; }
        public DbSet<TBL_COMPANIES> TBL_COMPANIES { get; set; }
        public DbSet<TBL_CONTACTS> TBL_CONTACTS { get; set; }
        public DbSet<Tbl_CostPlusAmount> Tbl_CostPlusAmount { get; set; }
        public DbSet<TBL_COUNTRY> TBL_COUNTRY { get; set; }
        public DbSet<Tbl_Course> Tbl_Course { get; set; }
        public DbSet<TBL_DOCS> TBL_DOCS { get; set; }
        public DbSet<Tbl_DocumentStatus> Tbl_DocumentStatus { get; set; }
        public DbSet<Tbl_FollowUpItemsList> Tbl_FollowUpItemsList { get; set; }
        public DbSet<TBL_FRANCHISEE> TBL_FRANCHISEE { get; set; }
        public DbSet<TBL_FRANCHISEE_USERS> TBL_FRANCHISEE_USERS { get; set; }
        public DbSet<TBL_GA_EstBenefitsGained> TBL_GA_EstBenefitsGained { get; set; }
        public DbSet<TBL_GA_QuotaAchievement> TBL_GA_QuotaAchievement { get; set; }
        public DbSet<TBL_GA_SalesCycleTime> TBL_GA_SalesCycleTime { get; set; }
        public DbSet<TBL_GA_SalesEfficiency> TBL_GA_SalesEfficiency { get; set; }
        public DbSet<TBL_GA_SalesQualification> TBL_GA_SalesQualification { get; set; }
        public DbSet<TBL_GA_SalesRepRetention> TBL_GA_SalesRepRetention { get; set; }
        public DbSet<TBL_GA_Tracker> TBL_GA_Tracker { get; set; }
        public DbSet<TBL_GA_TrainingCostSavings> TBL_GA_TrainingCostSavings { get; set; }
        public DbSet<TBL_GA_TrngBenefits> TBL_GA_TrngBenefits { get; set; }
        public DbSet<Tbl_IndustryType> Tbl_IndustryType { get; set; }
        public DbSet<Tbl_MasterFranchisee> Tbl_MasterFranchisee { get; set; }
        public DbSet<Tbl_MeetingFrequencyType> Tbl_MeetingFrequencyType { get; set; }
        public DbSet<Tbl_MeetingType> Tbl_MeetingType { get; set; }
        public DbSet<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        public DbSet<TBL_OpportunitiesHistory> TBL_OpportunitiesHistory { get; set; }
        public DbSet<TBL_OpportunitySource> TBL_OpportunitySource { get; set; }
        public DbSet<TBL_OPPORTUNITYSTATUS> TBL_OPPORTUNITYSTATUS { get; set; }
        public DbSet<TBL_OpportunityTypes> TBL_OpportunityTypes { get; set; }
        public DbSet<TBL_OpportunityWhyLost> TBL_OpportunityWhyLost { get; set; }
        public DbSet<Tbl_PrimaryBusiness> Tbl_PrimaryBusiness { get; set; }
        public DbSet<Tbl_ProductType> Tbl_ProductType { get; set; }
        public DbSet<Tbl_PurchaseLevel> Tbl_PurchaseLevel { get; set; }
        public DbSet<TBL_REGION> TBL_REGION { get; set; }
        public DbSet<Tbl_SandlerRole> Tbl_SandlerRole { get; set; }
        public DbSet<TBL_State> TBL_State { get; set; }
        public DbSet<TBL_Trng_Expenditure> TBL_Trng_Expenditure { get; set; }
        public DbSet<TBL_UserEmailGroup> TBL_UserEmailGroup { get; set; }
        public DbSet<Tbl_YesNoOptions> Tbl_YesNoOptions { get; set; }
        public DbSet<UserProfile> UserProfiles { get; set; }
    
        public virtual ObjectResult<VW_Company> GetCompaniesByUser(Nullable<System.Guid> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<VW_Company>("GetCompaniesByUser", userIdParameter);
        }
    }
}
