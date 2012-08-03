<%@ Page Title="CRM - View Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="CompanyIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td>
                <b>View Company :</b>
            </td>
            <td align="right">
                <asp:LinkButton ID="btnAddProduct" runat="server" Font-Size="Large" OnClick="btnAddProduct_Click"
                    ForeColor="blue" Visible="false">Add New Product</asp:LinkButton>
            </td>
            <td align="right">
                <asp:LinkButton ID="btnAddCompany" runat="server" Font-Size="Large" OnClick="btnAddCompany_Click"
                    ForeColor="blue">Add New Company</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView Width="100%" ID="gvCompanies" runat="server" DataSourceID="CompanyDS"
                    AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvCompanies_SelectedIndexChanged" OnDataBound="gvCompanies_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
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
                            <ControlStyle ForeColor="Maroon" />
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
            <td colspan="3">
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
                <asp:HiddenField ID="hidCompanyID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
