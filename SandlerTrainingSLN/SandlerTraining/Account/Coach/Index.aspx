﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="Account_Coach_Index" %>
    
<%@ Register Src="~/CRM/Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td style="width: 50%">
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr>
                        <td>
                            <asp:GridView Width="100%" ID="gvCoaches" runat="server" AutoGenerateColumns="false"
                                DataKeyNames="ID">
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                                <Columns>
                                    <asp:BoundField DataField="ID" Visible="False" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="UserName"
                                        HeaderText="User Name" SortExpression="UserName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FirstName"
                                        HeaderText="First Name" SortExpression="FirstName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="LastName"
                                        HeaderText="Last Name" SortExpression="LastName" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Email"
                                        HeaderText="Email" SortExpression="Email" />
                                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="RegionName"
                                        HeaderText="Region" SortExpression="RegionName" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <a href="Detail.aspx?id=<%#Eval("Id")%>">View Detail...</a>
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
                <uc1:pager id="pager" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>