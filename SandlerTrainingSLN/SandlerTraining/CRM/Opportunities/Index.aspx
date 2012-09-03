<%@ Page Title="CRM - View Opportunities" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="Index.aspx.cs"
    Inherits="OpportunityIndex" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="pnlSerach" runat="server" Visible="false">
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
                                                ID="ddlCompanySearch" runat="server" AutoPostBack="True" OnDataBound="ddlCreateDefaultSelection"
                                                OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" id="trOpportunityID"
                                        runat="server">
                                        <td style="white-space: nowrap;">
                                            Opportunity ID :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOpportunityID" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Opportunity Name :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtOppName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Sales Rep Last Name :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSalesRepLName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Sales Rep First Name :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSalesRepFName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Sales Rep Phone :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSalesRepPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"
                                                Width="380" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Product :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="ProductTypesDS" DataTextField="ProductTypeName"
                                                DataValueField="Id" OnDataBound="ddlCreateDefaultSelection">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="ProductTypesDS" runat="server" SelectMethod="GetWithFranchiseeId"
                                                TypeName="SandlerRepositories.ProductTypesRepository">
                                                <SelectParameters>
                                                    <asp:Parameter Name="franchiseeId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Opportunity Status :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProductStatus" runat="server" DataSourceID="OpportunityStatusDS"
                                                DataTextField="Name" DataValueField="ID" OnDataBound="ddlCreateDefaultSelection">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="OpportunityStatusDS" runat="server" SelectMethod="GetAll"
                                                TypeName="SandlerRepositories.OpprtunityStatusRepository"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Contact Name :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlContacts" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Contact Phone :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtContactPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"
                                                Width="380" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Contact E-mail :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" MaxLength="50" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbtnSearch" runat="server" CausesValidation="True" Text="Search"
                                                ForeColor="Blue" Font-Bold="true" onclick="lbtnSearch_Click"></asp:LinkButton>&nbsp;&nbsp;
                                            <asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="False" ForeColor="Blue"
                                                Font-Bold="true"></asp:LinkButton>
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
                <asp:Panel ID="pnlIndex" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 100%" align="right">
                                <a id="searchAnchor" runat="server" href="Index.aspx?AllowSearch=True">Search </a>
                                &nbsp;|&nbsp;<a id="addOpportunityAnchor" runat="server" href="Add.aspx">Add New Opportunity</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Select Company Name:
                                <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                    ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCreateDefaultSelection"
                                    OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                    SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <div id="Report" runat="server">
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
                </div>
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
    </table>
</asp:Content>
