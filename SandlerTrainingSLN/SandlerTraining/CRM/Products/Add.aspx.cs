using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Collections;
public partial class CRM_Product_Add : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void dvProduct_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Product created Successfully!";

    }
    protected void InsertOperation_Selecting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["_user"] = CurrentUser;
    }
    protected void dvProduct_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Companies/Index.aspx");
        }
    }

    public void dvProduct_ItemCreated(object sender, EventArgs e)
    {
        DetailsView dvProduct = sender as DetailsView;
        DropDownList drpLstColorCodes = dvProduct.FindControl("drpLstColorCodes") as DropDownList;

        KnownColor enumColor = new KnownColor();
        Array Colors = Enum.GetValues(enumColor.GetType());
        ArrayList ALColor = new ArrayList();
        Color knownColor;
        string hexColor;
        foreach (object clr in Colors)
        {
            if (!Color.FromKnownColor((KnownColor)clr).IsSystemColor)
            {
                knownColor = ColorTranslator.FromHtml(clr.ToString());
                hexColor = String.Format("{0:X2}{1:X2}{2:X2}", knownColor.R, knownColor.G, knownColor.B);
                drpLstColorCodes.Items.Add(new ListItem(clr.ToString(), hexColor));
                ALColor.Add(clr.ToString());
            }
        }
        //drpLstColorCodes.DataSource = ALColor;
        //drpLstColorCodes.DataBind();
        //for (int i = 0; i < drpLstColorCodes.Items.Count; i++)
        //{
        //    drpLstColorCodes.Items[i].Attributes.Add("style", "color:" + drpLstColorCodes.Items[i].Text);
        //}
    }

    public void drpLstColorCodesDataBound(object sender, EventArgs e)
    {
        DropDownList drpLstColorCodes = sender as DropDownList;
        foreach (ListItem myItem in drpLstColorCodes.Items)
        {
            //Do some things to determine the color of the item
            //Set the item background-color like so:
            myItem.Attributes.Add("style", "color:#" + myItem.Value);
        }
    }

}