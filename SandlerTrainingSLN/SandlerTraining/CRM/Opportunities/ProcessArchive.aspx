<%@ Page Title="CRM - View Archived Opportunities" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="ProcessArchive.aspx.cs" Inherits="ProcessArchive" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<%@ Register Src="../EntityMenu.ascx" TagName="EntityMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <th style="float: left">View Archived Pipeline Records:
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Select Company Name:
                            <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCreateDefaultSelection"
                                OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                                <SelectParameters>
                                    <asp:Parameter Name="_user" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                                ID="btnExportExcel" OnClick="btnExportExcel_Click" />
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
                <asp:GridView Width="100%" ID="gvOpportunities" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" AllowSorting="true" OnDataBound="gvOpportunities_DataBound"
                    OnRowDataBound="gvOpportunities_RowDataBound" OnSorting="gvOpportunities_Sorting"
                    EnableViewState="false">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID" HeaderText="ID" SortExpression="OPPORTUNITYID" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="NAME" HeaderText="Name" SortExpression="NAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="CompanyName" HeaderText="Company" SortExpression="CompanyName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE" HeaderText="Weighted Value"
                            SortExpression="WEIGHTEDVALUE" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="VALUE" HeaderText="Value" SortExpression="VALUE"
                            DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="CloseDate" HeaderText="Close Date" SortExpression="CloseDate"
                            DataFormatString="{0:d}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="SalesRep" HeaderText="Sales Rep" SortExpression="SalesRep" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                            HeaderStyle-ForeColor="Blue" DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField ShowHeader="False" HeaderText="UnArchive">
                            <ItemTemplate>
                                <a href="ProcessArchive.aspx?mode=true&id=<%#Eval("Id")%>" onclick="return confirm ('Are you sure to unarchive this record?');">UnArchive...</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
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
        <tr>
            <td>
                <asp:Panel ID="pnlExport" runat="server" Visible="false">
                    <asp:GridView Width="100%" ID="gvExport" runat="server" AutoGenerateColumns="false">
                        <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID"
                                HeaderText="Opportunity ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NAME"
                                HeaderText="Name" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CompanyName"
                                HeaderText="Company" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Franchisee"
                                HeaderText="Franchisee" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Region"
                                HeaderText="Region" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE"
                                HeaderText="Weighted Value" DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="VALUE"
                                HeaderText="Value" DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CloseDate"
                                HeaderText="Close Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CreationDate"
                                HeaderText="Creation Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="SalesRep"
                                HeaderText="Sales Rep" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Status"
                                HeaderText="Status" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="PrimaryContact"
                                HeaderText="PrimaryContact" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="SecondaryContact1"
                                HeaderText="SecondaryContact1" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="SecondaryContact2"
                                HeaderText="SecondaryContact2" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Product"
                                HeaderText="Product" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ProductCost"
                                HeaderText="ProductCost" DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="OppType"
                                HeaderText="TypeOfOpportunity" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="WhyLost"
                                HeaderText="WhyLost?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Description"
                                HeaderText="Description" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Notes"
                                HeaderText="Notes" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ActualValue"
                                HeaderText="ActualValue" DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Source"
                                HeaderText="Source" />
                        </Columns>
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
