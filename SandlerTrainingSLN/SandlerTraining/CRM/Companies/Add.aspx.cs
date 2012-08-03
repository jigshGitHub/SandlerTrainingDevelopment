using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCompany : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }

    }
    protected void dvCompany_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        lblResult.Text = "Company created Successfully!";

    }
    protected void dvCompany_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            Response.Redirect("~/CRM/Companies/Index.aspx");
        }
    }

    protected void dvCompany_DataBound(object sender, EventArgs e)
    {
        //For ProductDDL
        //DropDownList productDropDownList = new DropDownList();
        //productDropDownList = (DropDownList)dvCompany.FindControl("ddlProduct");
        //if ((productDropDownList != null))
        //{
        //    ListItem selectItem = new ListItem("--Select Product--", "0");
        //    productDropDownList.Items.Insert(0, selectItem);
        //}

        //For IndustryDDL
        DropDownList industryDropDownList = new DropDownList();
        industryDropDownList = (DropDownList)dvCompany.FindControl("ddlIndustry");
        if ((industryDropDownList != null))
        {
            ListItem selectItem = new ListItem("--Select Industry--", "0");
            industryDropDownList.Items.Insert(0, selectItem);
        }

    }


}