<%@ Page Title="CRM - Add Product" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="CRM_Product_Add" %>

<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Product :
            </th>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:DetailsView ID="dvProduct" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                    DataSourceID="ProductDataSource" DefaultMode="Insert" CellPadding="3" BorderStyle="None"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                    OnItemInserted="dvProduct_ItemInserted" OnModeChanging="dvProduct_ModeChanging"
                    OnItemCreated="dvProduct_ItemCreated">
                    <Fields>
                        <asp:TemplateField HeaderText="Product Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtProdName" MaxLength="150" Width="380" runat="server" Text='<%# Bind("ProductTypeName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvProdTypeName" ControlToValidate="txtProdName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Product Type Name to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Color Code:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="drpLstColorCodes" runat="server" OnDataBound="drpLstColorCodesDataBound"
                                    SelectedValue='<%# Bind("ColorCode") %>'>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvColorCode" ControlToValidate="drpLstColorCodes"
                                    Display="Static" InitialValue="0" runat="server" ErrorMessage="Please select Color Code to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Add" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Back To Companies" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FieldHeaderStyle Wrap="False" />
                    <HeaderStyle Wrap="False" BackColor="DarkRed" Font-Bold="True" ForeColor="White" />
                    <InsertRowStyle Wrap="False" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                    ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="ProductDataSource" runat="server" InsertMethod="AddProduct"
                    TypeName="SandlerRepositories.CompaniesRepository">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="dvProduct" Name="ProductTypeName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvProduct" Name="ColorCode" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
