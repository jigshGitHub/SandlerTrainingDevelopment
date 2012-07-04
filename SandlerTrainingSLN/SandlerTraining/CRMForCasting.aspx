<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMForCasting.aspx.cs" Inherits="CRMForCasting" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table id="tblCompany" width="100%">
<tr>

<td>
Select Company Name:
<asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" 
        AutoPostBack="True" DataTextField="Company_Name"  DataValueField="ID" 
        ondatabound="ddlCompany_DataBound" onselectedindexchanged="ddlCompany_SelectedIndexChanged">

</asp:DropDownList>
<asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
</td>
<td align="right">
    <asp:LinkButton id="btnChangeForecast" runat="server" Font-Size="Large" onclick="btnChangeForecast_Click" ForeColor="blue">Adust Forecast Index</asp:LinkButton>
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

<tr  align="center">
<td>Quota</td>
<td>$<asp:Label ID="lblq2quota" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq3quota" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq4quota" runat="server"></asp:Label></td>
<td>$<asp:Label id="lblTotalQuota" runat="server"></asp:Label></td>
</tr>

<tr  align="center">
<td>Best Case</td>
<td>$<asp:Label ID="lblq2Bestcase" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq32Bestcase" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq4Bestcase" runat="server"></asp:Label></td>
<td>$<asp:Label id="lblTotalBestCase" runat="server"></asp:Label></td>
</tr>

<tr align="center">
<td>My Salespipeline</td>
<td>$<asp:Label ID="lblq2Sales" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq3Sales" runat="server"></asp:Label></td>
<td>$<asp:Label ID="lblq4Sales" runat="server"></asp:Label></td>
<td>$<asp:Label id="lblTotalSales" runat="server"></asp:Label></td>
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
<td><asp:Label ID="lblSeasonalityIndex" runat="server"></asp:Label></td>
<td><asp:Label ID="lblGrowthIndex" runat="server"></asp:Label></td>
<td><asp:Label ID="lblTrainedSalesRep" runat="server"></asp:Label></td>
<td><asp:Label ID="lblSalesCycleTime" runat="server"></asp:Label></td>
</tr>

</table> 


</td>
</tr>
</table>


</asp:Content>

