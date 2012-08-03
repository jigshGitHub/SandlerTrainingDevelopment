<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add_Knockout.aspx.cs" Inherits="CRMAddOpportunity_Konckout" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
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
                            <td style="white-space: nowrap;">
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
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;">
                                Opportunity ID
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:opportunityID" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;">
                                Opportunity Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:opportunityName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;">
                                Sales Represntative
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Last Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:srLastName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                First Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:srFirstName" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Phone Number
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:srPhoneNo" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;">
                                Select Contact
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Name
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <select data-bind="options: contacts,  optionsCaption:' ',optionsValue : 'CONTACTSID',optionsText: 'FIRSTNAME', value:contact">
                                </select>
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Phone
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:contactPhone" type="text" />
                            </td>
                        </tr>
                        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                            <td style="white-space: nowrap;" align="right">
                                Email
                            </td>
                            <td>
                                &nbsp;:&nbsp;
                            </td>
                            <td>
                                <input data-bind="text:contactEmail" type="text" />
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
                                <select data-bind="options: opportunityStatusList,  optionsCaption:' ',optionsValue : 'StatusID',optionsText: 'StatusName', value:opportunityStatus">
                                </select>
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
                                
        self.company.subscribe(function (companyId) {
            //alert(companyId);
            self.contact(undefined);
            self.contacts(undefined);

            if (companyId != '') {
                $.ajax({
                    url: baseUrl + "/api/Contacts/",
                    type: 'GET',
                    data: { companyId: companyId },
                    success: function (data) {
                        self.contacts(data);
                        log(self.contacts());
                    }
                });
            }
        }.bind(this));


        self.opportunityID = ko.observable('');
        self.opportunityName = ko.observable('');

        self.srFirstName = ko.observable('');
        self.srLastName = ko.observable('');
        self.srPhoneNo = ko.observable('');

        self.contacts = ko.observableArray([]);
        self.contact = ko.observable(); // Nothing selected by default
                    
        self.contactPhone = ko.observable('');
        self.contactEmail = ko.observable('');

        $.ajax({
            url: baseUrl + "/api/Companies/",
            type: 'GET',
            data: { franchiseeId: self.frenchiseeId() },
            success: function (data) {
                self.companies(data);
                log(self.companies());
            }
        });

        self.opportunityStatusList = ko.observableArray([]);
        self.opportunityStatus = ko.observable();
       
        $.ajax({
            url: baseUrl + "/api/OpportunityStatus/",
            type: 'GET',
            success: function (data) {
                self.opportunityStatusList(data);
                log(self.opportunityStatusList());
            }
        });
    }
    $(document).ready(function () {
        ko.applyBindings(new OpportunityVM());


    });
    </script>
</asp:Content>
