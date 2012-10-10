<%@ Page Title="My Account - Franchisee Detail" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Account_FranchiseeUser_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnFranchiseeId" type="hidden" runat="server" />
    <input id="hdnFranchiseeUserUserId" type="hidden" runat="server" />
    <input id="hdnFranchiseeOwnerUserId" type="hidden" runat="server" />
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                View Franchisee User :
            </th>
        </tr>
        <tr>
            <td style="width: 50%">
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            First Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:firstName" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
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
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
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
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
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
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
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
                            User Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <span data-bind="text:userName, enable:userNameEnabled" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td colspan="3">
                            <a id="anchorEdit" runat="server" style="color: Blue; font-weight: bold;">Edit</a>
                            &nbsp;&nbsp; <a href="" data-bind="click:_delete" style="font-weight: bold">Delete</a>&nbsp;&nbsp;
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

        function FranchiseeUserVM() {

            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];

            var self = this;
            self.userNameEnabled = ko.observable(false);
            self.franchiseeId = ko.observable($('#<%=hdnFranchiseeId.ClientID%>').val());
            self.userId = ko.observable($('#<%=hdnFranchiseeUserUserId.ClientID%>').val());
            self.firstName = ko.observable('');
            self.lastName = ko.observable('');
            self.contactNumber = ko.observable('');
            self.address = ko.observable('');
            self.city = ko.observable('');
            self.state = ko.observable('');
            self.zip = ko.observable('');
            self.country = ko.observable();
            self.userName = ko.observable();
            self.isEmailSubscription = ko.observable('');
            self.email = ko.observable('');

            $.ajax({
                url: baseUrl + "/api/FranchiseeUser/",
                type: 'GET',
                contentType: 'application/json',
                data: { id: self.franchiseeId, userId: self.userId },
                success: function (data) {
                    log(data);
                    self.firstName(data.FirstName);
                    self.lastName(data.LastName);
                    self.contactNumber(data.ContactNumber);
                    self.address(data.ADDRESS);
                    self.city(data.City);
                    self.state(data.State)
                    self.zip(data.Zip);
                    self.userName(data.UserName);
                    self.isEmailSubscription(data.IsEmailSubscription);
                    self.country(data.CountryID);
                    self.email(data.Email);
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });

            self._delete = function () {
                if (confirm('Are you sure to delete this user?')) {
                    var json = JSON.stringify({
                        FranchiseeID: self.franchiseeId(),
                        UserID: self.userId()
                    });
                    $.ajax({
                        url: baseUrl + "/api/FranchiseeUser",
                        type: "DELETE",
                        data: json,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {

                        },
                        statusCode: {
                            200: function () {
                                alert('Selected user has been deleted');
                                window.open('Index.aspx', '_self')
                            },
                            400: function () {
                                alert('400 status code! user error');
                            },
                            500: function () {
                                alert('500 status code! server error');
                            }
                        }
                    });
                }
                else {
                    return false;
                }
            };
        }
        $(document).ready(function () {
            ko.applyBindings(new FranchiseeUserVM());


        });
    </script>
</asp:Content>
