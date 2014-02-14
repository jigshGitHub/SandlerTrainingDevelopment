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
    public partial class CompanyView
    {
        public int TotalCount { get; set; }
        public int COMPANIESID { get; set; }
        public string COMPANYNAME { get; set; }
        public string ProductTypeName { get; set; }
        public string IndustryTypeName { get; set; }
        public string RepLastName { get; set; }
        public string RepFirstName { get; set; }
        public string Representative { get; set; }
        public Nullable<int> ProductId { get; set; }
        public Nullable<int> IndustryId { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CreatedBy { get; set; }
        public string CITY { get; set; }
        public string STATE { get; set; }
        public Nullable<int> TotalCompanyValue { get; set; }
        public Nullable<int> CoachID { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
        public string RegionName { get; set; }
    }
    public partial class ContactView
    {
        public int TotalCount { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string ReferredBy { get; set; }
        public string Notes { get; set; }
        public string Country { get; set; }
        public string CreatedBy { get; set; }
        public string Email { get; set; }
        public string COMPANYNAME { get; set; }
        public string RegionName { get; set; }
        public Nullable<int> CompanyId { get; set; }
        public int ContactsId { get; set; }
        public Nullable<int> CoachID { get; set; }
        public Nullable<int> FranchiseeId { get; set; }
    }
}
