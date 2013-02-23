using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using SandlerModels;
using SandlerRepositories;
using SandlerData;
using System.Linq;

public partial class Calendar_Index : BasePage
{

    protected void dvFollowupItem_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        if (e.CancelingEdit)
        {
            //Clear entered Items in the Details View
            //For FollowUpDate
            TextBox FollowUpDateCal = new TextBox();
            FollowUpDateCal = (TextBox)dvFollowupItem.FindControl("FollowUpDate");
            if ((FollowUpDateCal != null))
            {
                FollowUpDateCal.Text = "";
            }
            //For Description
            TextBox Descriptiontxt = new TextBox();
            Descriptiontxt = (TextBox)dvFollowupItem.FindControl("txtDescription");
            if ((Descriptiontxt != null))
            {
                Descriptiontxt.Text = "";
            }
            //For Phone
            TextBox Phonetxt = new TextBox();
            Phonetxt = (TextBox)dvFollowupItem.FindControl("txtPhone");
            if ((Phonetxt != null))
            {
                Phonetxt.Text = "";
            }

        }
    }

    protected void dvFollowupItem_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string Description = "";
        string Phone = "";
        System.DateTime FollowUpDate = default(System.DateTime);
        
        //For FollowUpDate
        TextBox FollowUpDateCal = new TextBox();
        FollowUpDateCal = (TextBox)dvFollowupItem.FindControl("FollowUpDate");
        if ((FollowUpDateCal != null))
        {
            if (!string.IsNullOrEmpty(FollowUpDateCal.Text))
            {
                FollowUpDate = Convert.ToDateTime(FollowUpDateCal.Text.Trim());
            }

        }
        //For Description
        TextBox Descriptiontxt = new TextBox();
        Descriptiontxt = (TextBox)dvFollowupItem.FindControl("txtDescription");
        if ((Descriptiontxt != null))
        {
            if (!string.IsNullOrEmpty(Descriptiontxt.Text))
            {
                Description = Descriptiontxt.Text.Trim();
            }

        }
        //For Phone
        TextBox Phonetxt = new TextBox();
        Phonetxt = (TextBox)dvFollowupItem.FindControl("txtPhone");
        if ((Phonetxt != null))
        {
            if (!string.IsNullOrEmpty(Phonetxt.Text))
            {
                Phone = Phonetxt.Text.Trim();
            }

        }

        if (!e.Cancel)
        {
            new SandlerRepositories.CalendarRepository().Add(FollowUpDate,Description,Phone,CurrentUser);
            lblResult.Text = "Followup Item added Successfully for " + FollowUpDateCal.Text.Replace("12:00:00 AM", "")+" !";
            //Clear exisitng entry for Description and Phone
            Phonetxt.Text = "";
            Descriptiontxt.Text = "";
            //Rebind the Calendar 
            GetDataAndDisplay();
        }
        
    }
    
    private DataTable GetEvents()
    {
        //Get Events Info for logged in User
        System.Data.DataSet ds = new SandlerRepositories.CalendarRepository().GetAllEvents(CurrentUser);
        //return the datatable from above dataset                
        return ds.Tables[0];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        GetDataAndDisplay();
    }

    private void GetDataAndDisplay()
    {
        gvSelectedDateEvents.Visible = false;
        lblInfo.Text = "";
        EventCal.Date = "Date";
        EventCal.Description = "Description";
        EventCal.Phone = "Phone";
        //Bind the result and display the calendar info
        EventCal.EventSource = GetEvents();
    }

    protected void EventCal_SelectionChanged(object sender, EventArgs e)
    {
        SelectedDatesCollection theDates = EventCal.SelectedDates;
        DataTable dtSelectedDateEvents = EventCal.EventSource.Clone();
        DataRow dr;

        foreach (DataRow drEvent in EventCal.EventSource.Rows)
            foreach (DateTime selectedDate in theDates)
                if (selectedDate.Date == (Convert.ToDateTime(drEvent[EventCal.Date])).Date)
                {
                    //let us have a row
                    dr = dtSelectedDateEvents.NewRow();
                    //add cells in the row
                    dr[EventCal.Date] = drEvent[EventCal.Date];
                    dr[EventCal.Description] = drEvent[EventCal.Description];
                    dr[EventCal.Phone] = drEvent[EventCal.Phone];
                    //add row to the table
                    dtSelectedDateEvents.Rows.Add(dr);
                }

        if (dtSelectedDateEvents.Rows.Count > 0)
        {
            #region Commented Code
            ////Bind the grid and show the details
            //CurrentPage = 1;
            ////Get data from the table
            //var data = from record in dtSelectedDateEvents.AsEnumerable().AsQueryable()
            //           select new { Date = Convert.ToDateTime(record[0].ToString()), Description = record[1].ToString(), Phone = record[2].ToString() };
            ////Count Total Records
            //TotalRecords = data.Count();
            ////Bind the Grid
            //gvSelectedDateEvents.DataSource = IQueryableExtensions.Page(data, PageSize, CurrentPage).AsQueryable();
            //gvSelectedDateEvents.DataBind();
            ////For Pager
            //pager.BindPager(TotalRecords, PageSize, CurrentPage);
            #endregion
            gvSelectedDateEvents.DataSource = dtSelectedDateEvents;
            gvSelectedDateEvents.DataBind();
            gvSelectedDateEvents.Visible = true;
            lblInfo.Text = "To do list for " + theDates[0].ToString().Replace("12:00:00 AM","") + " :" ;
        }
        else
        {
            gvSelectedDateEvents.Visible = false;
            lblInfo.Text = "To do List is empty for " + theDates[0].ToString().Replace("12:00:00 AM", "") + ".";
            lblInfo.ForeColor = System.Drawing.Color.Red;
        }
        
    }
}