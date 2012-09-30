<%@ Page Title="GapAnalysis" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="GapAnalysisCreateWithModalPopup.aspx.cs" Inherits="GapAnalysisCreateModalPopup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Button ID="noShowButton" runat="server" Style="display: none" />
    <asp:Panel ID="pnlChart" runat="server" Width="80%" Style="display: block">
        <table style="background-color: White; width: 100%">
            <tr>
                <td style="width: 13%; background-color: #D2F7FF">
                    <table style="height: 400px">
                        <tr>
                            <td>
                                <b>As - Is</b>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top">
                                <asp:Label ID="lblAsIsSCT" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsSE" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsSQ" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsTCS" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsQA" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAsIsEBG" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 20%;">
                    <table style="height: 400px">
                        <tr>
                            <td style="padding-bottom: 5px">
                                <b>Desired Annual Improvement%</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISCT" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISE" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAISQ" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAITCS" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAIQA" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpLstDAIEBG" runat="server">
                                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="20%" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="30%" Value="30"></asp:ListItem>
                                    <asp:ListItem Text="40%" Value="40"></asp:ListItem>
                                    <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                    <asp:ListItem Text="60%" Value="60"></asp:ListItem>
                                    <asp:ListItem Text="70%" Value="70"></asp:ListItem>
                                    <asp:ListItem Text="80%" Value="80"></asp:ListItem>
                                    <asp:ListItem Text="90%" Value="90"></asp:ListItem>
                                    <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 57%;">
                    <div id="chartContainer" runat="server">
                    </div>
                </td>
                <td style="width: 10%; background-color: #009999">
                    <table style="height: 400px">
                        <tr>
                            <td>
                                <b>To - Be</b>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top">
                                <asp:Label ID="lblToBeSCT" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeSE" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeSQ" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeTCS" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeQA" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblToBeEBG" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 20%">
                                <a href="#" id="btnReDo">Edit: As-Is/To-Be Data</a>
                            </td>
                            <td style="width: 20%">
                                <asp:LinkButton ID="btnSave" Text="Save: Gap Analysis Record" runat="server" OnClick="btnSaveGapAnalysisReport_Click"></asp:LinkButton>
                            </td>
                            <td style="width: 20%">
                                <a href="" onclick="printData();">Print: Gap analysis Graph</a>
                            </td>
                            <td style="width: 20%">
                                <a href="" id="editRoi" runat="server">Edit: ROI Record</a>
                            </td>
                            <td style="width: 20%">
                                <a href="#" id="btnClose">Close</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnlChart_ModalPopupExtender" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="noShowButton" BackgroundCssClass="modalBackground"
        OkControlID="btnReDo" CancelControlID="btnClose" OnCancelScript="onCancel()"
        PopupControlID="pnlChart">
    </asp:ModalPopupExtender>
    <div id="divProgress" style="width: 150px; text-align: center; vertical-align: middle;
        position: absolute; bottom: 50%; left: 45%; visibility: hidden; color: blue;
        background-color: lightblue;">
        <asp:Image ID="ajaxLoadNotificationImage" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...
    </div>
    <table style="width: 80%">
        <tr>
            <td style="width: 100%">
                <asp:UpdatePanel ID="updPnl" runat="server">
                    <ContentTemplate>
                        <table style="background-color: White; border-color: #999999; border-width: 1px;
                            border-style: solid; width: 100%">
                            <tr>
                                <td align="left" colspan="2">
                                    <b>
                                        <asp:Label ID="lblViewTitle" runat="server">Perform Gap Analysis:</asp:Label>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
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
                                    <b>
                                        <asp:Label ID="lblAsIsSelectionTitle" runat="server">Select the following "As - Is" data for your Gap Analysis:</asp:Label>
                                    </b>
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
                                    <b>
                                        <asp:Label ID="lblToBeSelectionTitle" runat="server">Select the following "To - Be" data for your Gap Analysis:</asp:Label></b>
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

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);


        function BeginRequestHandler(sender, args) {
            var elem = args.get_postBackElement();
            ShowHideProgress('visible');
        }
        function EndRequestHandler(sender, args) {
            ShowHideProgress('hidden');
        }
        function ShowHideProgress(visibility) {
            var divProgress = $get('divProgress');
            divProgress.style.visibility = visibility;
        }



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

            //            $('#btnReDo').click(function () {
            //                alert('test');
            //            });
        }
        function printData() {
            //alert($('#<%=pnlChart.ClientID %>').html());
            var WindowObject = window.open("", "PrintWindow",
"width=750,height=650,top=50,left=50,toolbars=no,scrollbars=yes,status=no,resizable=yes");
            WindowObject.document.writeln($('#<%=pnlChart.ClientID %>').html());
            WindowObject.document.close();
            WindowObject.focus();
            WindowObject.print();
            WindowObject.close();
            return false;
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
