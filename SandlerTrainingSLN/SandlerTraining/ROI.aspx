<%@ Page Title="ROI" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="ROI.aspx.cs" Inherits="ROI" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Wizard ID="wzROI" runat="server" DisplaySideBar="false" Width="80%">
                    <WizardSteps>
                        <asp:TemplatedWizardStep ID="submitROIData" runat="server">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="updPnl" runat="server">
                                    <ContentTemplate>
                                        <table style="background-color: White; border-color: #999999; border-width: 1px;
                                            border-style: solid; width: 100%">
                                            <tr>
                                                <td align="left" colspan="2">
                                                    <b>
                                                        <asp:Label ID="lblViewTitle" runat="server">Perform Return On Investment:</asp:Label>
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
                                                        <asp:Label ID="lblAsIsSelectionTitle" runat="server">This is the Gap between your "As-Is" and "To-Be":</asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Sales Cycle Time</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxSCTGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Sales Efficiency</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxSEGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Sales Qualification</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxSQGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Training Cost Savings</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxTCSGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Quota Achievement</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxQAGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC">
                                                <td>
                                                    <a href=# title="Sales Cycle Time tool tip, this is the description of sales cycle time.">Est. Benifits Gained</a>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxEBGGap" runat="server" Enabled="false"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <b>
                                                        <asp:Label ID="lblExpenditurTitle" runat="server">Enter Estimated Sales Training Expenditure for 3 Years</asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC">
                                                <td>
                                                    Expenditure - Year1
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxYear1" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE">
                                                <td>
                                                    Expenditure - Year2
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxYear2" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC">
                                                <td>
                                                    Expenditure - Year3
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtBxYear3" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="editGA" runat="server" >Edit: Gap Analysis Record</asp:LinkButton>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:LinkButton ID="lnkNextStep" runat="server" CommandArgument="1" CommandName="viewROI"
                                                OnCommand="lnlNextStep_Click" OnClientClick="return performRequiredValidation();">View: ROI Report</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </CustomNavigationTemplate>
                        </asp:TemplatedWizardStep>
                        <asp:TemplatedWizardStep ID="plotChart" runat="server">
                            <ContentTemplate>
                                <table style="background-color: White; width: 100%">
                                    <tr>
                                        <td>
                                            <b>
                                                <asp:Label ID="lblViewTitle" runat="server">View ROI Report:</asp:Label>
                                            </b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            &nbsp;<asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%">
                                                        <table style="height: 400px">
                                                            <tr>
                                                                <td align="center">
                                                                    <b>Training Expense - Year 1</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="font-weight: bold; font-size: medium">
                                                                    <asp:Label ID="lblYear1" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <b>Training Expense - Year 3</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="font-weight: bold; font-size: medium">
                                                                    <asp:Label ID="lblYear2" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    <b>Training Expense - Year 3</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="font-weight: bold; font-size: medium">
                                                                    <asp:Label ID="lblYear3" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="width: 80%">
                                                        <div id="chartContainer" runat="server">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: center">
                                            <a href="" id="editAsIsGA" runat="server">Edit: As-Is/To-Be Data</a>
                                        </td>
                                        <td style="width: 25%; text-align: center">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="0" CommandName="submitData"
                                                OnCommand="lnlPrevStep_Click" Visible="True">Edit:ROI Data</asp:LinkButton>
                                        </td>
                                        <td style="width: 25%; text-align: center">
                                            <asp:LinkButton ID="lnkBtnPrint" runat="server" Visible="false" Text="Print: ROI Graph"></asp:LinkButton>
                                        </td>
                                        <td style="width: 25%; text-align: center">
                                            <asp:LinkButton ID="btnSave" Text="Save: ROI Record" runat="server" OnClick="btnSaveGapAnalysisReport_Click"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </CustomNavigationTemplate>
                        </asp:TemplatedWizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </td>
        </tr>
    </table>
    <div id="divProgress" style="width: 150px; text-align: center; vertical-align: middle;
        position: absolute; bottom: 50%; left: 45%; visibility: hidden; color: blue;
        background-color: lightblue;">
        <asp:Image ID="ajaxLoadNotificationImage" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...
    </div>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);


        function BeginRequestHandler(sender, args) {
            var elem = args.get_postBackElement();
            ShowHideProgress('visible');
        }
        function EndRequestHandler(sender, args) {
            ShowHideProgress('hidden');
            if ($('#<%=submitROIData.ContentTemplateContainer.FindControl("txtBxSCTGap").ClientID %>').val() != '') {
                $('#<%=submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep").ClientID %>').attr('style', 'display:block');
                $('#<%=submitROIData.CustomNavigationTemplateContainer.FindControl("editGA").ClientID %>').attr('style', 'display:block');
                var url = "GapAnalysisCreate.aspx?companyId=" + $('#<%=submitROIData.ContentTemplateContainer.FindControl("drpLstCompanies").ClientID %>').val() + "&contactId=" + $('#<%=submitROIData.ContentTemplateContainer.FindControl("drpLstContacts").ClientID %>').val();
                $('#<%=submitROIData.CustomNavigationTemplateContainer.FindControl("editGA").ClientID %>').attr('href', url)
            }
            else {
                $('#<%=submitROIData.CustomNavigationTemplateContainer.FindControl("lnkNextStep").ClientID %>').attr('style', 'display:none');
                $('#<%=submitROIData.CustomNavigationTemplateContainer.FindControl("editGA").ClientID %>').attr('style', 'display:none');
            }
        }
        function ShowHideProgress(visibility) {
            var divProgress = $get('divProgress');
            divProgress.style.visibility = visibility;
        }
        function performRequiredValidation() {
            if ($('#<%=submitROIData.ContentTemplateContainer.FindControl("drpLstCompanies").ClientID %>').val() == 0) {
                alert('Please select company first.');
                return false;
            }
            if ($('#<%=submitROIData.ContentTemplateContainer.FindControl("drpLstContacts").ClientID %>').val() == 0) {
                alert('Please select contact first.');
                return false;
            }
            if (!checkAtLeastOnecriteria()) {
                alert('Please enter training expenditures for 3 years.');
                return false;
            }
            return true;
        }
        function checkAtLeastOnecriteria() {
            if ($('#<%=txtBxYear1.ClientID %>').val() == '')
                return false;
            if ($('#<%=txtBxYear2.ClientID %>').val() == '')
                return false;
            if ($('#<%=txtBxYear3.ClientID %>').val() == '')
                return false;
            return true;
        }</script>
</asp:Content>
