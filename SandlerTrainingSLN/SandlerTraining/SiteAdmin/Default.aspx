<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="SiteAdmin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="createRole" runat="server">
        <ContentTemplate>
            <table style="background-color: #B5C7DE; color: #EFF3FB; border-width: 1px; border-color: #B5C7DE;
                border-style: solid; font-family: Verdana">
                <tr>
                    <td width="100%" align="center" style="color: #FFFFFF; background-color: #507CD1;
                        font-weight: bold; font-family: Verdana; width: 100%">
                        Create new role
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RoleNameReqField" runat="server" ControlToValidate="RoleName"
                            Display="Dynamic" ErrorMessage="You must enter a role name." ForeColor="#284E98" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" BackColor="White"
                            BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                            ForeColor="#284E98" OnClick="CreateRoleButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#284E98" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="ipCreatUSer" runat="server">
        <ContentTemplate>
            <asp:CreateUserWizard ID="SandlerCreateUserWizard" runat="server" BackColor="#EFF3FB"
                BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
                Font-Size="1em" OnCreatedUser="SandlerCreateUserWizard_CreatedUser" OnCreateUserError="SandlerCreateUserWizard_CreateUserError">
                <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server">
                        <ContentTemplate>
                            <table style="font-family: Verdana; font-size: 100%;">
                                <tr>
                                    <td align="center" colspan="2" style="color: White; background-color: #507CD1; font-weight: bold;">
                                        Sign Up for Your New Account
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                            ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                            ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                            ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                            ErrorMessage="Security question is required." ToolTip="Security question is required."
                                            ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                            ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                            ValidationGroup="SandlerCreateUserWizard">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="Label1" runat="server" AssociatedControlID="RoleList">Assign Roles:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBoxList ID="RoleList" runat="server" DataSourceID="rolesSource" DataTextField="RoleName"
                                            DataValueField="RoleName">
                                        </asp:CheckBoxList>
                                        <asp:SqlDataSource ID="rolesSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>"
                                            SelectCommand="SELECT vw_aspnet_Roles.RoleName, vw_aspnet_Roles.RoleId FROM vw_aspnet_Roles INNER JOIN vw_aspnet_Applications ON vw_aspnet_Roles.ApplicationId = vw_aspnet_Applications.ApplicationId WHERE (vw_aspnet_Applications.ApplicationName = 'SandlerTraining')">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                            ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                            ValidationGroup="SandlerCreateUserWizard"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: Red;">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep runat="server" />
                </WizardSteps>
                <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" BorderWidth="2px"
                    Font-Bold="True" Font-Size="1em" ForeColor="White" HorizontalAlign="Center" />
                <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" ForeColor="White" />
                <SideBarStyle BackColor="#507CD1" Font-Size="1em" VerticalAlign="Top" />
                <StepStyle Font-Size="0.8em" />
            </asp:CreateUserWizard>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
