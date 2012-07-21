<%@ Page Title="CRM - View Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMCompanies.aspx.cs" Inherits="UpdatedCRM_CRMCompanies" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table id="tblMain" width="100%">
<tr>
<td><b>View Company :</b></td>
<td align="right">
    <asp:LinkButton id="btnAddCompany" runat="server" Font-Size="Large" onclick="btnAddCompany_Click" ForeColor="blue">Add New Company</asp:LinkButton>
</td>
</tr>
<tr><td colspan="2"></td></tr>
<tr>
<td colspan="2">
<asp:GridView  Width="100%" ID="gvCompanies" runat="server" DataSourceID="CompanyDS" AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true" PageSize="20" 
        onselectedindexchanged="gvCompanies_SelectedIndexChanged" ondatabound="gvCompanies_DataBound">
         <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
         
<Columns> 
    <asp:BoundField DataField="COMPANIESID" visible="False"/>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME" HeaderText="Company Name" SortExpression="COMPANYNAME" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Industry" HeaderText="Product" SortExpression="Industry" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" SortExpression="Product" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue"  DataField="Representative" HeaderText="Sandler Rep" SortExpression="Representative" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue" HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}"/>
    <asp:TemplateField ShowHeader="False">
    <ControlStyle ForeColor="Maroon" />
         <ItemTemplate>
             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="View Detail.."></asp:LinkButton>
         </ItemTemplate>
    </asp:TemplateField>
</Columns> 
</asp:GridView> 
</td>
</tr>
<tr><td colspan="2"><asp:Label  ForeColor="Red" ID="LblStatus" runat="server"></asp:Label></td></tr>
<tr>
<td colspan="2">
<asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllCompanies">
 <SelectParameters>
    <asp:SessionParameter  Name="CurrentUser" SessionField="CurrentUser" Type="object" />   
 </SelectParameters> 
</asp:ObjectDataSource>
<asp:HiddenField ID="hidCompanyID" runat="server" /> 
</td>
</tr>
</table>
</asp:Content>


