<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AppointmentSource.ascx.cs"
    Inherits="SiteAdmin_AppointmentSource" %>
<%@ Register Src="../ColorCode.ascx" TagName="ColorCode" TagPrefix="uc1" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#tabs").tabs();
        //        $('#<%=ColorCode1.FindControl("drpLstColorCodes").ClientID  %>').change(function () {
        //            
        //        }).change();

        $('#btnAdd').click(function () {
            var clorCode = $('#<%=ColorCode1.FindControl("drpLstColorCodes").ClientID  %> option:selected').val();
            var appSource = $('#txtSourceName').val();
            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
            var json = JSON.stringify({
                SourceName: appSource,
                ColorCode: clorCode
            });
            $.ajax({
                url: baseUrl + "/api/AppointmentSource/",
                type: "POST",
                data: json,
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    alert('Data added');
                },
                error: function (response, errorText) {
                }
            });

        });
    });
</script>
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Index</a></li>
        <li><a href="#tabs-2">Add</a></li>
    </ul>
    <div id="tabs-1">
        <p>
        </p>
    </div>
    <div id="tabs-2">
        <p>
            <input type="hidden" id="userId" runat="server" />
            <table cellspacing="0" cellpadding="3" style="background-color: White; border-color: #999999;
                border-width: 1px; border-style: None; height: 50px; width: 300px; border-collapse: collapse;">
                <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                    <td style="white-space: nowrap;">
                        Source Name :
                    </td>
                    <td>
                        <input id="txtSourceName" type="text" style="width: 100%" />
                    </td>
                </tr>
                <tr style="color: Black; background-color: Gainsboro; white-space: nowrap;">
                    <td>
                        Color Code
                    </td>
                    <td>
                        <uc1:ColorCode ID="ColorCode1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" id="btnAdd" value="Add" />
                    </td>
                </tr>
            </table>
        </p>
    </div>
</div>
