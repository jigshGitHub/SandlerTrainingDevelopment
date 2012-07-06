<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMAccounts.aspx.cs" Inherits="CRMAccounts" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table id="tblMain" width="100%">
<tr>
<td><b>View Account :</b></td>
<td align="right">
    <asp:LinkButton id="btnAddAccount" runat="server" Font-Size="Large" onclick="btnAddAccount_Click" ForeColor="blue">Add New Account</asp:LinkButton>
</td>
</tr>
<tr><td colspan="2"></td></tr>
<tr>
<td colspan="2">
<asp:GridView  Width="100%" ID="gvAccounts" runat="server" DataSourceID="AccountDS" AutoGenerateColumns="False"
DataKeyNames="ID" AllowSorting="true" AllowPaging="true" PageSize="20" 
        onselectedindexchanged="gvAccounts_SelectedIndexChanged"
         ondatabound="gvAccounts_DataBound">
         <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
         
<Columns> 
    <asp:BoundField DataField="ID" visible="False"/>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Account_Name" HeaderText="Account Name" SortExpression="Account_Name" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Company_Name" HeaderText="Company" SortExpression="Company_Name" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" SortExpression="Product" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue"  DataField="Sales_Rep" HeaderText="Sales Rep" SortExpression="Sales_Rep" />
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  HeaderStyle-ForeColor="Blue" DataField="Account_Value" HeaderText="Total Account Value" SortExpression="Account_Value" DataFormatString="{0:C}"/>
    <asp:TemplateField ShowHeader="False">
         <ControlStyle ForeColor="Maroon" />
         <ItemTemplate>
             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                 Text="View Detail.."></asp:LinkButton>
         </ItemTemplate>
     </asp:TemplateField>
    
</Columns> 
</asp:GridView> 
</td>
</tr>
<tr><td  colspan="2"><asp:Label  ForeColor="Red" ID="LblStatus" runat="server"></asp:Label></td></tr>
<tr>
<td colspan="2">
<asp:ObjectDataSource ID="AccountDS" Runat="server" TypeName="SandlerRepositories.AccountsRepository" SelectMethod="GetAll"></asp:ObjectDataSource>
<asp:HiddenField ID="hidAccountID" runat="server" /> 
</td>
</tr>
</table>
</asp:Content>

