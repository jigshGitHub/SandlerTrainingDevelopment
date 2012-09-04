<%@ Page Title="CRM - Search Documents" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Search.aspx.cs" Inherits="CRM_Documents_Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <table style="width: 50%">
                    <tr>
                        <th class="tdTC" style="width: 100%" align="left">
                            Search Document :
                        </th>
                    </tr>
                    <tr>
                        <td style="width: 50%">
                            <table cellspacing="0" cellpadding="3" rules="cols" id="MainContent_dvOpportunity"
                                style="background-color: White; border-color: #999999; border-width: 1px; border-style: solid;
                                height: 50px; width: 100%; border-collapse: collapse;">
                                <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                    <td style="white-space: nowrap;">
                                        Company :
                                    </td>
                                    <td style="white-space: nowrap;">
                                        <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                            ID="ddlDocumentSearch" runat="server" OnDataBound="ddlCreateDefaultSelection">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                            SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" runat="server">
                                    <td style="white-space: nowrap;">
                                        Name :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tctDocName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr id="Tr1" style="color: Black; background-color: #DCDCDC; white-space: nowrap;"
                                    runat="server">
                                    <td style="white-space: nowrap;">
                                        Status :
                                    </td>
                                    <td style="white-space: nowrap;">
                                        <asp:DropDownList ID="ddlDocStatus" runat="server" DataSourceID="DocStatusDS" DataTextField="DocStatusText"
                                            DataValueField="DocStatusId"  OnDataBound="ddlCreateDefaultSelection" >
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="DocStatusDS" runat="server" TypeName="SandlerRepositories.DocumentsRepository"
                                            SelectMethod="GetDocStatus"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:LinkButton ID="lbtnSearch" runat="server" CausesValidation="True" Text="Search"
                                            ForeColor="Blue" Font-Bold="true" OnClick="lbtnSearch_Click"></asp:LinkButton>&nbsp;&nbsp;
                                        <a id="searchAnchor" href="Index.aspx" style="font-weight: bold">Cancel</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div id="Report" runat="server">
                </div>
            </td>
        </tr>
        <tr>
            <td class="Pager">
                <uc1:Pager ID="pager" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
