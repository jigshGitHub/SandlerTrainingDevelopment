using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Sandler.UI
{
    public class jQueryUserControlRequestHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            // We add control in Page tree collection
            using (var dummyPage = new Page())
            {
                dummyPage.Controls.Add(GetControl(context));
                context.Server.Execute(dummyPage, context.Response.Output, true);
            }
        }

        private Control GetControl(HttpContext context)
        {
            // URL path given by load(fn) method on click of button
            string strPath = context.Request.Url.LocalPath;
            UserControl userctrl = null;
            using (var dummyPage = new Page())
            {
                userctrl = dummyPage.LoadControl(strPath) as UserControl;
            }
            // Loaded user control is returned
            return userctrl;
        }

        public bool IsReusable
        {
            get { return true; }
        }
    }
}