using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
namespace SandlerAPI.Controllers
{
    public class RegionsController : ApiController
    {
        public IEnumerable<TBL_REGION> Get()
        {
            return new RegionRepository().GetAll().Where(r => r.IsActive == true);
        }


        public IEnumerable<TBL_REGION> Get(int id, string parameter)
        {
            switch (parameter)
            {
                case "Country":
                    return new RegionRepository().GetAll().Where(r => r.IsActive == true && r.CountryID == id);
                case "Coach":
                    TBL_COACH coach = new CoachRepository().GetById(id);
                    TBL_REGION regionOfCoach = (from region in new RegionRepository().GetAll().Where(r => r.IsActive == true && r.ID == coach.RegionID)
                                                select region).SingleOrDefault();

                    IEnumerable<TBL_REGION> regions = from region in new RegionRepository().GetAll().Where(r => r.IsActive == true && r.CountryID == regionOfCoach.CountryID)
                                                      select region;
                    return regions;
                default:
                    return null;
            }

        }


    }
}