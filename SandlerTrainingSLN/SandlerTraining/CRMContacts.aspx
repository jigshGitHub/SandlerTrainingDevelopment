<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="CRMContacts.aspx.cs" Inherits="CRMContacts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <td>
                Select Company Name:
                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" AutoPostBack="True"
                    DataTextField="Company_Name" DataValueField="ID" OnDataBound="ddlCompany_DataBound">
                </asp:DropDownList>
            </td>
            <td align="right">
                <asp:LinkButton ID="btnAddContact" runat="server" Font-Size="Large" OnClick="btnAddContact_Click"
                    ForeColor="blue">Add New Contact</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvContacts" runat="server" DataSourceID="ContactDS"
                    AutoGenerateColumns="False" DataKeyNames="Contact_ID" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvContacts_SelectedIndexChanged" OnDataBound="gvContacts_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Contact_ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Full_Name" HeaderText="Name"  HeaderStyle-ForeColor="Blue"
                            SortExpression="Full_Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Phone" HeaderText="Phone"  HeaderStyle-ForeColor="Blue"
                            SortExpression="Phone" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Email" HeaderText="E-mail"  HeaderStyle-ForeColor="Blue"
                            SortExpression="Email" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Company_Name" HeaderText="Company"  HeaderStyle-ForeColor="Blue"
                            SortExpression="Company_Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Total_ACT_Value" HeaderText="Total Account Value"  HeaderStyle-ForeColor="Blue"
                            SortExpression="Total_ACT_Value" DataFormatString="{0:C}" />
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle ForeColor="Maroon" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="View Detail.."></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ContactDS" runat="server" TypeName="ContactsDAL" SelectMethod="GetAllContacts">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompany" Name="ID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidContactID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
