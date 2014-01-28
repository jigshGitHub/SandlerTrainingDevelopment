using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories.Interfaces;
using Sandler.DB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Repositories.Implementations
{
    public class VWCompanyRepository : RepositoryBase<TBL_COMPANIES>, ICompanyRepository
    {
        public VWCompanyRepository(IDBContext dbContext)
            : base(dbContext)
        {
        }
        public IEnumerable<VW_Company> Get(Guid userId)
        {
            return (DBContext.Get() as SandlerDBEntities).GetCompaniesByUser(userId);
        }
    }
}
