using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ViewModels
/// </summary>
namespace SandlerViewModels
{
    public class Coach
    {
        public Coach()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public int ID { get; set; }
        public string UserName { get; set; }
        public int RegionID { get; set; }
        public string CreatedByCorporateID { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string ADDRESS { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public bool IsEmailSubscription { get; set; }
        public string RegionName { get; set; }
    }

    public class Franchisee
    {
        public Franchisee()
        {
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public int CoachID { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public int CountryID { get; set; }
        public string PhoneNumber { get; set; }
        public string FaxNumber { get; set; }
        public string WebAddress { get; set; }
        public string EmailAddress { get; set; }
        public string FrOwnerFirstName { get; set; }
        public string FrOwnerLastName { get; set; }
    }

    public class FranchiseeUser
    {
        public FranchiseeUser()
        {
        }

        public int FranchiseeID { get; set; }
        public string UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ContactNumber { get; set; }
        public string ADDRESS { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public int CountryID { get; set; }
    }
}