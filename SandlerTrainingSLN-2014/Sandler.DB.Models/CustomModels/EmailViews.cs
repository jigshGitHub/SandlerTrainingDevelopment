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
    
    public partial class EmailAddressInfo 
    {
       public string Email { get; set; }
    }

    public partial class CoachEmailInfo
    {
        public Guid CoachID { get; set; }

        public string CoachEmail { get; set; }
    }

    public partial class ContactEmailInfo
    {
        public string Fullname { get; set; }

        public string Email { get; set; }

        public int ContactsId { get; set; }
    }

    public partial class FranchiseeEmailInfo
    {
        public Guid UserId { get; set; }

        public string Email { get; set; }
    }

    public partial class BlastEmailGroupInfo
    {
        public int Id { get; set; }
        public int BlastGroupName { get; set; }
    }

    

    


}
