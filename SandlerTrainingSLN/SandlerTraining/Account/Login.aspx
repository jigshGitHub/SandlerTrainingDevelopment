<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #336699">
    <form id="form1" runat="server">
    <div>
        <img width="100%" src="<%= Page.ResolveClientUrl("~/images/Landing_Page.png") %>" alt="Sandler Logo" />
        <asp:Login runat="server" ID="sandlerLogin" DestinationPageUrl="~/Default.aspx" Style="position: absolute;
            left: 500px; top: 60px;" onloggedin="sandlerLogin_LoggedIn">
            <LayoutTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblUserName" runat="server" Text="User Name" AssociatedControlID="UserName"
                                ForeColor="#FFFFFF" />
                        </td>
                        <td>
                            <span style="color: #FFFFFF">:</span>
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" MaxLength="20" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="Password"
                                ForeColor="#FFFFFF" />
                        </td>
                        <td>
                            <span style="color: #FFFFFF">:</span>
                        </td>
                        <td>
                            <asp:TextBox ID="Password" MaxLength="20" runat="server" TextMode="Password" Text="pa$$word" />
                        </td>
                        <td>
                            <asp:Button runat="server" CommandName="Login" ID="btnLogin" Text="LOGIN" Style="background-color: #336699;
                                color: #FFFFFF; margin-left: 10px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                ErrorMessage="User Name is required." ForeColor="#FFFFFF" Text="User Name is required." />
                        </td>
                        <td colspan="3">
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                ErrorMessage="Password is required." ForeColor="#FFFFFF" Text="Password is required." />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" style="color: #FFFFFF;">
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </div>
    </form>
</body>
</html>
