﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;

namespace SandlerModels
{
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
    
        public DbSet<aspnet_Membership> aspnet_Membership { get; set; }
        public DbSet<aspnet_Roles> aspnet_Roles { get; set; }
        public DbSet<aspnet_Users> aspnet_Users { get; set; }
        public DbSet<Tbl_AppointmentsSource> Tbl_AppointmentsSource { get; set; }
        public DbSet<TBL_BlastEmailGroup> TBL_BlastEmailGroup { get; set; }
        public DbSet<TBL_CHART> TBL_CHART { get; set; }
        public DbSet<TBL_COACH> TBL_COACH { get; set; }
        public DbSet<TBL_COMPANIES> TBL_COMPANIES { get; set; }
        public DbSet<TBL_CONTACTS> TBL_CONTACTS { get; set; }
        public DbSet<TBL_COUNTRY> TBL_COUNTRY { get; set; }
        public DbSet<Tbl_Course> Tbl_Course { get; set; }
        public DbSet<TBL_DOCS> TBL_DOCS { get; set; }
        public DbSet<Tbl_DocumentStatus> Tbl_DocumentStatus { get; set; }
        public DbSet<Tbl_FollowUpItemsList> Tbl_FollowUpItemsList { get; set; }
        public DbSet<TBL_FRANCHISEE> TBL_FRANCHISEE { get; set; }
        public DbSet<TBL_FRANCHISEE_USERS> TBL_FRANCHISEE_USERS { get; set; }
        public DbSet<Tbl_IndustryType> Tbl_IndustryType { get; set; }
        public DbSet<TBL_OPPORTUNITIES> TBL_OPPORTUNITIES { get; set; }
        public DbSet<TBL_OPPORTUNITYSTATUS> TBL_OPPORTUNITYSTATUS { get; set; }
        public DbSet<Tbl_ProductType> Tbl_ProductType { get; set; }
        public DbSet<TBL_REGION> TBL_REGION { get; set; }
    
        public virtual ObjectResult<Opportunity> GetOpportunitiesByUser(Nullable<System.Guid> userId)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(Opportunity).Assembly);
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Opportunity>("GetOpportunitiesByUser", userIdParameter);
        }
    
        public virtual ObjectResult<Contact> GetContactsByUser(Nullable<System.Guid> userId)
        {
            ((IObjectContextAdapter)this).ObjectContext.MetadataWorkspace.LoadFromAssembly(typeof(Contact).Assembly);
    
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("userId", userId) :
                new ObjectParameter("userId", typeof(System.Guid));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Contact>("GetContactsByUser", userIdParameter);
        }
    }
}
