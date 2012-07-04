<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Retention_Rate.aspx.cs" Inherits="RetentionRate" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table width="100%">
        <tr>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerExp" runat="server" />
            </td>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerEff" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

