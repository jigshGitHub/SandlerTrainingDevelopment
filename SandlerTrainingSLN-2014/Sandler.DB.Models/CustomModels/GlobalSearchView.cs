using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.Models
{
    public partial class GlobalSearchView
    {
        public string RecordType { get; set; }
        public string COMPANYNAME { get; set; }
        public string FranchiseeName { get; set; }
        public string POCName { get; set; }
        public string OppName { get; set; }
        public Nullable<int> RecordId { get; set; }
        public int TotalCount { get; set; }
    }
}
