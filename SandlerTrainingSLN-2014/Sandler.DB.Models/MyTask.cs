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
    public partial class MyTaskView 
    {
        public Nullable<DateTime> StartTime { get; set; }

        public Nullable<DateTime> TaskDate { get; set; }

        public string Description { get; set; }

        public string Topic { get; set; }

        public string Phone { get; set; }

        public int UniqueID { get; set; }

        public Nullable<DateTime> NextDay { get; set; }

    }

    
}
