<%@ Page Title="SalesTotal" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="SalesTotal.aspx.cs" Inherits="Reports_SalesTotal" %>

<%@ Register Src="~/Chart.ascx" TagName="Chart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%; border: 0px solid blue;">
        <tr>
            <td style="width: 30%">
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: center; width: 100%">
                            <b>Sales Total Value (in $000)</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvSalesTotal" runat="server" AutoGenerateColumns="true" GridLines="both"
                                Width="100%" ShowFooter="true" OnRowDataBound="gvSalesTotal_RowDataBound">
                                <RowStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr><td>* May include forecast data</td></tr>
                </table>
            </td>
            <td style="width: 70%">
                <div style="text-align: center">
                    <uc1:Chart ID="Chart1" runat="server" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
