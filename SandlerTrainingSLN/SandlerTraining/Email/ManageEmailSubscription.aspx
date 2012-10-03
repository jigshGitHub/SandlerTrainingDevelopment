<%@ Page Title="My Account - Manage Blast Email Subscription" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="ManageEmailSubscription.aspx.cs" Inherits="Email_ManageEmailSubscription" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<table style="white-space:nowrap">
 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
    <th class="tdTC" style="width: 280px" align="left">Manage Your Blast Email Subscription : </th>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td><asp:Label ID="lblEmailSubStatus"  ForeColor="Red" Font-Size="Large" runat="server"></asp:Label></td>
 </tr>


 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Do you wish to receive Blast Email in the future?:&nbsp;&nbsp;
 <asp:RadioButtonList ID="rdbOptions" runat="server"   RepeatDirection="Horizontal"  CellPadding="8" CellSpacing="8"  DataSourceID="NewItemInfoDS" DataTextField="Description" DataValueField="Value"></asp:RadioButtonList>
 <asp:CustomValidator runat="server" ID="cvrdbGroups" ClientValidationFunction="rdbValidations" ErrorMessage="Please select Yes or No to proceed.">*</asp:CustomValidator> 
 </td>
 </tr>

 

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td align="center">
    <asp:Button id="btnUpdateSub" Runat="server" Text="Update Subscription" Style="background-color: #3366cc;
                                color: #FFFFFF; margin-left: 10px" Height="40" Width="140" onclick="btnUpdateSub_Click" ></asp:Button>
 </td></tr>

<tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
  <td>
     <asp:Label CssClass="resultLabel" ID="LblStatus" ForeColor="Red" runat="server"></asp:Label>
  </td>
</tr>

<tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td>
 <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
 </td></tr>


<tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
<td>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
</td>
</tr>


</table> 

</asp:Content>

