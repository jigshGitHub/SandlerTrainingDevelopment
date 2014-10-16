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
    public partial class FranchiseeView
    {
        public int TotalCount { get; set; }
        public int ID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string Name { get; set; }
        public string WorkEmail { get; set; }
        public string OfficePhone { get; set; }
        public Nullable<DateTime> LastCreatedDate { get; set; }
        public Nullable<DateTime> LastUpdatedDate { get; set; }
    }
}
