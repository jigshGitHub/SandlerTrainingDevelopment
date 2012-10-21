using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels.DataIntegration
{

    public class AppointmentSourceVM
    {
        public int ApptSourceId { get; set; }
        public string SourceName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
        public string ColorCode { get; set; }
    }

    public class ProductTypeVM
    {
        public int Id { get; set; }
        public string ProductTypeName { get; set; }
        public bool IsActive { get; set; }
        public int FranchiseeId { get; set; }
        public int Count { get; set; }
        public double AvgPrice { get; set; }
    }

    public partial class CourseVM
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
    }

    public partial class IndustryVM
    {
        public int IndId { get; set; }
        public string IndustryTypeName { get; set; }
        public bool IsActive { get; set; }
        public int Count { get; set; }
        public int Months { get; set; }
    }

    public partial class CostOfSaleVM
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal Cost { get; set; }
        public decimal Revenue { get; set; }
        public decimal Profit
        {
            get
            {
                return (Revenue - Cost);
            }
        }
    }
}
