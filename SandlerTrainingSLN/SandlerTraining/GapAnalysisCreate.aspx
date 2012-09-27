<%@ Page Title="GapAnalysis" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="GapAnalysisCreate.aspx.cs" Inherits="GapAnalysisCreate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Button ID="noShowButton" runat="server" Style="display: none" />
    <asp:Panel ID="pnlChart" runat="server" Width="60%" Style="display: block">
        <table width="100%" style="background-color: White; border: 1">
            <tr>
                <td style="width: 10%">
                    <table style="height: 500px; background-color: #D2F7FF">
                        <tr>
                            <td>
                                <b>As - Is</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsSCT" runat="server">test1</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsSE" runat="server">test2</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsSQ" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsTCS" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsQA" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsEBG" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 10%">
                    <table style="height: 500px">
                        <tr>
                            <td>
                                <b>Desired Annual Improvement%</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISCT" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISE" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISQ" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAITCS" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAIQA" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAIEBG" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="10"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 70%">
                    <div id="chartContainer" runat="server">
                    </div>
                </td>
                <td style="width: 10%">
                    <table style="height: 500px; background-color: #009999">
                        <tr>
                            <td>
                                <b>To - Be</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeSCT" runat="server">test1</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeSE" runat="server">test2</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeSQ" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeTCS" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeQA" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeEBG" runat="server">test3</asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <a href="#" id="btnReDo">Edit:</a>As-Is/To-Be Data&nbsp; &nbsp;<asp:LinkButton ID="btnGoToDashBoard"
                        Text="Save:" runat="server" OnClick="btnSaveGapAnalysisReport_Click"></asp:LinkButton>Gap
                    Analysis Report
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnlChart_ModalPopupExtender" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="noShowButton" BackgroundCssClass="modalBackground"
        OkControlID="btnReDo" CancelControlID="noShowButton" OnCancelScript="onCancel()"
        PopupControlID="pnlChart">
    </asp:ModalPopupExtender>
    <table style="width: 60%">
        <tr>
            <td style="width: 100%">
                <asp:UpdatePanel ID="updPnl" runat="server">
                    <ContentTemplate>
                        <table style="background-color: White; border-color: #999999; border-width: 1px;
                            border-style: solid; width: 100%">
                            <tr>
                                <td align="left" colspan="2">
                                    <b>Perform Gap Analysis:</b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE;">
                                <td style="width: 25%">
                                    Company:
                                </td>
                                <td style="width: 75%">
                                    <asp:DropDownList ID="drpLstCompanies" runat="server" AutoPostBack="true" OnDataBound="ddlCreateDefaultSelection"
                                        OnSelectedIndexChanged="drpLstCompanies_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Contacts:
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpLstContacts" AutoPostBack="true" OnDataBound="ddlCreateDefaultSelection"
                                        runat="server" OnSelectedIndexChanged="drpLstContacts_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <b>Select the following "As - Is" data for your Gap Analysis:</b>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Sales Cycle Time
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSCTAsIs" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Sales Efficiency
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSEAsIs" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Sales Qualification
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSQAsIs" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Training Cost Savings
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListTCSAsIs" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Quota Achievement
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListQAAsIs" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Est. Benifits Gained
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListEBGAsIS" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <b>Select the following "To - Be" data for your Gap Analysis:</b>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Sales Cycle Time
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSCTToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Sales Efficiency
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSEToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Sales Qualification
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListSQToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Training Cost Savings
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListTCSToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE">
                                <td>
                                    Quota Achievement
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListQAToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC">
                                <td>
                                    Est. Benifits Gained
                                </td>
                                <td>
                                    <asp:DropDownList ID="drpListEBGToBe" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="btnViewGapAnalysisReport" runat="server" Text="View Gap Analysis Report"
                    Font-Bold="true" OnClick="btnViewGapAnalysisReport_Click" ForeColor="Blue" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">


        function onCancel() {
            window.open('Default.aspx', '_self');
        }

        $(document).ready(function () {
            BindEvents();
        });

        function BindEvents() {
            $('#<%=btnViewGapAnalysisReport.ClientID %>').click(function () {
                if ($('#<%=drpLstCompanies.ClientID %>').val() == 0) {
                    alert('Please select company first.');
                    return false;
                }
                if ($('#<%=drpLstContacts.ClientID %>').val() == 0) {
                    alert('Please select contact.');
                    return false;
                }
                if (!checkAtLeastOnecriteria()) {
                    alert('Please select all values for As - Is and To - Be.');
                    return false;
                }
            });
        }

        function checkAtLeastOnecriteria() {
            if ($('#<%=drpListSCTAsIs.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListSEAsIs.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListSQAsIs.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListTCSAsIs.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListQAAsIs.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListEBGAsIS.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListSCTToBe.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListSEToBe.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListSQToBe.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListTCSToBe.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListQAToBe.ClientID %>').val() == 0)
                return false;
            if ($('#<%=drpListEBGToBe.ClientID %>').val() == 0)
                return false;
            return true;
        }
    </script>
</asp:Content>
