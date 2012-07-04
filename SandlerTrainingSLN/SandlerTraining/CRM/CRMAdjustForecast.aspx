<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMAdjustForecast.aspx.cs" Inherits="CRMAdjustForecast" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<script type="text/javascript" language="javascript">

    function updateAll()
    {
        //Get Total Values
        var QuotaTotal = eval(document.getElementById("MainContent_txtq2quota").value) + eval(document.getElementById("MainContent_txtq3quota").value) + eval(document.getElementById("MainContent_txtq4quota").value);
        var BestCaseTotal = eval(document.getElementById("MainContent_txtq2Bestcase").value) + eval(document.getElementById("MainContent_txtq3Bestcase").value) + eval(document.getElementById("MainContent_txtq4Bestcase").value);
        var SalesTotal = eval(document.getElementById("MainContent_txtq2Sales").value) + eval(document.getElementById("MainContent_txtq3Sales").value) + eval(document.getElementById("MainContent_txtq4Sales").value);
        //Now update Total
        document.getElementById("MainContent_lblTotalQuota").innerHTML = "$ " + QuotaTotal;
        document.getElementById("MainContent_lblTotalBestCase").innerHTML = "$ " + BestCaseTotal;
        document.getElementById("MainContent_lblTotalSales").innerHTML = "$ " + SalesTotal;
        
    }

</script>

<table id="tblCompany" width="100%">
<tr>

<td colspan="2">
Select Company Name:
<asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" 
        AutoPostBack="True" DataTextField="Company_Name"  DataValueField="ID" 
        ondatabound="ddlCompany_DataBound" onselectedindexchanged="ddlCompany_SelectedIndexChanged">

</asp:DropDownList>
<asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
</td>
</tr>
<tr><td><asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label> </td></tr>
</table>

<table id="tblMain" runat="server"  style="display:none" width="100%">

<tr>
<td>


<table id="tblForcasting" width="100%" border="1"  style="border-color:Black; border-width:1px thin">

<tr align="center">
<td width="20%"></td><td width="20%"></td><td style="font-size:large"><b>Current Foecast</b></td><td width="20%"></td><td width="20%"></td>
</tr>
<tr><td colspan="5"></td></tr>
<tr align="center">
<td><b>Forecast Category</b></td><td><b>Q2 CY2012</b></td><td><b>Q3 CY2012</b></td><td><b>Q4 CY2012</b></td><td><b>Totals</b></td>
</tr>

<tr align="center">
<td>Quota</td>
<td>$<asp:TextBox ID="txtq2quota"  onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq3quota" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq4quota" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td><asp:Label id="lblTotalQuota" runat="server"></asp:Label></td>
</tr>

<tr align="center">
<td>Best Case</td>
<td>$<asp:TextBox ID="txtq2Bestcase" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq3Bestcase" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq4Bestcase" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td><asp:Label id="lblTotalBestCase" runat="server"></asp:Label></td>
</tr>

<tr align="center">
<td>My Salespipeline</td>
<td>$<asp:TextBox ID="txtq2Sales" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq3Sales" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td>$<asp:TextBox ID="txtq4Sales" onblur="updateAll();" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td><asp:Label id="lblTotalSales" runat="server"></asp:Label></td>
</tr>
</table>

<table id="tblBetween"><tr style="height:20px"><td></td></tr></table>

<table id="tblParameters"  width="100%"  border="1" style="border-color:Black; border-width:1px thin">

<tr align="center">
<td width="20%"></td>
<td width="20%">Seasonality Index</td>
<td width="20%">Growth Index</td>
<td width="20%">Trained Sales Rep</td>
<td>Sales Cycle Time</td>
</tr>

<tr align="center">
<td>Forecast Adjustments :</td>
<td><asp:TextBox ID="txtSeasonalityIndex" runat="server"></asp:TextBox></td>
<td><asp:TextBox ID="txtGrowthIndex" runat="server"></asp:TextBox></td>
<td><asp:TextBox ID="txtTrainedSalesRep" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox></td>
<td><asp:TextBox ID="txtSalesCycleTime" runat="server"></asp:TextBox></td>
</tr>

<tr><td colspan="5"></td></tr>

<tr align="center"><td colspan="5"><asp:Button ID="btnUpdate" CssClass="menuButton"  Text="Update Forecast"  runat="server" onclick="btnUpdate_Click" /></td></tr>

</table> 


</td>
</tr>
</table>

</asp:Content>

