using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SandlerWeb = Sandler.Web;
using System.Web.UI.HtmlControls;
public partial class CRM_EntityMenu : System.Web.UI.UserControl
{
    public string MenuEntityTitle;
    public SandlerWeb.Menu MenuEntity
    {
        get
        {
            return ViewState["MenuEntity"] as SandlerWeb.Menu;
        }
        set
        {
            ViewState["MenuEntity"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BasePage page = this.Page as BasePage;
            if (page.CRMMenu != null)
            {
                MenuEntity = page.CRMMenu.Find(delegate(SandlerWeb.Menu menu) { return menu.Title == MenuEntityTitle; });
                CreateSubMenu(MenuEntity.Items);
            }
        }
    }

    private void CreateSubMenu(List<SandlerWeb.MenuItem> items)
    {
        HtmlAnchor link;
        Literal pipeLiteral;

        foreach (SandlerWeb.MenuItem item in items)
        {
            if (item.IsVisible)
            {
                link = new HtmlAnchor();
                link.InnerText = item.Text;
                link.HRef = item.Link;
                pnlSubMenu.Controls.Add(link);
                if (items.Last() != item)
                {
                    pipeLiteral = new Literal();
                    pipeLiteral.Text = " | ";
                    pnlSubMenu.Controls.Add(pipeLiteral);
                }
            }
        }
    }

    public void ReLoadSubMenu()
    {
        pnlSubMenu.Controls.Clear();
        CreateSubMenu(MenuEntity.Items);
    }
}