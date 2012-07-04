<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Prod_Sold_By_Company.aspx.cs" Inherits="Prod_Sold_By_Company" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
