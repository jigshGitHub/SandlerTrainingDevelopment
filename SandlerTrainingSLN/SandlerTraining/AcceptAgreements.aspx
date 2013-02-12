<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AcceptAgreements.aspx.cs"
    Inherits="AcceptAgreements" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/Styles/Menu/style.css" type="text/css" media="screen, projection" />
    <link rel="stylesheet" type="text/css" href="~/jquery-ui-1.8.23.custom/css/start/jquery-ui-1.8.23.custom.css" />
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/jquery-ui-1.8.23.custom/js/jquery-1.8.0.min.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/jquery-ui-1.8.23.custom/js/jquery-ui-1.8.23.custom.min.js") %>"></script>
</head>
<body style="background-color: #336699">
    <form id="form1" runat="server">
    <div id="dialog" title="Agreements:" style="font-size: small">
        <table>
            <tr>
                <td>
                    To activate your subscription to the Sandler Performance Metrics system, please
                    read and “accept” both the Mined Systems Inc. Master Subscription Agreement and
                    the Mined Systems Inc. Privacy Policy documents.<br />&nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkSubscription" runat="server" />&nbsp;<asp:HyperLink runat="server"
                        NavigateUrl="~/UserDocuments/MSIMasterSubscriptionAgreement.pdf" Target="_blank">MSI Master Subscription Agreement</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkPrivacy" runat="server" />&nbsp;<asp:HyperLink runat="server"
                        NavigateUrl="~/UserDocuments/MSIPrivacyPolicy.pdf" Target="_blank">MSI Privacy Policy</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Button ID="btnAccept" Text="Accept" runat="server" 
                        onclick="btnAccept_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div>
    </div>
    </form>
</body>
<script type="text/javascript">
    $(document).ready(function () {

        $('#dialog').dialog({

            autoOpen: false,
            width: 500,
            modal: true

        });

        $('#dialog').parent().appendTo($("form:first"));

        $('#dialog').dialog('open');

        $('#<%=chkSubscription.ClientID %>').click(function () { checkAgreementsClicked(); });
        $('#<%=chkPrivacy.ClientID %>').click(function () { checkAgreementsClicked(); });

        checkAgreementsClicked = function () {
            if ($('#<%=chkSubscription.ClientID %>').attr('checked') == 'checked' && $('#<%=chkPrivacy.ClientID %>').attr('checked') == 'checked')
                $('#<%=btnAccept.ClientID %>').attr('style', 'visibility:visible');
            else
                $('#<%=btnAccept.ClientID %>').attr('style', 'visibility:hidden');
        }
    });</script>
</html>
