<%@ Page Title="CRM - Search Documents" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="CRM_Documents_Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="pnlSearch" runat="server">
                    <table style="width: 50%">
                        <tr>
                            <th class="tdTC" style="width: 100%" align="left">
                                Search Opportunity :
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
                                    <tr id="Tr1" style="color: Black; background-color: #DCDCDC; white-space: nowrap;"
                                        runat="server">
                                        <td style="white-space: nowrap;">
                                            Name :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tctDocName" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="Tr2" style="color: Black; background-color: #DCDCDC; white-space: nowrap;"
                                        runat="server">
                                        <td style="white-space: nowrap;">
                                            Status :
                                        </td>
                                        <td style="white-space: nowrap;">
                                            <asp:DropDownList ID="ddlDocStatus" runat="server" DataSourceID="DocStatusDS" DataTextField="DocStatusText"
                                                DataValueField="DocStatusId" OnDataBound="ddlCreateDefaultSelection">
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
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlResults" runat="server" Visible="false">
                    <asp:HiddenField ID="hidDocumentID" runat="server" />
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 100%" align="right" colspan="2">
                                <a href="Search.aspx">Back To Search</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />
                            </td>
                            <td align="right">
                                <asp:Label ID="lblResultsCount" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView Width="100%" ID="gvDocuments" runat="server"
                                    AutoGenerateColumns="False" DataKeyNames="docsid" AllowSorting="True" AllowPaging="True"
                                    PageSize="20" OnSelectedIndexChanged="gvDocuments_SelectedIndexChanged" OnDataBound="gvDocuments_DataBound"
                                    OnRowDataBound="gvDocuments_RowDataBound">
                                    <PagerStyle CssClass="gvPager" />
                                    <Columns>
                                        <asp:TemplateField Visible="false">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnDocFullName" runat="server" Value='<%# Eval("docFullName") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document Name" SortExpression="DocName">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="ModuleLink" runat="server" Target="_blank" ForeColor="Blue" Text='<%# Eval("DocName") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="docsid" Visible="False" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="CompanyName" HeaderStyle-ForeColor="Blue"
                                            HeaderText="Company Name" SortExpression="CompanyName">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="OppName" HeaderStyle-ForeColor="Blue"
                                            HeaderText="Opportunity Name" SortExpression="OppName">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="DocStatusText" HeaderText="Document Status"
                                            HeaderStyle-ForeColor="Blue" SortExpression="DocStatusText">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="updateddate" HeaderText="Last Modify Date"
                                            HeaderStyle-ForeColor="Blue" SortExpression="updateddate" DataFormatString="{0:d}">
                                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                    Text="View Detail.."></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="Pager">
                                <uc1:Pager ID="pager" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Panel ID="pnlExport" runat="server" Visible="false">
                                    <asp:GridView Width="100%" ID="gvExport" runat="server" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField Visible="false">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hdnDocFullName" runat="server" Value='<%# Eval("docFullName") %>' />
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Document Name" SortExpression="DocName">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="ModuleLink" runat="server" Target="_blank" ForeColor="Blue" Text='<%# Eval("DocName") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="docsid" Visible="False" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="CompanyName" HeaderStyle-ForeColor="Blue"
                                                HeaderText="Company Name" SortExpression="CompanyName">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="OppName" HeaderStyle-ForeColor="Blue"
                                                HeaderText="Opportunity Name" SortExpression="OppName">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="DocStatusText" HeaderText="Document Status"
                                                HeaderStyle-ForeColor="Blue" SortExpression="DocStatusText">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="updateddate" HeaderText="Last Modify Date"
                                                HeaderStyle-ForeColor="Blue" SortExpression="updateddate" DataFormatString="{0:d}">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                        Text="View Detail.."></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
