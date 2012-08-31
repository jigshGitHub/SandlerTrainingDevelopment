<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Upload.aspx.cs" Inherits="CRM_Companies_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="dialog" title="Dialog Title">
        <asp:FileUpload ID="fileToUpload" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            //            $('#uploadCompanyData').click(function () {
            //                $('#dialog').dialog('open');
            //                return false;
            //            });
            

//            $('#dialog').dialog('open');
//            return false;
            $('#dialog').dialog({
                
                autoOpen: true,
                width: 600
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
        });
    </script>
</asp:Content>
