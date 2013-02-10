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
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","NewAppointmentsBySourceMonth","ChartcustomPage.aspx?"))  %>">
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
                            <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ProductMarginContributionByProductByMonth"))  %>">
                                Product Margin Contribution</a></li><li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","FirstSaleProductValueByProductByMonth"))  %>">
                                    Products Sold as a 1st Sale</a></li><li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ProductSoldToCompanyByProductByMonth","Reports/Products/SoldByCompany.aspx?"))  %>">
                                        Products Sold by Company</a></li><li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","ProductSoldBySalesRepByProductByMonth","Reports/Products/SoldByCompanySalesRep.aspx?"))  %>">
                                            Products Sold by Rep</a></li>
                        </ul>
                        </li>
                        <li><a href="#">Ad Hoc</a>
                        <ul class="sub_menu">
                            <li><a href="<%=  Page.ResolveClientUrl("~/Reports/ClosedSalesAnalysis.aspx")%>">Closed Sales Analysis (By Month)</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/Reports/PipelineOppAnalysis.aspx")%>">Pipeline Analysis (By Month)</a></li>
                        </ul>
                        </li>

                        <li><a href="#">Home Office</a>
                        <ul class="sub_menu">
                            <li><a href="#">Franchisee Report By...</a>
                                <ul class="sub_menu">
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbycoach")%>">Coach</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbyregion")%>">Region</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbystate")%>">State</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbycountry")%>">Country/Province</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbyawlevel")%>">Award Level</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbytrngdate")%>">Initial Trng Date</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbycontdetails")%>">Contract Details</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbybusarea")%>">Business Area</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbycertlevel")%>">Certification Level</a></li>
                                    <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frbyusingcrm")%>">Using Sandler CRM</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=mfrd")%>">Master Franchisee Details</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=msfr")%>">Master/Sub Franchisees</a></li>
                            <li><a href="#">Membership Reports</a>
                                <ul class="sub_menu">
                                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=msrbykeyopnldr")%>">Key Opinion Leaders</a></li>
                                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=msrbyadvboard")%>">Advisory Board</a></li>
                                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=msrbymktgcom")%>">Marketing Committee</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=dhsa")%>">David H. Sandler Award</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=ctra")%>">Contractors Allowed?</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=sere")%>">Sandler Email Required?</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=zcbt")%>">Zip Codes By Territory</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=msfc")%>">Must Submit Financials</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=prpl")%>">Product Purchase Levels</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=frmd")%>">Franchisee Member Details</a></li>
                            <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/HomeOfficeReports.aspx?reportName=glaa")%>">Global Account Agreement</a></li>
                        </ul>
                        </li>



                    </ul>
                    </li>
                    <li><a id="anchorBenchmarks" runat="server" href="#">BENCHMARKS</a><ul id="Ul1" runat="server"
                        class="sub_menu">
                        <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","BenchmarkSalesRepFranchisee","Reports/Benchmarks/SalesrepToFranchisee.aspx?"))  %>">
                            Rep to Franchise</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","BenchmarkFranchiseeRegion","Reports/Benchmarks/FranchiseeToRegion.aspx?"))  %>">
                            Franchise to Region</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","BenchmarkRegionCountry","Reports/Benchmarks/RegionToCountry.aspx?"))  %>">
                            Region to Country</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/" + ChartHelper.GeneratePageLink("","BenchmarkCountryAll","Reports/Benchmarks/CountryToAll.aspx?"))  %>">
                            Country to "All"</a></li>
                    </ul>
                    </li>
                    
                    <%--<li>
                        <a href="~/CRM/Companies/Index.aspx" id="anchorCRM" runat="server">CRM</a>
                    </li>--%>

                    <li><a id="a1" runat="server" href="#">CRM</a>
                      <ul class="sub_menu">
                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/Companies/Index.aspx") %>">Companies</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/Contacts/Index.aspx") %>">Contacts</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/Opportunities/Index.aspx") %>">Pipeline</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/Documents/Index.aspx") %>">Documents</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/CRM/HomeOffice/Index.aspx") %>">Home Office</a></li>
                      </ul>
                    </li>


                    <li><a id="anchorMyAccount" runat="server" href="#">My Account</a>
                    <ul class="sub_menu">
                        <li><a href="<%=  Page.ResolveClientUrl("~/Account/ChangePassword.aspx") %>">Change Password</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/BlastEmail.aspx") %>">Send Email</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Calendar/Index.aspx") %>">My Calendar</a></li>
                        <li><a id="manageCoachAnchor" runat="server" visible="false">Manage Coach</a></li>
                        <li><a id="manageFranchiseeAnchor" runat="server" visible="false">Manage Franchisee</a></li>
                        <li><a id="manageFranchiseeUserAnchor" runat="server" visible="false">Manage Franchisee User</a></li>
                        <li><a id="manageEmailSubscription" runat="server" visible="false">Manage Email Subscription</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/ManageGroup.aspx") %>">Create Group</a></li>
                        <li><a href="<%=  Page.ResolveClientUrl("~/Email/MeetingEnvite.aspx") %>">Send Meeting Invite</a></li>
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
