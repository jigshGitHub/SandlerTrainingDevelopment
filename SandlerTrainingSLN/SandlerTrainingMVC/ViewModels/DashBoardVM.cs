using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SandlerTrainingMVC.Models;

namespace SandlerTrainingMVC.ViewModels
{
    public class DashBoardVM
    {
        public Chart Chart;

        public DashBoardVM()
        {
            
        }
        public DashBoardVM(Chart chart)
        {
            Chart = chart;
        }
    }
}