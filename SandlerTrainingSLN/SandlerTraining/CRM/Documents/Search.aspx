<%@ Page Title="CRM - Search Documents" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="Search.aspx.cs"
    Inherits="CRM_Documents_Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <asp:Panel ID="pnlSearch" runat="server">
                    <table style="width: 50%">
                        <tr>
                            <th class="tdTC" style="width: 100%" align="left">
                                Search Document :
                            </th>
                        </tr>
                        <tr>
                            <td style="width: 50%">
                                <table cellspacing="0" cellpadding="3" rules="cols" id="MainContent_dvDocument" style="background-color: White;
                                    border-color: #999999; border-width: 1px; border-style: solid; height: 50px;
                                    width: 100%; border-collapse: collapse;">
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Company :
                                        </td>
                                        <td style="white-space: nowrap;">
                                            <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                                ID="ddlCompanySearch" runat="server" OnDataBound="ddlCreateDefaultSelection">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                                                <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" runat="server">
                                        <td style="white-space: nowrap;">
                                            Opportunity :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlOpportunities" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                        <td style="white-space: nowrap;">
                                            Document Name :
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtDocName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="Tr2" style="color: Black; background-color: #DCDCDC; white-space: nowrap;"
                                        runat="server">
                                        <td style="white-space: nowrap;">
                                            Status :
                                        </td>
                                        <td style="white-space: nowrap;">
                                            <asp:DropDownList ID="ddlDocStatus" runat="server" DataSourceID="DocStatusDS" DataTextField="DocStatusText"
                                                DataValueField="DocStatusId" OnDataBound="ddlCreateDefaultSelection">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="DocStatusDS" runat="server" TypeName="SandlerRepositories.DocumentsRepository"
                                                SelectMethod="GetDocStatus"></asp:ObjectDataSource>
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
                    <asp:HiddenField ID="hidDocumentID" runat="server" />
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
                                <asp:GridView ID="gvDocuments" runat="server" Width="100%" AutoGenerateColumns="false"
                                    OnDataBound="gvDocuments_DataBound">
                                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="ID"
                                            DataField="DOCSID" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Document Name"
                                            DataField="DocumentName" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Company"
                                            DataField="CompanyName" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Opportunity"
                                            DataField="OpportunityName" />
                                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Status"
                                            DataField="Status" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <a href="Detail.aspx?id=<%#Eval("DOCSID")%>">View Detail...</a>
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
                                    <asp:GridView ID="gvExport" runat="server" Width="100%" AutoGenerateColumns="false"
                                        OnDataBound="gvDocuments_DataBound">
                                        <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="ID"
                                                DataField="DOCSID" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Document Name"
                                                DataField="DocumentName" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Company"
                                                DataField="CompanyName" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Opportunity"
                                                DataField="OpportunityName" />
                                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" HeaderText="Status"
                                                DataField="Status" />
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

            $('#<%=ddlOpportunities.ClientID %>').empty().append('<option value=0>--Select Opportunity--</option>');

            $('#<%=lbtnSearch.ClientID %>').click(function () {
                if (!checkAtLeastOnecriteria()) {
                    $('#<%=LblStatus.ClientID %>').text('Please enter/select at least one criteria for search.');
                    return false;
                }
            });

            function checkAtLeastOnecriteria() {
                if ($('#<%=ddlCompanySearch.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=ddlOpportunities.ClientID %>').val() != 0)
                    return true;
                if ($('#<%=txtDocName.ClientID %>').val() != '')
                    return true;
                if ($('#<%=ddlDocStatus.ClientID %>').val() != 0)
                    return true;

                return false;
            }

            $('#<%=ddlCompanySearch.ClientID %>').live('change', function () {
                var companyId = $('#<%=ddlCompanySearch.ClientID %> option:selected').val();
                if (companyId != '') {

                    $.ajax({
                        url: baseUrl + "/api/Opportunities/",
                        type: 'GET',
                        contentType: 'application/json',
                        data: { companyId: companyId },
                        success: function (data) {
                            $('#<%=ddlOpportunities.ClientID %>').empty().append('<option value=0>--Select Opportunity--</option>');
                            $.each(data.$values, function (i, item) {
                                $('#<%=ddlOpportunities.ClientID %>').append($('<option></option>').val(item.CONTACTSID).html(item.NAME));
                            });
                        },
                        error: function (xhr, status, somthing) {
                            log(status);
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>
