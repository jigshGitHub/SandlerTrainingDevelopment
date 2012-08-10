using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pager : System.Web.UI.UserControl
{
    public void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void BindPager(int totalRecords, int pageSize, int currentPage)
    {
        int pageCount = (totalRecords % pageSize > 0) ? ((totalRecords / pageSize) + 1) : totalRecords / pageSize;
        
        Table pagerTable;
        TableRow pagerRow;
        TableCell pagerCell;
        if (pageCount > 1)
        {
            pagerTable = new Table();
            pagerRow = new TableRow();

            for (int index = 1; index <= pageCount; index++)
            {
                pagerCell = new TableCell();
                if (index == currentPage)
                    pagerCell.Text = "<a  class=selected href=index.aspx?currentPage=" + index + ">" + index + "</a>";
                else
                    pagerCell.Text = "<a href=index.aspx?currentPage=" + index + ">" + index + "</a>";

                pagerRow.Cells.Add(pagerCell);
            }

            pagerTable.Rows.Add(pagerRow);

            pagerHolder.Controls.Add(pagerTable);
        }
    }
}