using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sandler.DB.CustomModels
{
    public class ClosedSalesAnalysis
    {
        public Nullable<decimal> Value { get; set; }
        public string AnalysisType { get; set; }
    }
    public class PipelineAnalysis
    {
        public Nullable<decimal> Value { get; set; }
        public string AnalysisType { get; set; }
    }
}
