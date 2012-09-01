<%@ Page Title="CRM - View Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="Index.aspx.cs" Inherits="CompanyIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td align="right">
                <a runat="server" id="uploadAnchor" href="Upload.aspx">Upload Company Data | </a>
                <a runat="server" id="addProductAnchor" href="Add.aspx" style="display: none">Add New
                    Product | </a><a runat="server" id="addCompanyAnchor" href="Add.aspx">Add New Company</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <div id="Report" runat="server">
                    <asp:GridView Width="100%" ID="gvCompanies" runat="server" DataSourceID="CompanyDS"
                        AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true"
                        PageSize="20" OnSelectedIndexChanged="gvCompanies_SelectedIndexChanged" OnDataBound="gvCompanies_DataBound">
                        <PagerStyle CssClass="gvPager" />
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
                <asp:HiddenField ID="hidCompanyID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
