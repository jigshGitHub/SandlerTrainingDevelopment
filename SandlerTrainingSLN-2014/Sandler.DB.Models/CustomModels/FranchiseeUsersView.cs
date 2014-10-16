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
    public partial class FranchiseeUsersView
    {
        public int TotalCount { get; set; }
        public int ID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string FranchiseeName { get; set; }
        public Guid UserId{ get; set; }
		public string UserName{ get; set; }
        public int FranchiseeID { get; set; }
    }
}
