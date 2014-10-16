using Sandler.DB.Data.Repositories.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Common.Interface
{
    public interface IUnitOfWork
    {
        void Dispose();
        void Save();
        void Dispose(bool disposing);
        IRepository<T> Repository<T>() where T : class;
        ICompanyRepository  CompanyRepository();
        IContactRepository ContactRepository();
        IOpportunityRepository OpportunityRepository();
        IMenuRepository MenuRepository();
        IFranchiseeRepository FranchiseeRepository();
        IFranchiseeUsersRepository FranchiseeUsersRepository();
        IMyTaskRepository MyTaskRepository();
        IKendoChartsRepository KendoChartsRepository(); 
    }
}
