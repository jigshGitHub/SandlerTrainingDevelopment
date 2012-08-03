<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="ContactIndex" %>

<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblCompMain" width="100%">
        <tr>
            <td>
                Select Company Name:
                <asp:DropDownList ID="ddlCompanies" runat="server" DataSourceID="CompaniesDS" AutoPostBack="True"
                    DataTextField="COMPANYNAME" DataValueField="COMPANIESID" OnDataBound="ddlCompanies_DataBound">
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
                    AutoGenerateColumns="False" DataKeyNames="contactsid" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvContacts_SelectedIndexChanged" OnDataBound="gvContacts_DataBound">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="contactsid" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="FullName" HeaderText="Name"
                            HeaderStyle-ForeColor="Blue" SortExpression="FullName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Phone" HeaderText="Phone"
                            HeaderStyle-ForeColor="Blue" SortExpression="Phone" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="Email" HeaderText="E-mail"
                            HeaderStyle-ForeColor="Blue" SortExpression="Email" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" DataField="COMPANYNAME" HeaderText="Company"
                            HeaderStyle-ForeColor="Blue" SortExpression="COMPANYNAME" />
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle ForeColor="Maroon" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="View Detail.."></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
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
                <asp:ObjectDataSource ID="ContactDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetAll">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompanies" Name="COMPANIESID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="CompaniesDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                <asp:HiddenField ID="hidContactID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
