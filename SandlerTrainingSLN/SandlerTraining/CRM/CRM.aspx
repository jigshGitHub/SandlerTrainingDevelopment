<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CRM.aspx.cs" Inherits="CRM" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">
    <script type="text/javascript" src="../FusionChartLib/FusionCharts.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.4.1.min.js"></script>
    <title></title>
    <link href="~/Styles/CRMSite.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="Form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        <!--[ <a href="~/Account/Login.aspx" id="HeadLoginStatus" runat="server">Log In</a>
                        ]-->
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold">
                            <asp:LoginName ID="HeadLoginName" runat="server" />
                        </span>! [
                        <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out"
                            LogoutPageUrl="~/" />
                        ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <table>
                    <tr>
                        <td>
                            <img src="../images/header_logo_crm_test.png" alt="Sandler Logo" />
                        </td>
                        <td>
                            <button type="button" class="menuButtonActive" id="btnDashboard">
                                <b>DASHBOARD</b>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="menuButton">
                                Reports
                            </button>
                        </td>
                        <td>
                            <button type="button" class="menuButton" id="btnCRM">
                                CRM
                            </button>
                        </td>
                        <td>
                            <button type="button" class="menuButton" onclick="window.open('IndustryAVe.html','_self')">
                                BENCHMARKS
                            </button>
                        </td>
                        <td>
                            <button type="button" class="menuButton" onclick="window.open('Products.html','_self')">
                                PRODUCTS
                            </button>
                        </td>
                        <td>
                            <button type="button" class="menuButton" onclick="window.open('Logout.html','_self')">
                                LOGOUT
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="main">
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="footer">
    </div>
    <%--<script language="javascript">
        $(document).ready(function () {
            $('#btnDashboard').click(function () {
                window.open('Default.aspx', '_self');
            });

            $('#btnCRM').click(function () {
                window.open('CRM.aspx', '_self');
            });
        });
    </script>--%>
    </form>
</body>
</html>
