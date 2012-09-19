<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<%@ Register Src="Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<div class="loginDisplay" style="display: block">
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
                OnLoggingOut="HeadLoginStatus_LoggingOut" />
            ]
        </LoggedInTemplate>
    </asp:LoginView>
    <a href="https://minedsystems.hostpilot.com/Shared%20Documents/User%20Role%20Description.pptx"
        target="_blank" style="color: White" runat="server" id="anchorUserGuide" visible="false">
        How-To Guide</a>&nbsp;<a href="https://minedsystems.hostpilot.com/Lists/Tasks/AllItems.aspx"
            target="_blank" id="anchorIcidentReporting" runat="server" visible="false"> Incident
            Reporting</a>
</div>
<uc1:Menu ID="Menu1" runat="server" />
