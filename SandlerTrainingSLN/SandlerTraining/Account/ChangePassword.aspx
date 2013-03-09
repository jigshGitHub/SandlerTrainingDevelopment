<%@ Page Title="My Account - Change Password" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Account_ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table class="changePassword">
        <tr>
            <td>
                <h2>
                    Change Password</h2>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblIntialPwdChange" runat="server" Text="Upon initial system login, each user is required to change their password."
                    Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPasswordInstruction" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/"
                    EnableViewState="false" RenderOuterTable="false" SuccessPageUrl="ChangePasswordSuccess.aspx"
                    OnChangePasswordError="ChangeUserPassword_ChangePasswordError" OnChangingPassword="ChangeUserPassword_ChangingPassword"
                    ChangePasswordFailureText="The New Password does not meet the security requirements of 6 characters including 1 “special character”.  Please correct and try again." FailureTextStyle-ForeColor="Red">
                    <ChangePasswordTemplate>
                        <span class="failureNotification">
                            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                        </span>
                        <div class="accountInfo">
                            <fieldset class="changePassword">
                                <legend>Account Information</legend>
                                <p>
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"
                                        Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                                        CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required."
                                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                        CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required."
                                        ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                        CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                                </p>
                            </fieldset>
                            <br />
                            <p>
                                <asp:Button ID="CancelPushButton" CssClass="submitButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" />
                                <asp:Button ID="ChangePasswordPushButton" CssClass="submitButton" runat="server"
                                    CommandName="ChangePassword" Text="Change Password" ValidationGroup="ChangeUserPasswordValidationGroup" />
                            </p>
                        </div>
                        <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
                            ValidationGroup="ChangeUserPasswordValidationGroup" />
                    </ChangePasswordTemplate>
                </asp:ChangePassword>
            </td>
        </tr>
    </table>
</asp:Content>
