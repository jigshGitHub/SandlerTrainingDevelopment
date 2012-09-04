<%@ Page Title="My Account - Coach Detail" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Detail.aspx.cs" Inherits="Account_Coach_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnCorporateUserID" type="hidden" runat="server" />
    <input id="hdnCoachId" type="hidden" runat="server" />
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                View Coach :
            </th>
        </tr>
        <tr>
            <td style="width: 50%">
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td width="20%">
                            First Name
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text:firstName" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            Last Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:lastName" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Address
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:address" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            City
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:city" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            State
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:state" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Zip
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:zip" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            Email
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:email" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Region
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:region" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            User Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:userName, enable:userNameEnabled" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td colspan="3">
                            <a id="anchorEdit" runat="server" style="color: Blue; font-weight: bold;">Edit</a>
                            &nbsp;&nbsp; <a href="Index.aspx" style="font-weight: bold">Delete</a>&nbsp;&nbsp;
                            <a href="Index.aspx" style="font-weight: bold">Back</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function CoachVM() {

            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];

            var self = this;
            self.userNameEnabled = ko.observable(false);
            self.createdBy = ko.observable($('#<%=hdnCorporateUserID.ClientID%>').val());
            self.id = ko.observable($('#<%=hdnCoachId.ClientID%>').val());
            self.firstName = ko.observable('');
            self.lastName = ko.observable('');
            self.phoneNumber = ko.observable('');
            self.address = ko.observable('');
            self.city = ko.observable('');
            self.state = ko.observable('');
            self.zip = ko.observable('');
            self.userName = ko.observable();
            self.region = ko.observable(); // Nothing selected by default
            self.email = ko.observable('');

            $.ajax({
                url: baseUrl + "/api/Coach/",
                type: 'GET',
                contentType: 'application/json',
                data: { id: self.id },
                success: function (data) {
                    log(data);
                    self.firstName(data.FirstName);
                    self.lastName(data.LastName);
                    self.phoneNumber(data.PhoneNumber);
                    self.address(data.ADDRESS);
                    self.city(data.City);
                    self.state(data.State);
                    self.zip(data.Zip);
                    self.userName(data.UserName);
                    self.region(data.RegionName);
                    self.email(data.Email);
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });
        }
        $(document).ready(function () {
            ko.applyBindings(new CoachVM());


        });
    </script>
</asp:Content>
