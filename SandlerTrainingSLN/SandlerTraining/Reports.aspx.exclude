<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <select id="reports" name="reports" size="15" multiple="multiple" style="position: absolute;
        left: 430px; top: 65px;">
        <option value="Cost_of_Sale">Cost of Sale</option>
        <option value="Gap_Analysis">Gap Analysis</option>
        <option value="IndustryAve">Industry Averages - Benchmark</option>
        <option value="Pipeline_Post_Training">Pipeline Post Training</option>
        <option value="Product_Margin_Contribution">Product Margin Contribution</option>
        <option value="Product_Sales_by_Activity">Product Sales by Activity</option>
        <option value="Prod_Sold_As_Sale">Product Sold as a 1st Sale</option>
        <option value="Prod_Sold_By_Company">Products Sold by Company</option>
        <option value="Prod_Sold_By_Rep">Products Sold by Rep</option>
        <option value="Prospecting">Prospecting Results</option>
        <option value="Revenue_By_Source">Revenue by Source</option>
        <option value="Retention_Rate">Retention Rate</option>
        <option value="Return_On_Trng_Invest">Return on Training Investment</option>
        <option value="Sales_Cycle_Time">Sales Cycle Time</option>
        <option value="Sales_Total_By_Month">Sales Totals by Month</option>
    </select>
    <table width="100%">
        <tr>
            <td width="33%">
                <asp:Literal ID="roiChart" runat="server" />
            </td>
            <td width="34%">
                <asp:Literal ID="gaChart" runat="server" />
            </td>
            <td width="33%">
                <asp:Literal ID="sctChart" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="33%">
                <asp:Literal ID="cosbpChart" runat="server" />
            </td>
            <td width="34%">
                <asp:Literal ID="rrChart" runat="server" />
            </td>
            <td width="33%">
                <asp:Literal ID="prChart" runat="server" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#reports').change(function () {
                window.location = $(this).val() + ".aspx";
            });
        });
    </script>
</asp:Content>
