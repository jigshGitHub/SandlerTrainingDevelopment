<%@ Page Title="My Account - Franchisee Index" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Account_FranchiseeOwner_Index" %>

<%@ Register Src="~/CRM/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td style="width: 100%" align="right">
                <a href="Add.aspx" id="addFranchiseeLink" runat="server">Add Franchisee</a>
            </td>
        </tr>
        <tr>
            <td>
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr>
                        <td>
                            <asp:GridView Width="100%" ID="gvFranchiseeOwners" runat="server" AutoGenerateColumns="false"
                                DataKeyNames="ID">
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField DataField="ID" Visible="False" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Name"
                                        HeaderText="Franchisee" SortExpression="Name" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="UserName"
                                        HeaderText="User Name" SortExpression="UserName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FrOwnerFirstName"
                                        HeaderText="First Name" SortExpression="FrOwnerFirstName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FrOwnerLastName"
                                        HeaderText="Last Name" SortExpression="FrOwnerLastName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Email"
                                        HeaderText="Email" SortExpression="Email" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <a href="Detail.aspx?userId=<%#Eval("UserId")%>&id=<%#Eval("Id")%>">View Detail...</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="Pager">
                <uc1:Pager ID="pager" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
