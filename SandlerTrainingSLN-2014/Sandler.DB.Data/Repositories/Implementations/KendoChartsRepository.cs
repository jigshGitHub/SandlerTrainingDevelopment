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
    class KendoChartsRepository : RepositoryBase<TBL_FRANCHISEE>, IKendoChartsRepository
    {
        public KendoChartsRepository(IDBContext dbContext) : base(dbContext)
        {
        }

        public IEnumerable<initiativeLineCHARTdata> GetLineChartData()
        {
            return (DBContext.Get() as SandlerDBEntities).GetLineChartData();
        }


        public IEnumerable<initiativescrollLineCHARTdata> GetScrollLineChartData()
        {
            return (DBContext.Get() as SandlerDBEntities).GetScrollLineChartData();
        }

        public IEnumerable<initiativePieCHARTdata> GetPieChartData()
        {
            return (DBContext.Get() as SandlerDBEntities).GetPieChartData();
        }

    }
}
