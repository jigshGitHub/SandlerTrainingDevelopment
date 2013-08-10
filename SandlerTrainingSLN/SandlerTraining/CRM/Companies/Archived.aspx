﻿<%@ Page Title="CRM - View Archived Company Records" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Archived.aspx.cs" Inherits="CompaniesArchived" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table id="tblMain" width="100%">
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />&nbsp;
                    <asp:Label runat="server" Text="Export To Excel" ID="lblExportToExcel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvArchivedCompanies" runat="server" DataSourceID="SearchArchiveCompanyDS"
                    AutoGenerateColumns="False" DataKeyNames="COMPANIESID" AllowSorting="true" AllowPaging="true"
                    PageSize="20"  
                    OnDataBound="gvArchivedCompanies_DataBound" OnRowDataBound="gvArchivedCompanies_RowDataBound" onrowdeleted="gvArchivedCompanies_RowDeleted">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Eval("CreatedBy") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="COMPANIESID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME" HeaderText="Company Name" SortExpression="COMPANYNAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Industry" HeaderText="Industry" SortExpression="Industry" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" SortExpression="Product" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Representative" HeaderText="Sandler Rep" SortExpression="Representative" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="TotalCompanyValue" HeaderText="Total Company Value" SortExpression="TotalCompanyValue" DataFormatString="{0:C}" />
                        <asp:TemplateField  HeaderText="UnArchive" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="unarchiveButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                    Text="UnArchive"  OnClientClick="return confirm ('Are you sure to unArchive this Company record? All Contacts and Pipeline records for this Company will be unarchived too.');" ></asp:LinkButton>
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
                    <asp:GridView Width="100%" ID="gvArchivedCompaniesExport" runat="server" DataSourceID="SearchArchiveCompanyDS"
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
                <asp:ObjectDataSource ID="SearchArchiveCompanyDS" runat="server" 
                TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllArchivedCompanies" 
                DeleteMethod="UnArchiveCompany" OnSelecting="SearchArchiveCompanyDS_Selecting">
                    <SelectParameters>
                        <asp:Parameter Name="_user"  />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="COMPANIESID" Type="Int32" />
                        <asp:ControlParameter Name="CurrentUserId"  ControlID="hidCurrentUserId"/>
                    </DeleteParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidCompanyID" runat="server" />
                <asp:HiddenField ID="hidCurrentUserId" runat="server" />

            </td>
        </tr>
    </table>

</asp:Content>

