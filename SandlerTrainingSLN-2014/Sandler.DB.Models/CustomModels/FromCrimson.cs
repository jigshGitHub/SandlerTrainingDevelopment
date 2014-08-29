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
    //for line chart
    public class initiativeLineCHARTdata
    {
        public int _week { get; set; }
        public DateTime? _batchdte { get; set; }
        public string _date { get; set; }
        public string _date1 { get; set; }
        public int _donationCOUNT { get; set; }
        public decimal _donationDOLLAR { get; set; }
    }

    public class initiativescrollLineCHARTdata
    {
        public DateTime? _date { get; set; }
        public string _monthYear { get; set; }
        public int _signUpCount { get; set; }
        //public int _activityCount { get; set; }
        public int _uniqActivityCount { get; set; }
    }

    //for pie chart
    public class initiativePieCHARTdata
    {
        public Int16 _activityGROUPid { get; set; }
        public string _activityGROUP { get; set; }
        public int _activityCODEid { get; set; }
        public string _activityCODE { get; set; }
        public int _activityYvalue { get; set; }
        public string _activityXlabel { get; set; }
    }

    
}
