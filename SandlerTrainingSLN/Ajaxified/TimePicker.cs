using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using System.Web.UI.Design;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using System.Web;
using System.Reflection;
using System.Drawing;

[assembly: WebResource("Ajaxified.TimePicker.js", "application/x-javascript", PerformSubstitution = true)]
[assembly: WebResource("Ajaxified.TimePicker.css", "text/css", PerformSubstitution = true)]
[assembly: WebResource("Ajaxified.images.close.gif", "image/gif")]
[assembly: WebResource("Ajaxified.images.timepicker_off.gif", "image/gif")]
[assembly: WebResource("Ajaxified.images.timepicker_on.gif", "image/gif")]

namespace Ajaxified
{
    [ToolboxData("<{0}:TimePicker runat=server></{0}:TimePicker>")]
    [ToolboxBitmap(typeof(TimePicker), "Ajaxified.TimePicker.ico")]
    [TargetControlType(typeof(TextBox))]
    public class TimePicker : ExtenderControl
    {
        public TimePicker()
            : base()
        {
            ApplyDefaultValues();
        }

        protected override IEnumerable<ScriptDescriptor> GetScriptDescriptors(Control targetControl)
        {
            ScriptControlDescriptor descriptor = new ScriptControlDescriptor("Ajaxified.TimePicker", targetControl.ClientID);

            descriptor.AddProperty("CssClass", CssClass);
            descriptor.AddProperty("HeaderCssClass", HeaderCssClass);
            descriptor.AddProperty("TitleCssClass", TitleCssClass);
            descriptor.AddProperty("TabCssClass", TabCssClass);
            descriptor.AddProperty("SelectedTabCssClass", SelectedTabCssClass);
            descriptor.AddProperty("ItemCssClass", ItemCssClass);
            descriptor.AddProperty("SelectedItemCssClass", SelectedItemCssClass);
            descriptor.AddProperty("CloseOnSelection", CloseOnSelection);
            descriptor.AddProperty("MinuteStep", MinuteStep);

            if (OnClientShowing != string.Empty)
                descriptor.AddEvent("showing", OnClientShowing);
            if (OnClientShown != string.Empty)
                descriptor.AddEvent("shown", OnClientShown);
            if (OnClientHiding != string.Empty)
                descriptor.AddEvent("hiding", OnClientHiding);
            if (OnClientHidden != string.Empty)
                descriptor.AddEvent("hidden", OnClientHidden);
            if (OnClientSelectionChanged != string.Empty)
                descriptor.AddEvent("selectionChanged", OnClientSelectionChanged);

            yield return descriptor;
        }

        protected override IEnumerable<ScriptReference> GetScriptReferences()
        {
            yield return new ScriptReference(Page.ClientScript.GetWebResourceUrl(this.GetType(), "Ajaxified.TimePicker.js"));
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_default")]
        public string CssClass
        {
            get { return (String)(ViewState["CssClass"] ?? String.Empty); }
            set { ViewState["CssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_header_default")]
        public string HeaderCssClass
        {
            get { return (String)(ViewState["HeaderCssClass"] ?? String.Empty); }
            set { ViewState["HeaderCssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_title_default")]
        public string TitleCssClass
        {
            get { return (String)(ViewState["TitleCssClass"] ?? String.Empty); }
            set { ViewState["TitleCssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_tab")]
        public string TabCssClass
        {
            get { return (String)(ViewState["TabCssClass"] ?? String.Empty); }
            set { ViewState["TabCssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_selectedtab")]
        public string SelectedTabCssClass
        {
            get { return (String)(ViewState["SelectedTabCssClass"] ?? String.Empty); }
            set { ViewState["SelectedTabCssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_item")]
        public string ItemCssClass
        {
            get { return (String)(ViewState["ItemCssClass"] ?? String.Empty); }
            set { ViewState["ItemCssClass"] = value; }
        }

        [NotifyParentProperty(true)]
        [CssClassProperty]
        [DefaultValue("_ajaxified_timepicker_selected_item")]
        public string SelectedItemCssClass
        {
            get { return (String)(ViewState["SelectedItemCssClass"] ?? String.Empty); }
            set { ViewState["SelectedItemCssClass"] = value; }
        }

        [Browsable(true)]
        [Category("Appearance")]
        [Description("")]
        internal string OnClientShowing
        {
            get { return (string)(ViewState["OnClientShowing"] ?? string.Empty); }
            set { ViewState["OnClientShowing"] = value; }
        }

        [Browsable(true)]
        [Category("Appearance")]
        [Description("")]
        internal string OnClientShown
        {
            get { return (string)(ViewState["OnClientShown"] ?? string.Empty); }
            set { ViewState["OnClientShown"] = value; }
        }

        [Browsable(true)]
        [Category("Appearance")]
        [Description("")]
        internal string OnClientHiding
        {
            get { return (string)(ViewState["OnClientHiding"] ?? string.Empty); }
            set { ViewState["OnClientHiding"] = value; }
        }

        [Browsable(true)]
        [Category("Appearance")]
        [Description("")]
        internal string OnClientHidden
        {
            get { return (string)(ViewState["OnClientHidden"] ?? string.Empty); }
            set { ViewState["OnClientHidden"] = value; }
        }

        [Browsable(true)]
        [Category("Appearance")]
        [Description("")]
        internal string OnClientSelectionChanged
        {
            get { return (string)(ViewState["OnClientSelectionChanged"] ?? string.Empty); }
            set { ViewState["OnClientSelectionChanged"] = value; }
        }

        [NotifyParentProperty(true)]
        [DefaultValue(false)]
        public bool CloseOnSelection
        {
            get { return (bool)(ViewState["CloseOnSelection"] ?? String.Empty); }
            set { ViewState["CloseOnSelection"] = value; }
        }

        [NotifyParentProperty(true)]
        [DefaultValue(15)]
        public int MinuteStep
        {
            get { return (int)(ViewState["MinuteStep"] ?? 15); }
            set
            {
                if (value < 5 || value > 30 || value % 5 != 0)
                    throw new ApplicationException("value should lie between 5 and 30 and be a multiple of 5");

                ViewState["MinuteStep"] = value;
            }
        }

        #region Render Phase
        private void RenderCssReference()
        {
            string cssUrl = Page.ClientScript.GetWebResourceUrl(this.GetType(), "Ajaxified.TimePicker.css");

            HtmlLink link = new HtmlLink();
            link.Href = cssUrl;
            link.Attributes.Add("type", "text/css");
            link.Attributes.Add("rel", "stylesheet");
            Page.Header.Controls.Add(link);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            RenderCssReference();
        }
        #endregion

        private void ApplyDefaultValues()
        {
            foreach (PropertyInfo prop in this.GetType().GetProperties(BindingFlags.DeclaredOnly | BindingFlags.Public | BindingFlags.Instance))
            {
                object[] attr = prop.GetCustomAttributes(typeof(DefaultValueAttribute), false);
                if (attr == null || attr.Length == 0) continue;
                DefaultValueAttribute defaultAttribute = attr[0] as DefaultValueAttribute;
                if (defaultAttribute == null || defaultAttribute.Value == null) continue;
                prop.SetValue(this, defaultAttribute.Value, null);
            }
        }
    }
}
