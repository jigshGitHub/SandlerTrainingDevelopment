<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ROI.aspx.cs" Inherits="ROI" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Button ID="noShowButton" runat="server" Style="display: none" />
    <asp:Panel ID="pnlChart" runat="server" CssClass="roiChartModalPopup" Width="60%"
        Style="display: block">
        <table width="100%">
            <tr>
                <td>
                    <input id="btnReDo" type="button" value="Re-Do ROI Calculation" class="blueButton" />
                    &nbsp;<input id="btnGoToDashBoard" type="button" value="Go to Dashboard" class="blueButton" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="chartContainer" runat="server">
                    </div>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ModalPopupExtender ID="pnlChart_ModalPopupExtender" runat="server" DynamicServicePath=""
        Enabled="True" TargetControlID="noShowButton" BackgroundCssClass="modalBackground"
        OkControlID="btnReDo" CancelControlID="btnGoToDashBoard" OnCancelScript="onCancel()"
        PopupControlID="pnlChart">
    </asp:ModalPopupExtender>
    <table align="center" width="90%" style="background-color: White">
        <tr>
            <td width="90%">
                <b>&nbsp;</b>
            </td>
            <td align="right">
                <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="blueButton" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="90%" align="center">
                    <tr>
                        <td colspan="5" style="background-color: #4985d6; color: White;">
                            Cash Flow and ROI Statement
                        </td>
                    </tr>
                    <tr style="">
                        <th>
                            BENEFIT DRIVERS
                        </th>
                        <%=PopulateYears()%>
                    </tr>
                    <tr>
                        <td width="60%">
                            Investment in Sandler Training per year
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="TextBox1" runat="server" Width="70" CssClass="disabledTextBx" Text="$400,000"
                                Enabled="false" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013TrainingInvestment" name="_2013TrainingInvestment" runat="server"
                                Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014TrainingInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015TrainingInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <div id="areaOfImprovement">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            Areas of Improvement
                                        </td>
                                        <td width="10%">
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Reduced labor cost due to shorter sales cycle time
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox2" runat="server" Width="70" CssClass="disabledTextBx" Text="$75,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013CostReductionSalesCycleTime" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014CostReductionSalesCycleTime" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015CostReductionSalesCycleTime" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Reduced labor cost from sales efficiency (higher close rate)
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox3" runat="server" Width="70" CssClass="disabledTextBx" Text="$125,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013CostReductionSalesEfficiency" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014CostReductionSalesEfficiency" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015CostReductionSalesEfficiency" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Increased value of Qualified Sales (closed deals)
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox4" runat="server" Width="70" CssClass="disabledTextBx" Text="$30,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013IncreasedQualifiedSales" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014IncreasedQualifiedSales" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015IncreasedQualifiedSales" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Training cost savings for retained sales reps
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox5" runat="server" Width="70" CssClass="disabledTextBx" Text="$35,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013SavingsonRetainedSalesReps" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014SavingsonRetainedSalesReps" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015SavingsonRetainedSalesReps" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Increased value of sales rep quota achievement
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox6" runat="server" Width="70" CssClass="disabledTextBx" Text="$35,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013IncreasedQuotaAchievement" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014IncreasedQuotaAchievement" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015IncreasedQuotaAchievement" runat="server" Width="70" Font-Size="Smaller" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="60%" style="padding-left: 10px">
                                            Total annual benefits
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="TextBox7" runat="server" Width="70" CssClass="disabledTextBx" Text="$300,000"
                                                Enabled="false" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2013TotalAnnualBenefits" runat="server" Width="70" CssClass="disabledTextBx" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2014TotalAnnualBenefits" runat="server" Width="70" CssClass="disabledTextBx" />
                                        </td>
                                        <td align="right">
                                            <asp:TextBox ID="_2015TotalAnnualBenefits" runat="server" Width="70" CssClass="disabledTextBx" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Estimated benefits gained
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="TextBox8" runat="server" Width="70" CssClass="disabledTextBx" Text="50%"
                                Enabled="false" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013EstimatedBenefitsGained" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014EstimatedBenefitsGained" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015EstimatedBenefitsGained" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Total benefits realized
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="TextBox9" runat="server" Width="70" CssClass="disabledTextBx" Text="$150,000"
                                Enabled="false" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013TotalBenefitsRealized" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014TotalBenefitsRealized" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015TotalBenefitsRealized" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="90%" align="center">
                    <tr>
                        <td colspan="5" style="background-color: #4985d6; color: White;">
                            Benefits
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            &nbsp;
                        </th>
                        <%=PopulateYears()%>
                    </tr>
                    <tr>
                        <td width="60%">
                            Annual benefit flow
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012AnnualBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013AnnualBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014AnnualBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015AnnualBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Cumulative benefit flow
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012CumBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013CumBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014CumBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015CumBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="90%" align="center">
                    <tr>
                        <td colspan="5" style="background-color: #4985d6; color: White;">
                            Discounted benefit flow
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            &nbsp;
                        </th>
                        <%=PopulateYears()%>
                    </tr>
                    <tr>
                        <td width="60%">
                            Discounted costs
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012DiscountedCosts" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013DiscountedCosts" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014DiscountedCosts" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015DiscountedCosts" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Discounted benefits
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012DiscountedBenefits" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013DiscountedBenefits" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014DiscountedBenefits" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015DiscountedBenefits" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Total discounted benefit flow
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012TotalDiscountBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013TotalDiscountBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014TotalDiscountBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015TotalDiscountBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Total cumulative discounted benefit flow
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012TotalCumDiscountedBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013TotalCumDiscountedBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014TotalCumDiscountedBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015TotalCumDiscountedBenefitFlow" runat="server" Width="70" Font-Size="Smaller"
                                CssClass="disabledTextBx" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="90%" align="center" id='TotalCostsBlock'>
                    <tr>
                        <td colspan="5" style="background-color: #4985d6; color: White;">
                            Investment & implementation costs
                        </td>
                    </tr>
                    <tr>
                        <th align="left">
                            &nbsp;
                        </th>
                        <%=PopulateYears()%>
                    </tr>
                    <tr>
                        <td width="60%">
                            Initial Training Investment
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012InitialTrngInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013InitialTrngInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014InitialTrngInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015InitialTrngInvestment" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Implementation costs
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012ImplementationCost" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013ImplementationCost" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014ImplementationCost" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015ImplementationCost" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Ongoing support costs
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012OngoingSupportCosts" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013OngoingSupportCosts" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014OngoingSupportCosts" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015OngoingSupportCosts" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Total costs
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012TotalCosts" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013TotalCosts" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014TotalCosts" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015TotalCosts" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="90%" align="center" id='Table1'>
                    <tr>
                        <td colspan="2" style="background-color: #4985d6; color: White;">
                            ROI measures
                        </td>
                    </tr>
                    <tr>
                        <td width="60%">
                            Cost of capital
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="_2012CostOfCapital" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Net present value
                        </td>
                        <td width="10%">
                            <asp:TextBox ID="NetPresentValue" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Return on investment
                        </td>
                        <td width="10%">
                            &nbsp;
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2013ROI" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2014ROI" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                        <td align="right">
                            <asp:TextBox ID="_2015ROI" runat="server" Width="70" Font-Size="Smaller" CssClass="disabledTextBx" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Payback (in years)
                        </td>
                        <td>
                            <asp:TextBox ID="PayBackInYears" runat="server" Width="70" Font-Size="Smaller" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function onCancel() {
            window.open('Default.aspx', '_self');
        }
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

        function EndRequestHandler(sender, args) {
            if (args.get_error() == undefined) {
                ajaxHookup();
            }
        }

        function ajaxHookup() {

            $(document).ready(function () {

                $('#<%=btnNext.ClientID %>').click(function () {
                    $(document).find('input:text').each(function () {
                        if ($(this).val().length > 0) {
                            if (typeof ($(this).attr('readonly')) != 'undefined')
                                $(this).removeAttr('readonly');
                            $(this).val($(this).asNumber());
                        }
                    });
                });

                $.each($('#[id*=TrainingInvestment]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=CostReductionSalesCycleTime]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=CostReductionSalesEfficiency]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=IncreasedQualifiedSales]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=SavingsonRetainedSalesReps]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });

                });


                $.each($('#[id*=IncreasedQuotaAchievement]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalBenefits();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });

                });

                $.each($('#[id*=InitialTrngInvestment]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalCosts();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=ImplementationCost]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalCosts();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });
                $.each($('#[id*=OngoingSupportCosts]'), function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    calculateTotalCosts();
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });
                });

                $.each($('#[id*=EstimatedBenefitsGained]'), function () {
                    $(this).blur(function () {
                        $(this).formatCurrency({ colorize: true, positiveFormat: '%n%', roundToDecimalPlace: -1 });
                        calculateTotalBenefits();
                    });
                });

                $.each($('#[id*=CostOfCapital]'), function () {
                    $(this).blur(function () {
                        $(this).formatCurrency({ colorize: true, positiveFormat: '%n%', roundToDecimalPlace: -1 });
                        calculateTotalCosts();
                    });
                });

                calculateTotalBenefits();
                calculateTotalCosts();


                function calculateTotalBenefits() {
                    //Reset first 
                    $('#areaOfImprovement').find('#<%=_2013TotalAnnualBenefits.ClientID %>').val('');
                    $('#areaOfImprovement').find('#<%=_2013TotalAnnualBenefits.ClientID %>').val('');
                    $('#areaOfImprovement').find('#<%=_2014TotalAnnualBenefits.ClientID %>').val('');
                    $('#areaOfImprovement').find('#<%=_2015TotalAnnualBenefits.ClientID %>').val('');
                    $('#areaOfImprovement').find('#<%=_2013TotalAnnualBenefits.ClientID %>').val($('#areaOfImprovement').find('#[id*=_2013]').sum());
                    $('#areaOfImprovement').find('#<%=_2014TotalAnnualBenefits.ClientID %>').val($('#areaOfImprovement').find('#[id*=_2014]').sum());
                    $('#areaOfImprovement').find('#<%=_2015TotalAnnualBenefits.ClientID %>').val($('#areaOfImprovement').find('#[id*=_2015]').sum());

                    calculateTotalBenefitsRealized();

                    $('#areaOfImprovement').find('#<%=_2013TotalAnnualBenefits.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $('#areaOfImprovement').find('#<%=_2014TotalAnnualBenefits.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $('#areaOfImprovement').find('#<%=_2015TotalAnnualBenefits.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                }

                function calculateTotalBenefitsRealized() {
                    //Reset first 
                    $(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').val('');
                    $(document).find('#<%=_2014TotalBenefitsRealized.ClientID %>').val('');
                    $(document).find('#<%=_2015TotalBenefitsRealized.ClientID %>').val('');

                    $(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').val(($('#areaOfImprovement').find('#<%=_2013TotalAnnualBenefits.ClientID %>').val() * $(document).find('#<%=_2013EstimatedBenefitsGained.ClientID %>').asNumber()) / 100);
                    $(document).find('#<%=_2014TotalBenefitsRealized.ClientID %>').val(($('#areaOfImprovement').find('#<%=_2014TotalAnnualBenefits.ClientID %>').val() * $(document).find('#<%=_2014EstimatedBenefitsGained.ClientID %>').asNumber()) / 100);
                    $(document).find('#<%=_2015TotalBenefitsRealized.ClientID %>').val(($('#areaOfImprovement').find('#<%=_2015TotalAnnualBenefits.ClientID %>').val() * $(document).find('#<%=_2015EstimatedBenefitsGained.ClientID %>').asNumber()) / 100);


                    $(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014TotalBenefitsRealized.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015TotalBenefitsRealized.ClientID %>').formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                }

                function calculateTotalCosts() {
                    $(document).find('#<%=_2012TotalCosts.ClientID %>').val('');
                    $(document).find('#<%=_2013TotalCosts.ClientID %>').val('');
                    $(document).find('#<%=_2014TotalCosts.ClientID %>').val('');
                    $(document).find('#<%=_2015TotalCosts.ClientID %>').val('');

                    $(document).find('#<%=_2012TotalCosts.ClientID %>').val($('#TotalCostsBlock').find('#[id*=_2012]').sum()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013TotalCosts.ClientID %>').val($('#TotalCostsBlock').find('#[id*=_2013]').sum() + $(document).find('#<%=_2013TrainingInvestment.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014TotalCosts.ClientID %>').val($('#TotalCostsBlock').find('#[id*=_2014]').sum() + $(document).find('#<%=_2014TrainingInvestment.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015TotalCosts.ClientID %>').val($('#TotalCostsBlock').find('#[id*=_2015]').sum() + $(document).find('#<%=_2015TrainingInvestment.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    calculateBenefitsFlow();
                    calculateDiscountedBenefitsFlow();
                    calculatePayBackInYears();
                }

                function calculateBenefitsFlow() {

                    /* Total benefits realized minus Total costs  */
                    $(document).find('#<%=_2012AnnualBenefitFlow.ClientID %>').val(-$(document).find('#<%=_2012TotalCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013AnnualBenefitFlow.ClientID %>').val($(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').asNumber() - $(document).find('#<%=_2013TotalCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014AnnualBenefitFlow.ClientID %>').val($(document).find('#<%=_2014TotalBenefitsRealized.ClientID %>').asNumber() - $(document).find('#<%=_2014TotalCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015AnnualBenefitFlow.ClientID %>').val($(document).find('#<%=_2015TotalBenefitsRealized.ClientID %>').asNumber() - $(document).find('#<%=_2015TotalCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    /* Previous year Cumulative benefit plus calculation year annual benefit  */
                    $(document).find('#<%=_2012CumBenefitFlow.ClientID %>').val($(document).find('#<%=_2012AnnualBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013CumBenefitFlow.ClientID %>').val($(document).find('#<%=_2012CumBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2013AnnualBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014CumBenefitFlow.ClientID %>').val($(document).find('#<%=_2013CumBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2014AnnualBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015CumBenefitFlow.ClientID %>').val($(document).find('#<%=_2014CumBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2015AnnualBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                }
                function calculateDiscountedBenefitsFlow() {
                    $(document).find('#<%=_2012DiscountedCosts.ClientID %>').val($(document).find('#<%=_2012TotalCosts.ClientID %>').asNumber() / Math.pow(1.15, 0)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013DiscountedCosts.ClientID %>').val($(document).find('#<%=_2013TotalCosts.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 1)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014DiscountedCosts.ClientID %>').val($(document).find('#<%=_2014TotalCosts.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 2)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015DiscountedCosts.ClientID %>').val($(document).find('#<%=_2015TotalCosts.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 3)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    $(document).find('#<%=_2012DiscountedBenefits.ClientID %>').val(0).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013DiscountedBenefits.ClientID %>').val($(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 1)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014DiscountedBenefits.ClientID %>').val($(document).find('#<%=_2014TotalBenefitsRealized.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 2)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015DiscountedBenefits.ClientID %>').val($(document).find('#<%=_2015TotalBenefitsRealized.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 3)).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    $(document).find('#<%=_2012TotalDiscountBenefitFlow.ClientID %>').val($(document).find('#<%=_2012DiscountedBenefits.ClientID %>').asNumber() - $(document).find('#<%=_2012DiscountedCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013TotalDiscountBenefitFlow.ClientID %>').val($(document).find('#<%=_2013DiscountedBenefits.ClientID %>').asNumber() - $(document).find('#<%=_2013DiscountedCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014TotalDiscountBenefitFlow.ClientID %>').val($(document).find('#<%=_2014DiscountedBenefits.ClientID %>').asNumber() - $(document).find('#<%=_2014DiscountedCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015TotalDiscountBenefitFlow.ClientID %>').val($(document).find('#<%=_2015DiscountedBenefits.ClientID %>').asNumber() - $(document).find('#<%=_2015DiscountedCosts.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    $(document).find('#<%=_2012TotalCumDiscountedBenefitFlow.ClientID %>').val($(document).find('#<%=_2012TotalDiscountBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2013TotalCumDiscountedBenefitFlow.ClientID %>').val($(document).find('#<%=_2012TotalCumDiscountedBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2013TotalDiscountBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2014TotalCumDiscountedBenefitFlow.ClientID %>').val($(document).find('#<%=_2013TotalCumDiscountedBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2014TotalDiscountBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                    $(document).find('#<%=_2015TotalCumDiscountedBenefitFlow.ClientID %>').val($(document).find('#<%=_2014TotalCumDiscountedBenefitFlow.ClientID %>').asNumber() + $(document).find('#<%=_2015TotalDiscountBenefitFlow.ClientID %>').asNumber()).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    //Calculation of NetPresentValue
                    var npvValue = 0.0;
                    npvValue = $(document).find('#<%=_2013AnnualBenefitFlow.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 1)
                    npvValue = npvValue + $(document).find('#<%=_2014AnnualBenefitFlow.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 2)
                    npvValue = npvValue + $(document).find('#<%=_2015AnnualBenefitFlow.ClientID %>').asNumber() / Math.pow(1 + ($(document).find('#<%=_2012CostOfCapital.ClientID %>').asNumber() / 100), 3)
                    npvValue = npvValue + $(document).find('#<%=_2012AnnualBenefitFlow.ClientID %>').asNumber();
                    $(document).find('#<%=NetPresentValue.ClientID %>').val(npvValue).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });

                    //Calculation of ROI
                    $(document).find('#<%=_2013ROI.ClientID %>').val(($(document).find('#<%=_2013DiscountedBenefits.ClientID %>').asNumber() / ($(document).find('#<%=_2012DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2013DiscountedCosts.ClientID %>').asNumber())) * 100).formatCurrency({ colorize: true, positiveFormat: '%n%', roundToDecimalPlace: 0 });
                    $(document).find('#<%=_2014ROI.ClientID %>').val((($(document).find('#<%=_2012DiscountedBenefits.ClientID %>').asNumber() + $(document).find('#<%=_2013DiscountedBenefits.ClientID %>').asNumber() + $(document).find('#<%=_2014DiscountedBenefits.ClientID %>').asNumber()) / ($(document).find('#<%=_2012DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2013DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2014DiscountedCosts.ClientID %>').asNumber())) * 100).formatCurrency({ colorize: true, positiveFormat: '%n%', roundToDecimalPlace: 0 });
                    $(document).find('#<%=_2015ROI.ClientID %>').val((($(document).find('#<%=_2012DiscountedBenefits.ClientID %>').asNumber() + $(document).find('#<%=_2013DiscountedBenefits.ClientID %>').asNumber() + $(document).find('#<%=_2014DiscountedBenefits.ClientID %>').asNumber() + $(document).find('#<%=_2015DiscountedBenefits.ClientID %>').asNumber()) / ($(document).find('#<%=_2012DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2013DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2014DiscountedCosts.ClientID %>').asNumber() + $(document).find('#<%=_2015DiscountedCosts.ClientID %>').asNumber())) * 100).formatCurrency({ colorize: true, positiveFormat: '%n%', roundToDecimalPlace: 0 });
                }

                function calculatePayBackInYears() {
                    var payBackInYears;
                    if ($(document).find('#<%=_2015CumBenefitFlow %>').asNumber() <= 0) {
                        payBackInYears = "After Year 3";
                    }
                    else {
                        if ($(document).find('#<%=_2014CumBenefitFlow %>').asNumber() <= 0) {
                            payBackInYears = (($(document).find('#<%=_2015AnnualBenefitFlow %>').asNumber() - $(document).find('#<%=_2015CumBenefitFlow %>').asNumber()) / $(document).find('#<%=_2015AnnualBenefitFlow %>').asNumber()) + 2
                        }
                        else {
                            if ($(document).find('#<%=_2013CumBenefitFlow %>').asNumber() <= 0) {
                                payBackInYears = (($(document).find('#<%=_2014AnnualBenefitFlow %>').asNumber() - $(document).find('#<%=_2014CumBenefitFlow %>').asNumber()) / $(document).find('#<%=_2014AnnualBenefitFlow %>').asNumber()) + 1
                            }
                            else {
                                if ($(document).find('#<%=_2012AnnualBenefitFlow %>').asNumber() <= 0) {
                                    payBackInYears = (($(document).find('#<%=_2013AnnualBenefitFlow %>').asNumber() - $(document).find('#<%=_2013CumBenefitFlow %>').asNumber()) / $(document).find('#<%=_2013AnnualBenefitFlow %>').asNumber()) + 1
                                }
                                else {
                                    payBackInYears = $(document).find('#<%=_2012TotalCosts.ClientID %>').asNumber() / $(document).find('#<%=_2013TotalBenefitsRealized.ClientID %>').asNumber();
                                }
                            }
                        }
                    }

                    $(document).find('#<%=PayBackInYears.ClientID %>').val(payBackInYears);
                    /*

                    IF(Yr3CumBenefitFlow<=0)
                    {
                    "After Year 3"
                    }
                    ELSE
                    {
                    IF(Yr2CumBenefitFlow<=0\)
                    {
                    (Yr3AnnualBenefitFlow-Yr3CumBenefitFlow)/Yr3AnnualBenefitFlow)+2
                    }
                    ELSE
                    {
                    IF(Yr1CumBenefitFlow<=0)
                    {
                    (Yr2AnnualBenefitFlow-Yr2CumBenefitFlow)/Yr2AnnualBenefitFlow)+1
                    }
                    ELSE
                    {
                    {
                    IF(Yr0AnnualBenefitFlow<=0)
                    (Yr1AnnualBenefitFlow-Yr1CumBenefitFlow)/Yr1AnnualBenefitFlow
                    Else
                    (Yr0TotalCost)/Yr1TotalBenefitsRealized)
                    }
                    }		
                    }	
                    }
                    =IF(Yr3CumBenefitFlow<=0,"After Year 3",
                    IF(Yr2CumBenefitFlow<=0,((Yr3AnnualBenefitFlow-Yr3CumBenefitFlow)/Yr3AnnualBenefitFlow)+2,
                    IF(Yr1CumBenefitFlow<=0,((Yr2AnnualBenefitFlow-Yr2CumBenefitFlow)/Yr2AnnualBenefitFlow)+1,
                    IF(Yr0AnnualBenefitFlow<=0,(Yr1AnnualBenefitFlow-Yr1CumBenefitFlow)/Yr1AnnualBenefitFlow,(Yr0TotalCost)/Yr1TotalBenefitsRealized))))				



                    */

                }
            });
        }

        ajaxHookup();

    </script>
</asp:Content>
