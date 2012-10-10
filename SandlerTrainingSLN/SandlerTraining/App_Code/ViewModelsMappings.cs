using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerModels;
using SandlerViewModels;
/// <summary>
/// Summary description for ViewModelsMappings
/// </summary>
namespace SandlerViewModelsMappings
{
    public class CoachMappings
    {
        public CoachMappings()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void ViewModelToModel(TBL_COACH _coach, Coach coach)
        {
            _coach.ADDRESS = coach.ADDRESS;
            _coach.City = coach.City;
            _coach.FirstName = coach.FirstName;
            _coach.LastName = coach.LastName;
            _coach.PhoneNumber = coach.PhoneNumber;
            _coach.RegionID = coach.RegionID;
            _coach.State = coach.State;
            _coach.Zip = coach.Zip;
            _coach.LastUpdatedBy = _coach.CreatedBy;
            _coach.IsEmailSubscription = coach.IsEmailSubscription;
        }

        public static void ModelToViewModel(Coach _coach, TBL_COACH coach)
        {
            _coach.ADDRESS = coach.ADDRESS;
            _coach.City = coach.City;
            _coach.CreatedByCorporateID = coach.CreatedBy.ToString();
            _coach.FirstName = coach.FirstName;
            _coach.LastName = coach.LastName;
            _coach.PhoneNumber = coach.PhoneNumber;
            _coach.RegionID = coach.RegionID;
            _coach.State = coach.State;
            _coach.Zip = coach.Zip;
            _coach.IsEmailSubscription = (coach.IsEmailSubscription.HasValue) ? coach.IsEmailSubscription.Value : false;
            _coach.ID = coach.ID;
        }

    }

    public class FranchiseeMappings
    {
        public FranchiseeMappings()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void ViewModelToModel(TBL_FRANCHISEE _franchisee, Franchisee franchisee)
        {
            _franchisee.CoachID = franchisee.CoachID;
            _franchisee.Name = franchisee.Name;
            _franchisee.Address1 = franchisee.Address1;
            _franchisee.Address2 = franchisee.Address2;
            _franchisee.City = franchisee.City;
            _franchisee.PhoneNumber = franchisee.PhoneNumber;
            _franchisee.FaxNumber = franchisee.FaxNumber;
            _franchisee.EmailAddress = franchisee.Email;
            _franchisee.WebAddress = franchisee.WebAddress;
            _franchisee.State = franchisee.State;
            _franchisee.Zip = franchisee.Zip;
            _franchisee.LastUpdatedBy = _franchisee.CreatedBy;
            if(franchisee.CountryID > 0)
                _franchisee.CountryID = franchisee.CountryID;
        }

        public static void ModelToViewModel(Franchisee _franchisee, TBL_FRANCHISEE franchisee, TBL_FRANCHISEE_USERS franchiseeUser)
        {
            _franchisee.Address1 = franchisee.Address1;
            _franchisee.Address2 = franchisee.Address2;
            _franchisee.CoachID = franchisee.CoachID;
            _franchisee.City = franchisee.City;
            _franchisee.State = franchisee.State;
            _franchisee.Zip = franchisee.Zip;
            _franchisee.CountryID = franchisee.CountryID.Value;
            _franchisee.ID = franchisee.ID;
            _franchisee.Name = franchisee.Name;
            _franchisee.PhoneNumber = franchisee.PhoneNumber;
            _franchisee.FaxNumber = franchisee.FaxNumber;
            _franchisee.WebAddress = franchisee.WebAddress;
            _franchisee.Email = franchisee.EmailAddress;
            _franchisee.FranchiseeUser.FranchiseeID = franchiseeUser.FranchiseeID;
            _franchisee.FranchiseeUser.ADDRESS = franchiseeUser.ADDRESS;
            _franchisee.FranchiseeUser.City = franchiseeUser.City;
            _franchisee.FranchiseeUser.ContactNumber = franchiseeUser.ContactNumber;
            _franchisee.FranchiseeUser.FirstName = franchiseeUser.FirstName;
            _franchisee.FranchiseeUser.IsEmailSubscription = franchiseeUser.IsEmailSubscription.Value;
            _franchisee.FranchiseeUser.LastName = franchiseeUser.LastName;
            _franchisee.FranchiseeUser.State = franchiseeUser.State;
            if(franchiseeUser.CountryID.HasValue)
                _franchisee.FranchiseeUser.CountryID = franchiseeUser.CountryID.Value;
            _franchisee.FranchiseeUser.UserID = franchiseeUser.UserID.ToString();
            _franchisee.FranchiseeUser.Zip = franchiseeUser.Zip;
        }

    }

    public class FranchiseeUserMappings
    {
        public FranchiseeUserMappings()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public static void ViewModelToModel(TBL_FRANCHISEE_USERS _franchiseeUser, FranchiseeUser franchiseeUser)
        {
            _franchiseeUser.ADDRESS = franchiseeUser.ADDRESS;
            _franchiseeUser.City = franchiseeUser.City;
            _franchiseeUser.FirstName = franchiseeUser.FirstName;
            _franchiseeUser.LastName = franchiseeUser.LastName;
            _franchiseeUser.State = franchiseeUser.State;
            _franchiseeUser.Zip = franchiseeUser.Zip;
            if(franchiseeUser.CountryID > 0)
                _franchiseeUser.CountryID = franchiseeUser.CountryID;
            _franchiseeUser.ContactNumber = franchiseeUser.ContactNumber;
        }

        public static void ModelToViewModel(FranchiseeUser _franchiseeUser, TBL_FRANCHISEE_USERS franchiseeUser)
        {
            _franchiseeUser.ADDRESS = franchiseeUser.ADDRESS;
            _franchiseeUser.City = franchiseeUser.City;
            _franchiseeUser.FirstName = franchiseeUser.FirstName;
            _franchiseeUser.LastName = franchiseeUser.LastName;
            _franchiseeUser.ContactNumber = franchiseeUser.ContactNumber;
            _franchiseeUser.State = franchiseeUser.State;
            _franchiseeUser.Zip = franchiseeUser.Zip;
            _franchiseeUser.IsEmailSubscription = (franchiseeUser.IsEmailSubscription.HasValue) ? franchiseeUser.IsEmailSubscription.Value : false;
            _franchiseeUser.FranchiseeID = franchiseeUser.FranchiseeID;
            if (franchiseeUser.CountryID.HasValue)
                _franchiseeUser.CountryID = franchiseeUser.CountryID.Value;
        }

    }
}