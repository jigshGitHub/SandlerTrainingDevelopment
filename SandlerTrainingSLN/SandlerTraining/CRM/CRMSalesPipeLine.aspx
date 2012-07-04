<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="CRMSalesPipeLine.aspx.cs" Inherits="CRMSalesPipeLine" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td>
                Select Company Name:
                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" AutoPostBack="True"
                    DataTextField="Company_Name" DataValueField="ID" OnDataBound="ddlCompany_DataBound">
                </asp:DropDownList>
            </td>
            <td align="right">
                <asp:LinkButton ID="btnAddOpportunity" runat="server" Font-Size="Large" OnClick="btnAddOpportunity_Click"
                    ForeColor="blue">Add New Opportunity</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvOpportunities" runat="server" DataSourceID="OpportunityDS"
                    AutoGenerateColumns="False" DataKeyNames="Opp_ID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvOpportunities_SelectedIndexChanged" OnDataBound="gvOpportunities_DataBound"
                    OnRowDataBound="gvOpportunities_RowDataBound" ShowFooter="true">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Opp_ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="acct_id"
                            HeaderText="Acct ID" SortExpression="acct_id" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="opp_name"
                            HeaderText="Oppty Name" SortExpression="opp_name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Company_name"
                            HeaderText="Company" SortExpression="company_name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Weighted_value"
                            HeaderText="Weighted Value" SortExpression="Weighted_value" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Total_Value"
                            HeaderText="Total Value" SortExpression="Total_Value" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Close_Date"
                            HeaderText="Close_Date" SortExpression="Close_Date" DataFormatString="{0:d}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Sales_Rep"
                            HeaderText="Sales Rep" SortExpression="Sales_Rep" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="acct_opp_status"
                            HeaderText="Acct Oppty Status" SortExpression="acct_opp_status" />
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle ForeColor="Maroon" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="View Detail.."></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="OpportunityDS" runat="server" TypeName="OpportunityDAL"
                    SelectMethod="GetAllOpportunities">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompany" Name="ID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidOpprtunityID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
