﻿<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="DocumentIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../EntityMenu.ascx" TagName="EntityMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table width="100%" border="0">
        <tr>
            <td align="right"><uc1:EntityMenu ID="documentsMenu" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <label for="ddlCompany">
                    <b>Select Company :</b></label>
                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" AutoPostBack="True"
                    DataTextField="COMPANYNAME" DataValueField="COMPANIESID" OnDataBound="ddlCompany_DataBound"
                    OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;
                <label for="ddlOpportunity">
                    <b>Select Opportunity :</b></label>
                <asp:DropDownList ID="ddlOpportunity" runat="server" DataSourceID="OpprtunityDS"
                    AutoPostBack="True" DataTextField="OppName" DataValueField="OppsID" OnDataBound="ddlOpportunity_DataBound"
                    OnSelectedIndexChanged="ddlOpportunity_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView Width="100%" ID="gvDocuments" runat="server" DataSourceID="DocumentsDS"
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
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="CompanyName" HeaderStyle-ForeColor="Blue"
                            HeaderText="Company Name" SortExpression="CompanyName">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="OppName" HeaderStyle-ForeColor="Blue"
                            HeaderText="Opportunity Name" SortExpression="OppName">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="DocStatusText" HeaderText="Document Status"
                            HeaderStyle-ForeColor="Blue" SortExpression="DocStatusText">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="updateddate" HeaderText="Last Modify Date"
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
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DocumentsDS" runat="server" TypeName="SandlerRepositories.DocumentsRepository"
                    SelectMethod="GetByOppsId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlOpportunity" Name="OppsID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="OpprtunityDS" runat="server" TypeName="SandlerRepositories.OpportunityRepository"
                    SelectMethod="GetByCompId" OnSelecting="OpprtunityDS_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompany" Name="COMPANIESID" Type="Int32" />
                        <asp:Parameter Name="_user"  />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidDocumentID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
