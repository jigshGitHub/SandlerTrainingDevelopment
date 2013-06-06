<%@ Page Title="CRM - View Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="Index.aspx.cs" Inherits="CompanyIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../EntityMenu.ascx" TagName="EntityMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td align="right">
                <uc1:EntityMenu ID="companyMenu" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />&nbsp;
                    <asp:Label runat="server" Text="Export To Excel" ID="lblExportToExcel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvCompanies" runat="server" DataSourceID="SearchCompanyDS"
                    AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvCompanies_SelectedIndexChanged" 
                    OnDataBound="gvCompanies_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="COMPANIESID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME" HeaderText="Company Name" SortExpression="COMPANYNAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Industry" HeaderText="Industry" SortExpression="Industry" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" SortExpression="Product" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Representative" HeaderText="Sandler Rep" SortExpression="Representative" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue" HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}" />
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
                            <asp:BoundField DataField="COMPANIESID" SortExpression="COMPANIESID" HeaderText="ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME" HeaderText="Company Name" SortExpression="COMPANYNAME" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Industry" HeaderText="Industry" SortExpression="Industry" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" SortExpression="Product" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Representative" HeaderText="Sandler Rep" SortExpression="Representative" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Representative" HeaderText="Sales Rep" SortExpression="Representative" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue" HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}" />
                            <%--Extra columns only for Export to Excel feature--%>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Website" HeaderText="Website" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="EmpQuantity" HeaderText="Emp Quantity" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="FranchiseeName" HeaderText="Franchisee" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="RegionName" HeaderText="Region" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CompanyOwnership" HeaderText="Company Ownership" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CompanyDescription" HeaderText="Company Description" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NewCompanyDesp" HeaderText="New Company?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Address" HeaderText="Address" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="City" HeaderText="City" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="State" HeaderText="State" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Zip" HeaderText="Zip" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Country" HeaderText="Country" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingDescription" HeaderText="Same Billing Address?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingAddress" HeaderText="Billing Address" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingCity" HeaderText="Billing City" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingState" HeaderText="Billing State" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingZip" HeaderText="Billing Zip" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="BillingCountry" HeaderText="Billing Country" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCFullName" HeaderText="POC" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCPhone" HeaderText="POC Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCDepartment" HeaderText="POC Department" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCEmail" HeaderText="POC Email" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCFax" HeaderText="POC Fax" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="AssistantLastName" HeaderText="Assistant LastName" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="AssistantFirstName" HeaderText="Assistant FirstName" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="AssistantPhone" HeaderText="Assistant Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="DiscussionTopic" HeaderText="Discussion Topic" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ActionStep" HeaderText="Action Step" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LASTCONTACT_DATE" HeaderText="Last Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NEXTCONTACT_DATE" HeaderText="Next Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="StartTime" HeaderText="Start Time" DataFormatString="{0:t}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CreationDate" HeaderText="Creation Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Notes" HeaderText="Company Notes" />
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
                <asp:ObjectDataSource ID="SearchCompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllCompanies" OnSelecting="SearchCompanyDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidCompanyID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
