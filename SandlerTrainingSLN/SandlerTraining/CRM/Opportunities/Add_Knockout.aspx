<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add_Knockout.aspx.cs" Inherits="CRMAddOpportunity_Konckout" %>

<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/knockout-2.1.0.js") %>"></script>
    <input id="hdnFrenchiseeID" type="hidden" runat="server" />
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Opportunity :
            </th>
        </tr>
        <tr>
            <td style="width: 280px">
                <div>
                    <table cellspacing="0" cellpadding="3" id="divAddOportunity" style="background-color: White;
                        border-color: #999999; border-width: 1px; border-style: None; height: 50px; width: 300px;
                        border-collapse: collapse;">
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Select Company
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <select data-bind="options: companies,optionsValue:'COMPANIESID', optionsText: 'COMPANYNAME',optionsCaption: ' ', value: company">
                                </select>
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Opportunity Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:opportunityName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Sales Rep Last Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:srLastName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Sales Rep First Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:srLastName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Sales Rep Phone Number
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:srPhoneNo" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Product
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <select data-bind="options: products,  optionsCaption:' ',optionsValue : 'ProductID',optionsText: 'ProductTypeName', value:product">
                                </select>
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Opportunity Status
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <select data-bind="options: opportunityStatuss,  optionsCaption:' ',optionsValue : 'StatusID',optionsText: 'Name', value:opportunityStatus">
                                </select>
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Contact Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <select data-bind="options: contacts, optionsValue:'CONTACTSID', optionsText: 'FIRSTNAME',optionsCaption: ' ', value: contact">
                                </select>
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Contact Phone
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:contactPhone" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Contact Email
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:contactEmail" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Opportunity Value
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:opportunityValue" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Win Probability %
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:winProbability" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Weighted Value
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:weightedValue" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Close Date
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="value:closeDate" type="text" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">

        function OpportunityVM() {

            var href = window.location.href.split('/');
            var baseUrl = href[0] + '//' + href[2] + '/' + href[3];

            var self = this;
            self.loaded = ko.observable(false);
            self.frenchiseeId = ko.observable($('#<%=hdnFrenchiseeID.ClientID%>').val());

            self.companies = ko.observableArray([]);
            self.company = ko.observable(); // Nothing selected by default

            self.contacts = ko.observableArray([]);
            self.contact = ko.observable(); // Nothing selected by default

            self.opportunityID = ko.observable('');
            self.opportunityName = ko.observable('test');

            self.srFirstName = ko.observable('');
            self.srLastName = ko.observable('');
            self.srPhoneNo = ko.observable('');

            self.products = ko.observableArray([]);
            self.product = ko.observable(); // Nothing selected by default

            self.opportunityStatuss = ko.observableArray([]);
            self.opportunityStatus = ko.observable(); // Nothing selected by default

            self.contactPhone = ko.observable('');
            self.contactEmail = ko.observable('');
            self.opportunityValue = ko.observable('');
            self.winProbability = ko.observable('');
            self.weightedValue = ko.observable('');
            self.closeDate = ko.observable('');

            self.company.subscribe(function (companyId) {
                if (companyId != '') {
                    $.ajax({
                        url: baseUrl + "/api/Contacts/",
                        type: 'GET',
                        contentType: 'application/json',
                        data: { companyId: companyId },
                        success: function (data) {
                            //log(data);
                            $.each(data.$values, function (i, item) {
                                //log(item);
                                self.contacts.push(item);
                            });
                        },
                        error: function (xhr, status, somthing) {
                            log(status);
                        }
                    });
                }
            } .bind(this));

            self.contact.subscribe(function (contactId) {
                if (contactId != '') {
                    //alert(contactId);
                    $.ajax({
                        url: baseUrl + "/api/Contacts/Details/",
                        type: 'GET',
                        contentType: 'application/json',
                        data: { id: contactId },
                        success: function (data) {
                            self.contactPhone(data.PHONE);
                            self.contactEmail(data.EMAIL);
                        },
                        error: function (xhr, status, somthing) {
                            log(status);
                        }
                    });
                }
            } .bind(this));

            $.ajax({
                url: baseUrl + "/api/Companies/",
                type: 'GET',
                contentType: 'application/json',
                data: { frenchiseeId: self.frenchiseeId() },
                success: function (data) {
                    $.each(data.$values, function (i, item) {
                        //log(item);
                        self.companies.push(item);
                    });
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });


            $.ajax({
                url: baseUrl + "/api/Products/",
                type: 'GET',
                contentType: 'application/json',
                // data: { frenchiseeId: self.frenchiseeId() },
                success: function (data) {
                    $.each(data.$values, function (i, item) {
                        //log(item);
                        self.products.push(item);
                    });
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });

            $.ajax({
                url: baseUrl + "/api/OpportunityStatus/",
                type: 'GET',
                contentType: 'application/json',
                //data: { frenchiseeId: self.frenchiseeId() },
                success: function (data) {
                    $.each(data.$values, function (i, item) {
                        //log(item);
                        self.opportunityStatuss.push(item);
                    });
                },
                error: function (xhr, status, somthing) {
                    log(status);
                }
            });
        }
        $(document).ready(function () {
            ko.applyBindings(new OpportunityVM());


        });
    </script>
</asp:Content>
