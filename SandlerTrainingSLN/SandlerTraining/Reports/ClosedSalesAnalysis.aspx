<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="ClosedSalesAnalysis.aspx.cs" Inherits="Reports_ClosedSalesAnalysis" %>

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
                        <asp:TemplatedWizardStep ID="submitGAPData" runat="server">
                            <ContentTemplate>
                                <asp:UpdatePanel ID="updPnl" runat="server">
                                    <ContentTemplate>
                                        <table style="background-color: White; border-color: #999999; border-width: 1px;
                                            border-style: solid; width: 100%">
                                            <tr>
                                                <td align="left" colspan="2">
                                                    <b>
                                                        <asp:Label ID="lblViewTitle" runat="server">Closed Sales Analysis:</asp:Label>
                                                    </b>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #EEEEEE;">
                                                <td style="width: 20%">
                                                    Select 'Closed Sales Analysis' Type:
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ID="radBtnAnalysisType" runat="server">
                                                        <asp:ListItem Text="Product Sold" Value="1" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Opportunity Source" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Opportunity Type" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Sales Rep" Value="4"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                            <tr style="color: Black; background-color: #DCDCDC;">
                                                <td style="width: 20%">
                                                    Select Company(ies):
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ID="radBtnCompanySelection" runat="server">
                                                        <asp:ListItem Text="Only New Companies" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Only NON-New Companies" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="All Companies" Value="3"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <br />
                                                    <asp:DropDownList ID="drpLstCompanies" OnDataBound="ddlCreateDefaultSelection" runat="server">
                                                    </asp:DropDownList>
                                                    <br />
                                                    <br />
                                                    <asp:ListBox ID="lstCompanies" Height="250px" runat="server" OnDataBound="lbxCreateDefaultSelection"
                                                        SelectionMode="Multiple"></asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr  style="color: Black; background-color: #EEEEEE;">
                                                <td style="width: 20%">
                                                    Select Quantity / Value Choice:
                                                </td>
                                                <td>
                                                    <asp:RadioButtonList ID="radBtnQtyValChoice" runat="server">
                                                        <asp:ListItem Text="Sales Value" Value="1" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Sales Quantity" Value="2"></asp:ListItem>
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
                                                OnCommand="lnlNextStep_Click" Visible="True" OnClientClick="return performRequiredValidation();">View Gap Analysis Report</asp:LinkButton>
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
</asp:Content>
