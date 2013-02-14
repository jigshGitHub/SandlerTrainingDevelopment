<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="Account_FranchiseeUser_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnFranchiseeId" type="hidden" runat="server" />
    <input id="hdnFranchiseeOwnerUserId" type="hidden" runat="server" />
    <table border="0">
        <tr>
            <th class="tdTC" align="left">
                Create Franchisee User:
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
                        <td width="70%">
                            <input id="txtFirstName" data-bind="value:firstName" type="text" style="width: 100%" />
                        </td>
                        <td width="9%">
                            <span data-bind="text:firstNameRequired, visible:firstNameRequiredHasError"></span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td width="20%">
                            Last Name
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="70%">
                            <input data-bind="value:lastName" type="text" style="width: 100%" />
                        </td>
                        <td width="9%">
                            <span data-bind="text:lastNameRequired, visible:lastNameRequiredHasError"></span>
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
                            <input data-bind="value:address" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
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
                            <input data-bind="value:city" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
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
                            <input data-bind="value:state" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" data-bind="visible:isEditMode() == false">
                        <td>
                            Country
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <select data-bind="options:countries,optionsValue:'ID', optionsText: 'Name',optionsCaption: ' ', value: country">
                            </select>
                        </td>
                        <td>
                            &nbsp;
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
                            <input data-bind="value:zip" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            Contact Number
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:contactNumber" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Email
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:email" type="text" style="width: 100%" />
                        </td>
                        <td>
                            <span data-bind="text:emailRequired, visible:emailRequiredHasError"></span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td colspan="4">
                            <a href="#" style="color: Blue; font-weight: bold;" data-bind="click:save">Add</a>
                            &nbsp;&nbsp;<a href="Index.aspx" style="font-weight: bold">Cancel</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div id="resultSummary" style="color: Red">
                    <ul>
                    </ul>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <script type="text/javascript">

        function FranchiseeVM() {

            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];
            var self = this;
            self.franchiseeId = ko.observable($('#<%=hdnFranchiseeId.ClientID%>').val());
            self.isEditMode = ko.observable(false);
            self.userNameEnabled = ko.observable(false);
            self.userId = ko.observable('');
            self.firstName = ko.observable('');
            self.firstNameRequired = ko.observable('*');
            self.firstNameRequiredMsg = ko.observable('');
            self.firstNameRequiredHasError = ko.observable(false);
            self.lastName = ko.observable('');
            self.lastNameRequired = ko.observable('*');
            self.lastNameRequiredMsg = ko.observable('');
            self.lastNameRequiredHasError = ko.observable(false);
            self.contactNumber = ko.observable('');
            self.address = ko.observable('');
            self.city = ko.observable('');
            self.state = ko.observable('');
            self.zip = ko.observable('');
            self.countries = ko.observableArray([]);
            self.country = ko.observable();
            self.userName = ko.observable();
            self.isEmailSubscription = ko.observable('');
            self.email = ko.observable('');
            self.emailRequired = ko.observable('*');
            self.emailRequiredMsg = ko.observable('');
            self.emailRequiredHasError = ko.observable(false);
            self.emailSubscription = ko.observable(true);
            self.validationErrors = ko.observableArray([]);

            $.ajax({
                url: baseUrl + "/api/Countries/",
                type: 'GET',
                contentType: 'application/json',
                data: {},
                success: function (data) {
                    $.each(data.$values, function (i, item) {
                        self.countries.push(item);
                    });
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });

            self.save = function () {
                self.validationErrors([]);
                self.firstNameRequiredHasError(false);
                self.lastNameRequiredHasError(false);
                self.emailRequiredHasError(false);

                $('#resultSummary ul').empty();

                if (self.firstName() == '' || self.firstName() == undefined) {
                    self.firstNameRequiredHasError(true);
                    self.firstNameRequiredMsg('First Name is required');
                    self.validationErrors.push(self.firstNameRequiredMsg());
                }
                if (self.lastName() == '' || self.lastName() == undefined) {
                    self.lastNameRequiredHasError(true);
                    self.lastNameRequiredMsg('Last Name is required');
                    self.validationErrors.push(self.lastNameRequiredMsg());
                }
                if (self.email() == '' || self.email() == undefined) {
                    self.emailRequiredHasError(true);
                    self.emailRequiredMsg(' Email is required');
                    self.validationErrors.push(self.emailRequiredMsg());
                }


                if (self.validationErrors() == '') {
                    var json = JSON.stringify({
                        FranchiseeID: self.franchiseeId(),
                        FirstName: self.firstName(),
                        LastName: self.lastName(),
                        ContactNumber: self.contactNumber(),
                        ADDRESS: self.address(),
                        City: self.city(),
                        State: self.state(),
                        Zip: self.zip(),
                        CountryID: self.country(),
                        Email: self.email(),
                        UserID: self.userId()
                    });

                    $.ajax({
                        url: baseUrl + "/api/FranchiseeUser/",
                        type: "POST",
                        data: json,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            $('#resultSummary ul').append('<li>Franchisee with userid ' + response.UserName + ' has been created.</li>');
                        },
                        error: function (response, errorText) {
                        }
                    });
                }
                else {
                    $.each(self.validationErrors(), function (i, item) {
                        //log(item);
                        $('#resultSummary ul').append('<li>' + item + '</li>');
                    });

                }

            };
        }
        $(document).ready(function () {
            var franchiseeVM = new FranchiseeVM();
            ko.applyBindings(franchiseeVM);
        });
    </script>
</asp:Content>
