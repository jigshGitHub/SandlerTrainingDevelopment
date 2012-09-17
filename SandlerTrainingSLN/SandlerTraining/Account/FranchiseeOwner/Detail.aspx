<%@ Page Title="My Account - Franchisee Detail" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Account_FranchiseeOwner_Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <input id="hdnFranchiseeId" type="hidden" runat="server" />
    <input id="hdnCoachId" type="hidden" runat="server" />
    <input id="hdnFranchiseeOwnerUserId" type="hidden" runat="server" />
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                View Franchisee :
            </th>
        </tr>
        <tr>
            <td style="width: 50%">
                <table style="background-color: White; border-color: #999999; border-width: 1px;
                    border-style: solid; height: 50px; width: 100%; border-collapse: collapse;">
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td width="20%">
                            Franchisee Name
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text: franchiseeName" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC;">
                        <td width="20%">
                            Address
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text: address1" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE;">
                        <td width="20%">
                            &nbsp;
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="79%">
                            <span data-bind="text: address2" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC;">
                        <td width="20%">
                            &nbsp;
                        </td>
                        <td width="1%">
                        </td>
                        <td width="79%">
                            <span data-bind="text: city" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE;">
                        <td width="20%">
                            &nbsp;
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="79%">
                            <span data-bind="text: state" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC;">
                        <td width="20%">
                            &nbsp;
                        </td>
                        <td width="1%">
                            &nbsp;
                        </td>
                        <td width="79%">
                            <span data-bind="text: zip" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td width="20%">
                            Phone Number
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text: phoneNumber" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td width="20%">
                            Fax Number
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text: faxNumber" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td width="20%">
                            Web address
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text:webAddress" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td width="20%">
                            Email
                        </td>
                        <td width="1%">
                            :
                        </td>
                        <td width="79%">
                            <span data-bind="text:email" type="text" style="width: 100%" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <th class="tdTC" style="float: left">
                            Owner data:
                        </th>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
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
                            <span data-bind="text:ownerCity" type="text" style="width: 100%" />
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
                            <span data-bind="text:ownerState" type="text" style="width: 100%" />
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
                            <span data-bind="text:ownerZip" type="text" style="width: 100%" />
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
                            <span data-bind="text:ownerEmail" type="text" style="width: 100%" />
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
            self.franchiseeName = ko.observable();
            self.address1 = ko.observable('');
            self.address2 = ko.observable('');
            self.city = ko.observable('');
            self.state = ko.observable('');
            self.zip = ko.observable('');
            self.phoneNumber = ko.observable('');
            self.faxNumber = ko.observable('');
            self.webAddress = ko.observable('');
            self.email = ko.observable('');
            self.userNameEnabled = ko.observable(false);
            self.createdBy = ko.observable($('#<%=hdnCoachId.ClientID%>').val());
            self.id = ko.observable($('#<%=hdnFranchiseeId.ClientID%>').val());
            self.userId = ko.observable($('#<%=hdnFranchiseeOwnerUserId.ClientID%>').val());
            self.firstName = ko.observable('');
            self.lastName = ko.observable('');
            self.contactNumber = ko.observable('');
            self.address = ko.observable('');
            self.ownerCity = ko.observable('');
            self.ownerState = ko.observable('');
            self.ownerZip = ko.observable('');
            self.ownerCountry = ko.observable();
            self.userName = ko.observable();
            self.ownerIsEmailSubscription = ko.observable('');
            self.ownerEmail = ko.observable('');

            $.ajax({
                url: baseUrl + "/api/Franchisee/",
                type: 'GET',
                contentType: 'application/json',
                data: { id: self.id, userId: self.userId },
                success: function (data) {
                    log(data);
                    self.franchiseeName(data.Name);
                    self.address1(data.Address1);
                    self.address2(data.Address2);
                    self.city(data.City);
                    self.state(data.State);
                    self.zip(data.Zip);
                    self.phoneNumber(data.PhoneNumber);
                    self.faxNumber(data.FaxNumber);
                    self.webAddress(data.WebAddress);
                    self.email(data.Email);
                    self.userNameEnabled(false);
                    self.createdBy($('#<%=hdnCoachId.ClientID%>').val());
                    self.id($('#<%=hdnFranchiseeId.ClientID%>').val());
                    self.userId($('#<%=hdnFranchiseeOwnerUserId.ClientID%>').val());
                    self.firstName(data.FranchiseeUser.FirstName);
                    self.lastName(data.FranchiseeUser.LastName);
                    self.contactNumber(data.FranchiseeUser.ContactNumber);
                    self.address(data.FranchiseeUser.ADDRESS);
                    self.ownerCity(data.FranchiseeUser.City);
                    self.ownerState(data.FranchiseeUser.State);
                    self.ownerZip(data.FranchiseeUser.Zip);
                    self.userName(data.FranchiseeUser.UserName);
                    self.ownerIsEmailSubscription(data.FranchiseeUser.IsEmailSubscription);
                    self.ownerCountry(data.FranchiseeUser.CountryID);
                    self.ownerEmail(data.FranchiseeUser.Email);
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
