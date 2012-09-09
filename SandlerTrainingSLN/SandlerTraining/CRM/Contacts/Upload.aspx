<%@ Page Title="CRM - Upload Contact" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="CRM_Contacts_Upload"
    EnableEventValidation="true" %>

<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnFrenchiseeID" type="hidden" runat="server" />
    <div id="dialog" title="Upload Contacts:">
        <asp:Panel ID="pnlFileUpload" runat="server">
            <table style="background-color: White; border-color: #999999; border-width: 1px;
                border-style: solid; border-collapse: collapse;">
                <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                    <td>
                        <asp:DropDownList ID="companyList" runat="server">
                        </asp:DropDownList>
                        <asp:Label ID="lblCompanyListRequired" ForeColor="Red" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                    <td>
                        <asp:FileUpload ID="fileToUpload" runat="server" />
                    </td>
                </tr>
                <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                    <td>
                        <asp:Label ID="lblFileToUpload" ForeColor="Red" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                    <td>
                        <asp:Button ID="btnUpload" runat="server" CssClass="sandlerButton" Text="Upload"
                            OnClick="btnUpload_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('#<%=showHideDialogFlag.ClientID %>').val() == 1) {

                $('#dialog').dialog({

                    autoOpen: true,
                    width: 500

                });

                $('#dialog').parent().appendTo($("form:first"));
            }
            else {
                $('#dialog').dialog('close')
            }
        });
    </script>
    <asp:HiddenField runat="server" ID="showHideDialogFlag" Value="1" />
    <table id="tblMain" width="100%">
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="100%">
                <asp:GridView Width="100%" ID="gvCompanies" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="FIRSTNAME"
                            HeaderText="First Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="LASTNAME"
                            HeaderText="Last Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="PHONE"
                            HeaderText="Phone Number" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="EMail"
                            HeaderText="Email" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Errormessage"
                            HeaderText="Message" />
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
