<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="Account_FranchiseeOwner_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnCoachUserid" type="hidden" runat="server" />
    <input id="hdnCoachId" type="hidden" runat="server" />
    <table border="0">
        <tr>
            <th class="tdTC" align="left">
                Create Franchisee :
            </th>
        </tr>
        <tr>
            <td style="width: 50%">
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td width="20%">
                            Name
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="70%">
                            <input data-bind="value:franchiseeName" type="text" style="width: 100%" />
                        </td>
                        <td width="9%">
                            <span data-bind="text:franchiseeNameRequired, visible:franchiseeNameRequiredHasError">
                            </span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            Address1
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:address1" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Address2
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:address2" type="text" style="width: 100%" />
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
                            Phone Number
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:phoneNumber" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;</span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td>
                            Fax Number
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:faxNumber" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;</span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td>
                            WebAddress
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="value:webAddress" type="text" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;</span>
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
                            &nbsp;
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <th class="tdTC" style="float: left">
                            Owner data:
                        </th>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
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
                            <input data-bind="value:ownerCity" type="text" style="width: 100%" />
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
                            <input data-bind="value:ownerState" type="text" style="width: 100%" />
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
                            <select data-bind="options:countries,optionsValue:'ID', optionsText: 'Name',optionsCaption: ' ', value: ownerCountry">
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
                            <input data-bind="value:ownerZip" type="text" style="width: 100%" />
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
                            <input data-bind="value:ownerEmail" type="text" style="width: 100%" />
                        </td>
                        <td>
                            <span data-bind="text:ownerEmailRequired, visible:ownerEmailRequiredHasError"></span>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" data-bind="visible:isEditMode">
                        <td>
                            Email subscription
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <input data-bind="checked:emailSubscription" type="checkbox" style="width: 100%" />
                        </td>
                        <td>
                            &nbsp;
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
            log($('#<%=hdnCoachUserid.ClientID%>').val());
            var self = this;
            self.coachId = ko.observable($('#<%=hdnCoachId.ClientID%>').val());
            self.isEditMode = ko.observable(false);
            self.userNameEnabled = ko.observable(false);
            self.createdBy = ko.observable($('#<%=hdnCoachUserid.ClientID%>').val());
            self.franchiseeName = ko.observable('');
            self.franchiseeNameRequired = ko.observable('*');
            self.franchiseeNameRequiredMsg = ko.observable('');
            self.franchiseeNameRequiredHasError = ko.observable(false);
            self.address1 = ko.observable('');
            self.address2 = ko.observable('');
            self.city = ko.observable('');
            self.state = ko.observable('');
            self.zip = ko.observable('');
            self.countries = ko.observableArray([]);
            self.country = ko.observable();
            self.phoneNumber = ko.observable('');
            self.faxNumber = ko.observable('');
            self.webAddress = ko.observable('');
            self.email = ko.observable('');

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
            self.ownerCity = ko.observable('');
            self.ownerState = ko.observable('');
            self.ownerZip = ko.observable('');
            self.ownerCountry = ko.observable();
            self.userName = ko.observable();
            self.ownerIsEmailSubscription = ko.observable('');
            self.ownerEmail = ko.observable('');
            self.ownerEmailRequired = ko.observable('*');
            self.ownerEmailRequiredMsg = ko.observable('');
            self.ownerEmailRequiredHasError = ko.observable(false);
            self.emailSubscription = ko.observable(true);
            self.validationErrors = ko.observableArray([]);

            $.ajax({
                url: baseUrl + "/api/Countries/",
                type: 'GET',
                contentType: 'application/json',
                data: {},
                success: function (data) {
                    //log(data);
                    $.each(data.$values, function (i, item) {
                        // log(item);
                        self.countries.push(item);
                    });
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });

            self.save = function () {
                self.validationErrors([]);
                self.franchiseeNameRequiredHasError(false);
                self.ownerEmailRequiredHasError(false);

                $('#resultSummary ul').empty();

                if (self.franchiseeName() == '' || self.franchiseeName() == undefined) {
                    self.franchiseeNameRequiredHasError(true);
                    self.franchiseeNameRequiredMsg('Franchisee Name is required');
                    self.validationErrors.push(self.franchiseeNameRequiredMsg());
                }
                
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
                if (self.ownerEmail() == '' || self.ownerEmail() == undefined) {
                    self.ownerEmailRequiredHasError(true);
                    self.ownerEmailRequiredMsg('Owner Email is required');
                    self.validationErrors.push(self.ownerEmailRequiredMsg());
                }

                if (self.validationErrors() == '') {
                    var json = JSON.stringify({
                        Name: self.franchiseeName(),
                        CoachID: self.coachId(),
                        Address1: self.address1(),
                        Address2: self.address2(),
                        City: self.city(),
                        State: self.state(),
                        Zip: self.zip(),
                        CountryID: self.country(),
                        PhoneNumber: self.phoneNumber(),
                        FaxNumber: self.faxNumber(),
                        WebAddress: self.webAddress(),
                        Email: self.email(),
                        CreatedByCoachID: self.createdBy(),
                        FranchiseeUser: {
                            FirstName: self.firstName(),
                            LastName: self.lastName(),
                            ContactNumber: self.contactNumber(),
                            ADDRESS: self.address(),
                            City: self.ownerCity(),
                            State: self.ownerState(),
                            Zip: self.ownerZip(),
                            CountryID: self.ownerCountry(),
                            Email: self.ownerEmail()
                        }

                    });

                    $.ajax({
                        url: baseUrl + "/api/Franchisee/",
                        type: "POST",
                        data: json,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            log(response.UserName);
                            $('#resultSummary ul').append('<li>Franchisee with username ' + response.FranchiseeUser.UserName + ' has been created.</li>');
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

            $('#txtFirstName').focus(function () {
                franchiseeVM.address(franchiseeVM.address1() + ' ' + franchiseeVM.address2());
                franchiseeVM.ownerCity(franchiseeVM.city());
                franchiseeVM.ownerState(franchiseeVM.state());
                franchiseeVM.ownerCountry(franchiseeVM.country());
                franchiseeVM.ownerZip(franchiseeVM.zip());
                franchiseeVM.contactNumber(franchiseeVM.phoneNumber());
                franchiseeVM.faxNumber(franchiseeVM.faxNumber());
                franchiseeVM.ownerEmail(franchiseeVM.email());
            });

        });
    </script>
</asp:Content>
