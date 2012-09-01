﻿using System; 
using System.Net; 
using System.Text; 
using System.Web.Http;
using System.Collections.Generic;
using SandlerModels;
using SandlerRepositories;
using System.Collections;
using System.Linq;
namespace SandlerAPI.Controllers
{
    public class CompaniesController : ApiController
    {
        public IQueryable<TBL_COMPANIES> Get(int frenchiseeId)
        {
            IQueryable<TBL_COMPANIES> companies;
            companies = new CompaniesRepository().GetByFranchiseeId(frenchiseeId).Where(c => c.IsActive == true).AsQueryable();
            //companies = new CompaniesRepository().GetAll().Where(company => company.IsActive == true && company.FranchiseeId == frenchiseeId).AsQueryable<TBL_COMPANIES>();
            return companies;
        }
    }

}