<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="OpportunityIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td>
                Select Company Name:
                <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                    ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCompany_DataBound"
                    OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
            </td>
            <td align="right">
                <a id="addOpportunityAnchor" runat="server" href="Add.aspx">Add New Opportunity</a>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvOpportunities" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" AllowSorting="true" PageSize="3" OnDataBound="gvOpportunities_DataBound"
                    OnRowDataBound="gvOpportunities_RowDataBound" ShowFooter="true" OnSorting="gvOpportunities_Sorting">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID"
                            HeaderText="ID" SortExpression="OPPORTUNITYID" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="NAME"
                            HeaderText="Name" SortExpression="NAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="CompanyName"
                            HeaderText="Company" SortExpression="CompanyName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE"
                            HeaderText="Weighted Value" SortExpression="WEIGHTEDVALUE" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="VALUE"
                            HeaderText="Value" SortExpression="VALUE" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="CloseDate"
                            HeaderText="Close Date" SortExpression="CloseDate" DataFormatString="{0:d}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="SalesRep"
                            HeaderText="Sales Rep" SortExpression="SalesRep" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Status"
                            HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <a href="Detail.aspx?id=<%#Eval("Id")%>">View Detail...</a>
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
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
