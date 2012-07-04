<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Gap_Analysis.aspx.cs" Inherits="Gap_Analysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%">
        <tr>
            <td width="100%" align="center">
                <asp:Literal ID="chartContainer" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
