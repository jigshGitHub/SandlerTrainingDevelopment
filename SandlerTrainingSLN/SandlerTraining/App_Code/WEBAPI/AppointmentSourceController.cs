using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using SandlerModels;
using SandlerRepositories;
using SandlerModels.DataIntegration;
namespace SandlerAPI.Controllers
{
    [Authorize()]
    public class AppointmentSourceController : ApiController
    {
        public IEnumerable<Tbl_AppointmentsSource> Get()
        {
            return new AppointmentSourceRepository().GetAll().Where(s => s.IsActive == true).AsEnumerable();
        }

        public void PostAppointmentSource(AppointmentSourceVM sourceVM)
        {
            var repository = new AppointmentSourceRepository();
            Tbl_AppointmentsSource apptSource = new Tbl_AppointmentsSource();
            apptSource.ApptSourceName = sourceVM.SourceName;
            apptSource.ColorCode = sourceVM.ColorCode;
            //apptSource.CreatedBy = userId;
            apptSource.CreatedDate = DateTime.Now;
            apptSource.IsActive = true;

            repository.Add(apptSource);
        }
    }
}