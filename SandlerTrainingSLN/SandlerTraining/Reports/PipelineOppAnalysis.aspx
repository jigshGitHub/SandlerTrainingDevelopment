<%@ Page Title="Reports-PipelineOpportunityAnalysis" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="PipelineOppAnalysis.aspx.cs" Inherits="Reports_PipelineOppAnalysis" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width: 100%">
        <tr>
            <td>
                <asp:Wizard ID="wzGapAnalysis" runat="server" DisplaySideBar="false" Width="100%">
                    <WizardSteps>
                        <asp:TemplatedWizardStep ID="submitCSA" runat="server">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="updPnl" runat="server">
                                    <ContentTemplate>
                                        <table style="background-color: White; border-color: #999999; border-width: 1px;
                                            border-style: solid; width: 100%">
                                            <tr>
                                                <td align="left" colspan="3">
                                                    <b>
                                                        <asp:Label ID="lblViewTitle" runat="server">Pipeline Opportunity Analysis:</asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" colspan="3">
                                                    <b>
                                                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE;">
                                                <td style="width: 20%">
                                                    Select 'Closed Sales Analysis' Type:
                                                </td>
                                                <td>
                                                    <!--<asp:ListItem Text="Sales Rep" Value="SalesRep"></asp:ListItem>-->
                                                    <asp:RadioButtonList ID="radBtnAnalysisType" runat="server">
                                                        <asp:ListItem Text="Product Sold" Value="ProductsSold" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Opportunity Source" Value="OpportunitySource"></asp:ListItem>
                                                        <asp:ListItem Text="Opportunity Type" Value="OpportunityType"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblAnalysisTypeValidation" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC;">
                                                <td style="width: 20%">
                                                    Select Company(ies):
                                                </td>
                                                <td style="width: 60%">
                                                    <asp:RadioButtonList ID="radBtnCompanySelection" runat="server">
                                                        <asp:ListItem Text="Only New Companies" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Only NON-New Companies" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="All Companies" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <br />
                                                    <asp:DropDownList ID="drpLstCompanies" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:ListBox ID="lstCompanies" Height="250px" runat="server" OnDataBound="lbxCreateDefaultSelection"
                                                        SelectionMode="Multiple"></asp:ListBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCompaniesSelectionValidation" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE;">
                                                <td style="width: 20%">
                                                    Select Quantity / Value Choice:
                                                </td>
                                                <td colspan="2">
                                                    <asp:RadioButtonList ID="radBtnQtyValChoice" runat="server">
                                                        <asp:ListItem Text="Sales Value" Value="Value" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Sales Quantity" Value="Quantity"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <table width="100%">
                                    <tr>
                                        <td align="left">
                                            <asp:LinkButton ID="lnkNextStep" runat="server" CommandArgument="1" CommandName="plotGraph"
                                                OnCommand="lnlNextStep_Click" Visible="True" OnClientClick="return performRequiredValidation();">View 
Pipeline Opportunity Analysis Report</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </CustomNavigationTemplate>
                        </asp:TemplatedWizardStep>
                        <asp:TemplatedWizardStep ID="plotChart" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="chartPanel" runat="server" HorizontalAlign="Center" Width="100%">
                                </asp:Panel>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                            </CustomNavigationTemplate>
                        </asp:TemplatedWizardStep>
                    </WizardSteps>
                </asp:Wizard>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        var drpLstCompanies = $('#<%=drpLstCompanies.ClientID%>');
        var radBtnCompanySelection = $('#<%=radBtnCompanySelection.ClientID%>');
        var lstCompanies = $('#<%=lstCompanies.ClientID%>');
        var radBtnQtyValChoice = $('#<%=radBtnQtyValChoice.ClientID%>');
        var radBtnAnalysisType = $('#<%=radBtnAnalysisType.ClientID%>');
        var lblAnalysisTypeValidation = $('#<%=lblAnalysisTypeValidation.ClientID %>');
        var lblCompaniesSelectionValidation = $('#<%=lblCompaniesSelectionValidation.ClientID %>');
        $(document).ready(function () {
            $(drpLstCompanies).change(function () {
                if (drpLstCompanies.val() > 0)
                    clearCompaniesSelection(this);
            });
            $(lstCompanies).change(function () {
                if (lstCompanies.val() > 0)
                    clearCompaniesSelection(this);
            });
            $(radBtnCompanySelection).click(function () {
                clearCompaniesSelection(this);
            });

            function clearCompaniesSelection(notToClearControl) {
                //log(notToClearControl.id);
                if (notToClearControl.id != radBtnCompanySelection.attr('id')) {
                    ///log('resting radBtnCompanySelection');
                    radBtnCompanySelection.find('input:radio').removeAttr('checked');
                }
                if (notToClearControl.id != drpLstCompanies.attr('id')) {
                    //log('resting drpLstCompanies');
                    drpLstCompanies.find('option:selected').removeAttr('selected');
                }
                if (notToClearControl.id != lstCompanies.attr('id')) {
                    //log('resting lstCompanies');
                    lstCompanies.find('option:selected').removeAttr('selected');
                }
            }
        });

        function hasCompanyOptionSelected() {
            if (radBtnCompanySelection.find('input:radio[checked]').val() != undefined)
                return true;
            else if (drpLstCompanies.find('option:selected').val() > 0)
                return true;
            else if (lstCompanies.find('option:selected').length > 0)
                return true;
            return false;
        }

        function performRequiredValidation() {
            if (radBtnAnalysisType.find('input:radio[checked]').val() == undefined) {
                lblAnalysisTypeValidation.text('Please select analysis type first.');
                alert('Please select analysis type first.');
                return false;
            }
            lblAnalysisTypeValidation.text('');
            if (!hasCompanyOptionSelected()) {
                lblCompaniesSelectionValidation.text('Please select any one option from company(ies).');
                alert('Please select any one option from company(ies).');
                return false;
            }
            lblCompaniesSelectionValidation.text('');
            return true;
        }
    </script>
</asp:Content>
