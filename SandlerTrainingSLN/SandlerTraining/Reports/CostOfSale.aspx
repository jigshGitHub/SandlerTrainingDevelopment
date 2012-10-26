<%@ Page Title="Reports-CostOfSale" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="CostOfSale.aspx.cs" Inherits="Reports_CostOfSale" %>

<%@ Register Src="~/Chart.ascx" TagName="Chart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table style="width: 100%; border: 0px solid blue;">
        <tr>
            <td style="width: 40%">
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: center; width:100%">
                            <b>Cost of Sale (in $000)</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="gvCOS" runat="server" AutoGenerateColumns="false" GridLines="none"
                                Width="100%" ShowFooter="true" OnRowDataBound="gvCOS_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="ProductName" HeaderText="Product" ItemStyle-Width="55%" />
                                    <asp:BoundField DataField="Revenue" HeaderText="Revenue" DataFormatString="{0:C}"
                                        ItemStyle-Width="15%" ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Cost" HeaderText="Cost" DataFormatString="{0:C}" ItemStyle-Width="15%"
                                        ItemStyle-HorizontalAlign="Right" />
                                    <asp:BoundField DataField="Profit" HeaderText="Profit" DataFormatString="{0:C}" ItemStyle-Width="15%"
                                        ItemStyle-HorizontalAlign="Right" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <div style="text-align: center">
                    <uc1:Chart ID="Chart1" runat="server" />
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
