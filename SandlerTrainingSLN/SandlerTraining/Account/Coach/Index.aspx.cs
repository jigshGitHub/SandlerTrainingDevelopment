using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using SandlerViewModels;
using SandlerRepositories;
using SandlerData;
using System.Configuration;
public partial class Account_Coach_Index : System.Web.UI.Page
{
    protected int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                ViewState["CurrentPage"] = 1;
            }
            return int.Parse(ViewState["CurrentPage"].ToString());
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    protected int PageSize
    {
        get
        {
            if (ViewState["PageSize"] == null)
            {
                ViewState["PageSize"] = ConfigurationManager.AppSettings["DefaultPageSize"];
            }
            return int.Parse(ViewState["PageSize"].ToString());
        }
        set
        {
            ViewState["PageSize"] = value;
        }
    }
    protected string SortExpression
    {
        get
        {
            if (ViewState["SortExpression"] == null)
            {
                ViewState["SortExpression"] = "ID";
            }
            return ViewState["SortExpression"].ToString();
        }
        set
        {
            ViewState["SortExpression"] = value;
        }
    }
    protected string SortDirection
    {
        get
        {
            if (ViewState["SortDirection"] == null)
            {
                ViewState["SortDirection"] = "ASC";
            }
            return ViewState["SortDirection"].ToString();
        }
        set
        {
            ViewState["SortDirection"] = value;
        }
    }
    protected int TotalRecords
    {
        get
        {
            return int.Parse(ViewState["TotalRecords"].ToString());
        }
        set
        {
            ViewState["TotalRecords"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["currentPage"]))
                CurrentPage = int.Parse(Request.QueryString["currentPage"]);
            BindCoachUsers();
        }

    }

    private void BindCoachUsers()
    {

        IQueryable<Coach> coachCollection = null;
        try
        {

            CoachRepository coaches = new CoachRepository();
            UsersRepository users = new UsersRepository();
            MembershipRepository memberships = new MembershipRepository();
            RegionRepository regions = new RegionRepository();
            coachCollection = from coach in coaches.GetAll().Where(c => c.IsActive == true).AsQueryable()
                              from user in users.GetAll().Where(u => u.UserId == coach.UserID).AsQueryable()
                              from membership in memberships.GetAll().Where(m => m.IsApproved == true && m.UserId == user.UserId).AsQueryable()
                              from region in regions.GetAll().Where(r => r.IsActive == true && r.ID == coach.RegionID).AsQueryable()
                              select new Coach
                              {
                                  ADDRESS = coach.ADDRESS,
                                  City = coach.City,
                                  CreatedByCorporateID = (coach.CreatedBy.HasValue) ? coach.CreatedBy.ToString() : "",
                                  Email = membership.Email,
                                  IsEmailSubscribtion = (coach.IsEmailSubscribtion.HasValue) ? coach.IsEmailSubscribtion.Value : false,
                                  FirstName = coach.FirstName,
                                  ID = coach.ID,
                                  LastName = coach.LastName,
                                  PhoneNumber = coach.PhoneNumber,
                                  RegionName = region.Name,
                                  State = coach.State,
                                  UserName = user.UserName,
                                  Zip = coach.Zip
                              };

            TotalRecords = coachCollection.Count();

            gvCoaches.DataSource = IQueryableExtensions.Page(coachCollection, PageSize, CurrentPage).AsQueryable();  
            gvCoaches.DataBind();


            pager.BindPager(TotalRecords, PageSize, CurrentPage);
        }
        catch (Exception ex)
        {
        }
    }
}