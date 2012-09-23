using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Collections;

public partial class ColorCode : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KnownColor enumColor = new KnownColor();
            Array Colors = Enum.GetValues(enumColor.GetType());
            ArrayList ALColor = new ArrayList();
            Color knownColor;
            string hexColor;
            ListItem item;
            try
            {
                foreach (object clr in Colors)
                {
                    if (!Color.FromKnownColor((KnownColor)clr).IsSystemColor)
                    {
                        knownColor = ColorTranslator.FromHtml(clr.ToString());
                        hexColor = String.Format("{0:X2}{1:X2}{2:X2}", knownColor.R, knownColor.G, knownColor.B);
                        item = new ListItem(clr.ToString(), hexColor);
                        item.Attributes.Add("style", "color:#" + hexColor);
                        drpLstColorCodes.Items.Add(item);
                        ALColor.Add(clr.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}