<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <select id="reports" name="reports" size="11" multiple="multiple" style="position: absolute;
        left: 680px; top: 65px;">
        <option value="Product_Leadership">Leadership</option>
        <option value="Product_Sales">Sales</option>
        <option value="Product_Sandler_Online">Sandler Online</option>
        <option value="Product_Negotiations">Negotiations</option>
        <option value="Product_Strategic_Customer_Care">Strategic Customer Care</option>
        <option value="Product_Consulting">Consulting</option>
        <option value="Product_Coaching">Coaching</option>
        <option value="Product_Assessments">Assessments</option>
        <option value="Product_Networking_Works">Networking Works!</option>
        <option value="Product_Strategic_Alliances">Strategic Alliances</option>
        <option value="Product_Corp_Global_Training">Corporate/Global Training</option>
    </select>
    <table width="100%">
        <tr>
            <td width="33%">
                <asp:Literal ID="roiChart" runat="server" />
            </td>
            <td width="34%">
                <asp:Literal ID="gaChart" runat="server" />
            </td>
            <td width="33%">
                <asp:Literal ID="sctChart" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="33%">
                <asp:Literal ID="cosbpChart" runat="server" />
            </td>
            <td width="34%">
                <asp:Literal ID="rrChart" runat="server" />
            </td>
            <td width="33%">
                <asp:Literal ID="prChart" runat="server" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#reports').change(function () {
                //window.location = $(this).val() + ".aspx";
                window.location = "Product_Sales.aspx";
            });
        });
    </script>
</asp:Content>
