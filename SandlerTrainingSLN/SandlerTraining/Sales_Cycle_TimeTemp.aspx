<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Sales_Cycle_TimeTemp.aspx.cs" Inherits="Sales_Totals_ByMonth" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table width="100%">
        <tr>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerValue" runat="server" />
            </td>
            <td width="50%" align="center">
                <asp:Literal ID="chartContainerQty" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

