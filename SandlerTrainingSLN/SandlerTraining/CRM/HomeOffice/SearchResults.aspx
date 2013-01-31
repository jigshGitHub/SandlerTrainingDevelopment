﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="CRM_HomeOffice_SearchResults" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <table id="tblMain" width="100%">
        <tr>
            <th colspan="2" class="tdTC" align="left">
                Search Results : Franchisee
            </th>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <a runat="server" id="searchAnchor" href="Search.aspx">Back to Search</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" 
                    ToolTip="Export To Excel" ID="btnExportExcel" onclick="btnExportExcel_Click" />
            </td>
            <td align="right">
                <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:GridView Width="100%" ID="gvFranchisees" runat="server" DataSourceID="SearchFranchiseeDS"
                    AutoGenerateColumns="False" DataKeyNames="ID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvFranchisees_SelectedIndexChanged" 
                    OnDataBound="gvFranchisees_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                                
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
            <td colspan="2">
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="SearchFranchiseeDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetFranchiseesForSearch"></asp:ObjectDataSource>
                <asp:HiddenField ID="hidFranchiseeID" runat="server" />
            </td>
        </tr>

  </table>


</asp:Content>
