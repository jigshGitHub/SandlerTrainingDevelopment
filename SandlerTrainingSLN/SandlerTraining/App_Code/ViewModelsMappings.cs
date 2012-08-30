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
}