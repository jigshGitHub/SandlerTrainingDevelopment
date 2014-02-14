using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Data.Common.Interface
{
    public interface IDBContext
    {
        DbContext Get();
    }
}
