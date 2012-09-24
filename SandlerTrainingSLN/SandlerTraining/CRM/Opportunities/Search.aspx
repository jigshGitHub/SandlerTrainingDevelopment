<%@ Page Title="CRM - Search Opportunities" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="Search.aspx.cs"
    Inherits="OpportunitySearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="pnlSearch" runat="server">
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
                                                ID="ddlCompanySearch" runat="server" OnDataBound="ddlCreateDefaultSelection">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                                SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
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
                                                Width="380" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Contact E-mail :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:LinkButton ID="lbtnSearch" runat="server" CausesValidation="True" Text="Search"
                                                ForeColor="Blue" Font-Bold="true" OnClick="lbtnSearch_Click"></asp:LinkButton>&nbsp;&nbsp;
                                            <a id="searchAnchor" href="Index.aspx" style="font-weight: bold">Cancel</a>
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
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlResults" runat="server" Visible="false">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 100%" align="right" colspan="2">
                                <a href="Search.aspx">Back To Search</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />
                            </td>
                            <td align="right">
                                <asp:Label ID="lblResultsCount" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView Width="100%" ID="gvOpportunities" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="ID" AllowSorting="true" OnDataBound="gvOpportunities_DataBound"
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
                                <asp:Panel ID="pnlExport" runat="server" Visible="false">
                                    <asp:GridView Width="100%" ID="gvExport" runat="server" AutoGenerateColumns="false">
                                        <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID"
                                                HeaderText="Opportunity ID" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="NAME"
                                                HeaderText="Name" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="CompanyName"
                                                HeaderText="Company" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Franchisee"
                                                HeaderText="Franchisee" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Region"
                                                HeaderText="Region" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE"
                                                HeaderText="Weighted Value" DataFormatString="{0:C}" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="VALUE"
                                                HeaderText="Value" DataFormatString="{0:C}" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="CloseDate"
                                                HeaderText="Close Date" DataFormatString="{0:d}" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="SalesRep"
                                                HeaderText="Sales Rep" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Status"
                                                HeaderText="Status" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="PrimaryContact"
                                                HeaderText="PrimaryContact" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="SecondaryContact1"
                                                HeaderText="SecondaryContact1" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="SecondaryContact2"
                                                HeaderText="SecondaryContact2" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Product"
                                                HeaderText="Product" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="OppType"
                                                HeaderText="TypeOfOpportunity" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="WhyLost"
                                                HeaderText="WhyLost?" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Description"
                                                HeaderText="Description" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Notes"
                                                HeaderText="Notes" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="ActualValue"
                                                HeaderText="ActualValue" DataFormatString="{0:C}" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Source"
                                                HeaderText="Source" />
                                        </Columns>
                                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                    </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {

            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
            $('#<%=ddlContacts.ClientID %>').empty().append('<option value=0>--Select Contact--</option>');

            $('#<%=ddlCompanySearch.ClientID %>').live('change', function () {
                var companyId = $('#<%=ddlCompanySearch.ClientID %> option:selected').val();
                if (companyId != '') {

                    $.ajax({
                        url: baseUrl + "/api/Contacts/",
                        type: 'GET',
                        contentType: 'application/json',
                        data: { companyId: companyId },
                        success: function (data) {
                            $('#<%=ddlContacts.ClientID %>').empty().append('<option value=0>--Select Contact--</option>');
                            $.each(data.$values, function (i, item) {
                                $('#<%=ddlContacts.ClientID %>').append($('<option></option>').val(item.CONTACTSID).html(item.FIRSTNAME + ' ' + item.LASTNAME));
                            });
                        },
                        error: function (xhr, status, somthing) {
                            log(status);
                        }
                    });
                }
            });

            $('#<%=ddlContacts.ClientID %>').live('change', function () {
                var contactId = $('#<%=ddlContacts.ClientID %> option:selected').val();

                if (contactId != '0') {
                    $.ajax({
                        url: baseUrl + "/api/Contacts/Details/",
                        type: 'GET',
                        contentType: 'application/json',
                        data: { id: contactId },
                        success: function (data) {
                            $('#<%=txtContactPhone.ClientID %>').val(data.PHONE);
                            $('#<%=txtEmail.ClientID %>').val(data.EMAIL);
                        },
                        error: function (xhr, status, somthing) {
                            log(status);
                        }
                    });
                }
            });
            $('#<%=txtOpportunityID.ClientID %>').keypress(EnterOnlyNumeric);

            $('#<%=lbtnSearch.ClientID %>').click(function () {
                if (!checkAtLeastOnecriteria()) {
                    $('#<%=LblStatus.ClientID %>').text('Please enter/select at least one criteria for search.');
                    return false;
                }
            });

            function checkAtLeastOnecriteria() {
                if ($('#<%=ddlCompanySearch.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=txtOpportunityID.ClientID %>').val() != '')
                    return true;
                if ($('#<%=txtOppName.ClientID %>').val() != '')
                    return true;
                if ($('#<%=txtSalesRepLName.ClientID %>').val() != '')
                    return true;
                if ($('#<%=txtSalesRepFName.ClientID %>').val() != '')
                    return true;
                if ($('#<%=txtSalesRepPhone.ClientID %>').val() != '')
                    return true;
                if ($('#<%=ddlProducts.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=ddlProductStatus.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=ddlContacts.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=txtEmail.ClientID %>').val() != '')
                    return true;

                return false;
            }
        });
    </script>
</asp:Content>
