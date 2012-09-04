<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CRMSubmenu.ascx.cs" Inherits="CRMSubmenu" %>
<asp:Panel ID="pnlCrmSubMenu" runat="server" Visible="false">
    <table class="CRMSubMenus" align="center">
        <tr>
            <td align="center">
                <a href="<%= Page.ResolveClientUrl("~/CRM/Companies/Index.aspx") %>">Companies</a>
            </td>
            <td align="center">
                <a href="<%= Page.ResolveClientUrl("~/CRM/Contacts/Index.aspx") %>">Contacts</a>
            </td>
            <td align="center">
                <a href="<%= Page.ResolveClientUrl("~/CRM/Opportunities/Index.aspx") %>">Opportunities</a>
            </td>
            <td align="center">
                <a href="<%= Page.ResolveClientUrl("~/CRM/Documents/Index.aspx") %>">Documents</a>
            </td>
        </tr>
    </table>
</asp:Panel>
