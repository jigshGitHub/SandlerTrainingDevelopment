using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sandler.Web.Models
{
    public interface iItemType
    {
    }

    public class genericResponse
    {
        public bool success { get; set; }
        public string message { get; set; }
        public int UniqueId { get; set; }

        public int __count { get; set; }
        public List<iItemType> results { get; set; }
        public string orgfilename{get;set;}
        public string serverfilename { get; set; }
    }
}