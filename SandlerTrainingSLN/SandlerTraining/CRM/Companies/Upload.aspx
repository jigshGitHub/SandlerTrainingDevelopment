<%@ Page Title="CRM - Upload Company" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="CRM_Companies_Upload" %>

<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="dialog" title="Upload Company:">
        <asp:Panel ID="pnlFileUpload" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:FileUpload ID="fileToUpload" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblFileToUpload" ForeColor="Red" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
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
            //alert($('#<%=showHideDialogFlag.ClientID %>').val());
            if ($('#<%=showHideDialogFlag.ClientID %>').val() == 1) {
                //            $('#uploadCompanyData').click(function () {
                //                $('#dialog').dialog('open');
                //                return false;
                //            });


                //            $('#dialog').dialog('open');
                //            return false;
                $('#dialog').dialog({

                    autoOpen: true,
                    width: 400
                    /*,
                    buttons: {
                    "Ok": function () {
                    $(this).dialog("close");
                    },
                    "Cancel": function () {
                    $(this).dialog("close");
                    }
                    }*/
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
                <asp:GridView Width="100%" ID="gvCompanies" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="COMPANYNAME"
                            HeaderText="Company Name" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Address"
                            HeaderText="Address" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCLastName"
                            HeaderText="POC-LastName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCFirstName"
                            HeaderText="POC-FirstName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="POCPhone"
                            HeaderText="POC-Phone" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CreationDate"
                            HeaderText="Creation Date" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Errormessage"
                            HeaderText="Message" />
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
