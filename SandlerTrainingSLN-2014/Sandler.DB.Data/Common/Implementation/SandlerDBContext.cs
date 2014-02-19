using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Models;
using Solution.Common;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Common.Implementation
{
    public class SandlerDBContext : Disposable, IDBContext
    {
        public System.Data.Entity.DbContext Get()
        {
            DbContext context = new SandlerDBEntities();

            context.Configuration.ProxyCreationEnabled = false;
            return context;
        }
    }
}
