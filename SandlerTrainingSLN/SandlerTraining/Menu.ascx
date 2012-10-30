<%@ Import Namespace="Sandler.UI.ChartStructure" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<div class="clear hideSkiplink">
    <table style="width: 100%; border-color: White; border-style: none; border-width: thin">
        <tr>
            <td style="width: 20%">
                <asp:Image ImageUrl="~/images/header_logo.png" runat="server" ID="Image1" />
            </td>
            <td style="padding-top: 2.5em" width="70%">
                <ul class="dropdown">
                    <li><a id="anchorDASHBOARD" runat="server" href="Default.aspx">DASHBOARD</a></li>
                    <li><a id="anchorCHART" runat="server" href="#">REPORTS</a><ul id="reportsMenu" runat="server"
                        class="sub_menu">
                        <li><a href="">Franchisee</a><ul class="sub_menu">
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","NewAppointmentsBySourceMonth"))  %>">
                                New Appointments By Source (By Month)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","NewClientsByProductTypeMonth"))  %>">
                                New Clients By Product Type (By Month)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","NewClientQuantityAverageContractPriceByMonth"))  %>">
                                New Client Quantity & Average Contract Price (By Month)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ClassHeadcountByCourseIndustryMonth"))  %>">
                                Class Headcount By Course & Industry (By Month)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","AverageLengthTimeActiveClientsByIndustry"))  %>">
                                Average Length of Time for Active Clients (By Industry)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ActualDollarsBookedComparisonGoal"))  %>">
                                Actual Dollars Booked and Comparison to Goal (By Month)</a></li><!--
                            <li><a href="  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ClosedSalesAnalysis","ProductsSoldBySalesValue"))  %>">
                                Sales Value By Product (By Month)</a></li>
                            <li><a href="=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ClosedSalesAnalysis","ProductsSoldBySalesQuantity"))  %>">
                                Sales Quantity By Product (By Month)</a></li>
                            <li><a href="=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ClosedSalesAnalysis","SalesValueOppSource"))  %>">
                                Sales Value By Opportunity Source (By Month)</a></li>
                            <li><a href="=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ClosedSalesAnalysis","SalesQuantityOppSource"))  %>">
                                Sales Quantity By Opportunity Source (By Month)</a></li>-->
                        </ul>
                        </li>
                        <li><a href="">Client</a><ul class="sub_menu">
                            <li><a id="anchorCostOfSale" runat="server">Cost of Sale</a></li><li><a id="anchorSalesCycleTime"
                                runat="server">Sales Cycle Time</a></li><li><a id="anchorSalesTotalByMonth" runat="server">
                                    Sales Total By Month</a></li><li><a href="#">Sandler Sales Rep Retention</a></li><li>
                                        <a href="#">Pipeline Post Training</a></li><li><a href="#">Client Sales Rep Retention</a></li><li>
                                            <a>Client Return On Investment</a></li>
                        </ul>
                        </li>
                        <li><a href="#">Product</a><ul class="sub_menu">
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ProductMarginContributionByProductByMonth"))  %>">Product Margin Contribution</a></li><li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","FirstSaleProductValueByProductByMonth"))  %>">Products Sold as
                                a 1st Sale</a></li><li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ProductSoldToCompanyByProductByMonth","Reports/Products/SoldByCompany.aspx?"))  %>">Products Sold by Company</a></li><li><a href="#">
                                    Products Sold by Rep</a></li><li>
                        </ul>
                        </li>
                        <li><a href="#">Ad Hoc</a><ul class="sub_menu">
                            <li><a href="<%=  Page.ResolveClientUrl("~/Reports/ClosedSalesAnalysis.aspx")%>">Closed
                                Sales Analysis (By Month)</a></li><li><a href="<%=  Page.ResolveClientUrl("~/Reports/PipelineOppAnalysis.aspx")%>">
                                    Pipeline Analysis (By Month)</a></li>
                        </ul>
                        </li>
                    </ul>
                    </li>
                    <li><a id="anchorBenchmarks" runat="server" href="#">BENCHMARKS</a></li>
                    <li><a href="~/CRM/Companies/Index.aspx" id="anchorCRM" runat="server">CRM</a></li>
                    <li><a id="anchorMyAccount" runat="server" href="#">My Account</a><ul class="sub_menu">
                        <li><a href="<%=  Page.ResolveClientUrl("~/Account/ChangePassword.aspx") %>">Change
                            Password</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/BlastEmail.aspx") %>">Send Email</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Calendar/Index.aspx") %>">My Calendar</a></li><li>
                            <a id="manageCoachAnchor" runat="server" visible="false">Manage Coach</a></li>
                        <li><a id="manageFranchiseeAnchor" runat="server" visible="false">Manage Franchisee</a></li>
                        <li><a id="manageFranchiseeUserAnchor" runat="server" visible="false">Manage Franchisee
                            User</a></li>
                        <li><a id="manageEmailSubscription" runat="server" visible="false">Manage Email Subscription</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/ManageGroup.aspx") %>">Create Group</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/MeetingEnvite.aspx") %>">Send Meeting
                            Invite</a></li>
                    </ul>
                    </li>
                    <li><a id="anchorGapAnalysis" runat="server" href="~/GapAnalysisCreate.aspx">Gap Analysis</a>
                    </li>
                    <li><a id="anchorROI" runat="server" href="~/ROI.aspx">ROI&nbsp;&nbsp;</a></li>
                    <li><a id="anchorAssessment" runat="server" href="http://assessment.aberdeen.com/gqtJlzBd2X/SAN127/sponsor.aspx"
                        target="_blank">Sandler Training Assessment Tool</a></li>
                    <!--<li><a href="~/Account/Logout.aspx" id="anchorLogout" runat="server">LOGOUT</a>
                    </li>-->
                </ul>
            </td>
            <td style="width: 10%">
                <asp:Image ImageUrl="~/images/ABC-DayCare.jpg" runat="server" ID="clientLogo" Visible="false" />
            </td>
        </tr>
    </table>
</div>
