//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sandler.DB.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_Course
    {
        public Tbl_Course()
        {
            this.TBL_CONTACTS = new HashSet<TBL_CONTACTS>();
        }
    
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<System.DateTime> LastUpdatedDate { get; set; }
        public string LastUpdatedBy { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
    
        public virtual ICollection<TBL_CONTACTS> TBL_CONTACTS { get; set; }
    }
}