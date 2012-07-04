using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SandlerControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ChartLiteral runat=server></{0}:ChartLiteral>")]
    public class ChartLiteral : Literal
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Text
        {
            get
            {
                String s = (String)ViewState["Text"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Text"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string SWFFile
        {
            get
            {
                String s = (String)ViewState["SWFFile"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["SWFFile"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Height
        {
            get
            {
                String s = (String)ViewState["Height"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Height"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Width
        {
            get
            {
                String s = (String)ViewState["Width"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Width"] = value;
            }
        }

        protected override void Render(HtmlTextWriter output)
        {
            //base.Render(output);
            output.Write(Text);
        }
    }
}
