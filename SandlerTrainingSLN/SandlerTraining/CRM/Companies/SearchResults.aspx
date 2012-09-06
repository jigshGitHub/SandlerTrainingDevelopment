<%@ Page Title="CRM - Search Results - Company" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="SearchResults.aspx.cs"
    Inherits="CRM_Companies_SearchResults" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <th colspan="2" class="tdTC" align="left">
                Search Results : Company
            </th>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <a runat="server" id="searchAnchor" href="Search.aspx">Back to Search</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />
            </td>
            <td align="right">
                <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvCompanies" runat="server" DataSourceID="SearchCompanyDS"
                    AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvCompanies_SelectedIndexChanged" OnDataBound="gvCompanies_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="COMPANIESID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME"
                            HeaderText="Company Name" SortExpression="COMPANYNAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Industry"
                            HeaderText="Industry" SortExpression="Industry" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Product"
                            HeaderText="Product" SortExpression="Product" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Representative"
                            HeaderText="Sandler Rep" SortExpression="Representative" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue"
                            HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}" />
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
        <%--For Export to Excel--%>
        <tr id="trExport" runat="server" visible="false">
            <td colspan="2">
                <div id="Report" runat="server">
                    <asp:GridView Width="100%" ID="gvCompaniesExport" runat="server" DataSourceID="SearchCompanyDS"
                        AutoGenerateColumns="False" DataKeyNames="COMPANIESID">
                        <Columns>
                            <asp:BoundField DataField="COMPANIESID" Visible="False" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME"
                                HeaderText="Company Name" SortExpression="COMPANYNAME" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Industry"
                                HeaderText="Industry" SortExpression="Industry" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Product"
                                HeaderText="Product" SortExpression="Product" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Representative"
                                HeaderText="Sandler Rep" SortExpression="Representative" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue"
                                HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}" />
                            <%--Extra columns only for Export to Excel feature--%>
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FranchiseeName"
                                HeaderText="Franchisee" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="RegionName"
                                HeaderText="Region" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="NewCompanyDesp"
                                HeaderText="New Company?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Address"
                                HeaderText="Address" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Zip"
                                HeaderText="Zip" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="City"
                                HeaderText="City" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="State"
                                HeaderText="State" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="POCFullName"
                                HeaderText="POC" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="POCPhone"
                                HeaderText="POC Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="DiscussionTopic"
                                HeaderText="Discussion Topic" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="ActionStep"
                                HeaderText="Action Step" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="LASTCONTACT_DATE"
                                HeaderText="Last Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="NEXTCONTACT_DATE"
                                HeaderText="Next Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="CreationDate"
                                HeaderText="Creation Date" DataFormatString="{0:d}" />
                        </Columns>
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="SearchCompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetCompaniesForSearch"></asp:ObjectDataSource>
                <asp:HiddenField ID="hidCompanyID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
