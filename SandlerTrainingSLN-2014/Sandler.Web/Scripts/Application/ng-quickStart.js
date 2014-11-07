var quickStartVM;

function ng_quickStartCtrl($scope, $http) {
    angular.element(document).ready(function () {

        $("#bt_cancel_evt").click(function () {
            initialize_quickStartF('Clear');

        });

        quickStartVM = new quickStartDataVM(observable, scenario);
        ko.applyBindings(quickStartVM, document.getElementById("quickStart_body"));
    });

};

//////////////
///Required Field Extenders
//////////////
ko.extenders.required = function (target, overrideMessage) {
    //add some sub-observables to our observable
    target.hasError = ko.observable();
    target.validationMessage = ko.observable();

    //define a function to do validation
    function validate(newValue) {
        target.hasError(newValue ? false : true);
        target.validationMessage(newValue ? "" : overrideMessage || "*");
    }
    //initial validation
    validate(target());
    //validate whenever the value changes
    target.subscribe(validate);
    //return the original observable
    return target;
};


//////////////
///Initialize Function
//////////////

var quickStartVM;

//This is after Edit is perfomed
function initialize_quickStartF(type) {

    quickStartVM.companyObservable.COMPANYNAME('');
    quickStartVM.companyObservable.POCFirstName('');
    quickStartVM.companyObservable.POCLastName('');
    quickStartVM.companyObservable.POCPhone('');
    quickStartVM.companyObservable.POCEmail('');
    quickStartVM.companyObservable.IsNewCompany('');
    quickStartVM.companyObservable.IndustryId('');

    quickStartVM.contactObservable.ACTIONSTEP('');
    quickStartVM.contactObservable.IsNewAppointment('');
    quickStartVM.contactObservable.ApptSourceId('');
    quickStartVM.contactObservable.IsRegisteredForTraining('');
    quickStartVM.contactObservable.CourseId('');
    quickStartVM.contactObservable.CourseTrainingDatec('');
    quickStartVM.contactObservable.TrainingCourseName('');
    quickStartVM.contactObservable.HowManyAttended('');
    quickStartVM.contactObservable.NextContactDatec('');

    quickStartVM.opportunity.NAME('');
    quickStartVM.opportunity.Pain('');
    quickStartVM.opportunity.LengthOfProblem('');
    quickStartVM.opportunity.Alternatives('');
    quickStartVM.opportunity.CostToFix('');
    quickStartVM.opportunity.IsBudgeIdentified('');
    quickStartVM.opportunity.IsMoveForward('');
    quickStartVM.opportunity.ProductID('');
    quickStartVM.opportunity.STATUSID('');
    quickStartVM.opportunity.SourceID('');
    quickStartVM.opportunity.TypeID('');
    quickStartVM.opportunity.VALUE('');
    quickStartVM.opportunity.IsActive(false);
    quickStartVM.opportunity.Notes('');
    quickStartVM.opportunity.OppCloseDatec('');
    quickStartVM.opportunity.CONTACTID();
    quickStartVM.opportunity.SALESREPFIRSTNAME('');
    quickStartVM.opportunity.SALESREPLASTNAME('');
    quickStartVM.opportunity.WINPROBABILITY('');
    quickStartVM.opportunity.salesRepId('');

    quickStartVM.opportunityModeSelectionId('');
    quickStartVM.selectOppsVisible(false);
    quickStartVM.POCs([]);
    quickStartVM.selectedPOC('');
    quickStartVM.selectedCompanyId('');
    quickStartVM.selectedOpportunity();
    quickStartVM.opportunities([]);
    quickStartVM.Notes('');

    quickStartVM.initialCountOfCompanyOpportunties = 0;
    quickStartVM.dirtyFlag.reset();

    if (type != 'Clear') {
        quickStartVM.IsSaved(true);
    }
    else {
        quickStartVM.IsSaved(false);
    }
}
var startModule = sandler.appStart.module;
var modalOptions;
//First time display the data
function quickStartDataVM(opportunityObservable, scenario) {
    var self = this;
    self.scenario = scenario;
    self.products = startModule.getProductTypes();
    self.whyLosts = startModule.getOpportunityWhyLosts();
    self.oppStatus = startModule.getOpportunityStatus();
    self.oppSources = startModule.getOpportunitySources();
    self.oppTypes = startModule.getOpportunityTypes();
    self.industries = startModule.getIndustryTypes();
    self.appSources = startModule.getAppointmentSources();
    self.yesNoData = startModule.getYesNoOptions();
    self.courseTypes = startModule.getCourses();
    self.companies = ko.observableArray([]);//startModule.getUserCompanies();
    self.companyObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Company/Get?id=0", null));
    self.contactObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Contact/Get?id=0", null));
    self.opportunityModeSelections = ko.computed(function () {
        var data = new Array();
        data.push({ 'id': '1', 'item': 'Edit existing opportunity' });
        data.push({ 'id': '2', 'item': 'Add new opportunity' });
        return data;
    }, self);
    self.opportunityModeSelectionId = ko.observable();
    self.opportunityModeSelectionId.extend({ required: "" });
    self.initialCountOfCompanyOpportunties = 0;
    self.opportunityModeSelectionId.subscribe(function (newValue) {
        if (newValue != '') {
            self.companies([]);
            if (newValue == '1') {
                if (self.initialCountOfCompanyOpportunties == 0) {
                    console.log('getting companies that has opportunties');
                    var data = jsonDataCaller.syncCall(baseUrl + "/api/CompanyOpportuntiesView?searchText=&page=0&pageSize=0&selectForExcel=false", null)
                    self.initialCountOfCompanyOpportunties = data.__count;
                    $.each(data.results, function (i, companyRecord) {
                        self.companies.push({ 'name': companyRecord.COMPANYNAME, 'id': companyRecord.COMPANIESID });
                    });
                }
            }
            else {
                self.companies(startModule.getUserCompanies());
            }
            console.log(self.companies().length)
        }
    });

    self.selectOppsVisible = ko.observable(false);
    self.selectPOCVisible = ko.observable((self.scenario == 'edit'));
    self.POCs = ko.observableArray([]);
    self.selectedPOC = ko.observable();
    self.selectedPOC.subscribe(function (newValue) {
        if (newValue != '') {
            var userContacts = startModule.getUserContactsByCompany(self.companyObservable.COMPANIESID());
            var contactObj = $.grep(userContacts, function (element, index) {
                return element.contactsId == newValue;
            });
            //console.log('contactObj=' + newValue);
            //console.log('userContacts=' + userContacts)
            if (contactObj != null && contactObj.length > 0) {
                self.companyObservable.POCLastName(contactObj[0].lastName);
                self.companyObservable.POCFirstName(contactObj[0].firstName);
                self.companyObservable.POCPhone(contactObj[0].phone);
                self.companyObservable.POCEmail(contactObj[0].email);
            }
        }
    });
    self.salesReps = ko.computed(function () {
        var data = jsonDataCaller.syncCall(baseUrl + "/api/FranchiseeUsersView?searchText=&page=0&pageSize=0&sort[0][field]=LastName&sort[0][dir]=ASC", null)

        var filteredSalesReps = new Array();
        $.each(data.results, function (i, item) {
            if (item.FirstName != null && item.LastName != null)
                filteredSalesReps.push({ 'id': item.ID, 'fullName': item.LastName + ', ' + item.FirstName, 'lastName': item.LastName, 'firstName': item.FirstName });
        });
        //console.log(filteredSalesReps);
        return filteredSalesReps;
    }, self);

    self.selectedCompanyId = ko.observable();
    self.selectedOpportunity = ko.observable();
    self.opportunities = ko.observableArray([]);

    self.selectedCompanyId.subscribe(function (newValue) {
        if (newValue != '') {
            self.companyObservable.COMPANIESID(newValue);
            if (self.scenario == 'edit') {
                self.selectOppsVisible((self.opportunityModeSelectionId() == 1));
                $.ajax({
                    url: 'api/company',
                    type: "GET",
                    data: { id: newValue },
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: false,
                    success: function (response) {
                        //console.log(response);
                        self.companyObservable.COMPANYNAME(response.COMPANYNAME);
                        self.companyObservable.POCLastName(response.POCLastName);
                        self.companyObservable.POCFirstName(response.POCFirstName);
                        self.companyObservable.POCPhone(response.POCPhone);
                        self.companyObservable.POCEmail(response.POCEmail);
                        self.companyObservable.IndustryId(response.IndustryId);
                    },
                    error: function () { }
                });
                self.POCs(startModule.getUserContactsByCompany(newValue))
                $.each(self.POCs(), function (i, item) {
                    //console.log(item.lastName + '-' + self.companyObservable.POCLastName());
                    //console.log(item.firstName + '-' + self.companyObservable.POCFirstName());
                    if (item.lastName == self.companyObservable.POCLastName() && item.firstName == self.companyObservable.POCFirstName()) {
                        //console.log(item.contactsId);
                        self.selectedPOC(item.contactsId);
                        return;
                    }
                });
                if( self.opportunityModeSelectionId() == 1){
                    $.ajax({
                        url: 'api/PipelineViewForCompany',
                        type: "GET",
                        data: { companyId: newValue },
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        success: function (response) {
                            self.opportunities(response.results);
                            if (self.opportunities().length == 1)
                                self.selectedOpportunity(self.opportunities()[0].ID);
                            //console.log(self.opportunities());
                        },
                        error: function () { }
                    });
                }
            }
        }
    });

    self.selectedOpportunity.subscribe(function (newValue) {
        if (newValue != '') {
            self.opportunity.ID(newValue);
            $.ajax({
                url: 'api/Pipeline',
                type: "GET",
                data: { id: newValue },
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: false,
                success: function (response) {
                    self.opportunity.STATUSID(response.STATUSID);
                    self.opportunity.NAME(response.NAME);
                    self.opportunity.Pain(response.Pain);
                    self.opportunity.ProductID(response.ProductID);
                    console.log('self.opportunity.ProductID()'+self.opportunity.ProductID());
                    self.opportunity.SourceID(response.SourceID);
                    self.opportunity.TypeID(response.TypeID);
                    self.opportunity.VALUE(response.VALUE);
                    self.opportunity.CONTACTID(response.CONTACTID);
                    self.opportunity.SALESREPFIRSTNAME(response.SALESREPFIRSTNAME);
                    self.opportunity.SALESREPLASTNAME(response.SALESREPLASTNAME);
                    self.opportunity.LengthOfProblem(response.LengthOfProblem);
                    self.opportunity.Alternatives(response.Alternatives);
                    self.opportunity.CostToFix(response.CostToFix);

                    self.opportunity.Notes(response.Notes);
                    self.opportunity.IsBudgeIdentified(response.IsBudgeIdentified?1:0);
                    self.opportunity.IsMoveForward(response.IsMoveForward?1:0);
                    self.opportunity.VALUE(response.VALUE);
                    self.opportunity.CostToFix(response.CostToFix);
                    self.opportunity.IsActive(true);
                    if (response.CLOSEDATE != null && response.CLOSEDATE != "") {
                        self.opportunity.OppCloseDatec(kendo.parseDate(response.CLOSEDATE));
                    }
                },
                error: function () { }
            });
            $.ajax({
                url: 'api/contact',
                type: "GET",
                data: { id: self.opportunity.CONTACTID() },
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: false,
                success: function (response) {
                    console.log(response.IsRegisteredForTraining);

                    self.contactObservable.CONTACTSID(self.opportunity.CONTACTID());
                    if (response.CourseTrainingDate != null && response.CourseTrainingDate != "") {
                        self.contactObservable.CourseTrainingDatec(kendo.parseDate(response.CourseTrainingDate));
                    }
                    if (response.NEXT_CONTACT_DATE != null && response.NEXT_CONTACT_DATE != "") {
                        self.contactObservable.NextContactDatec(kendo.parseDate(response.NEXT_CONTACT_DATE));
                    }
                    self.contactObservable.ApptSourceId(response.ApptSourceId);
                    self.contactObservable.IsNewAppointment(response.IsNewAppointment?1:0);
                    self.contactObservable.IsRegisteredForTraining(response.IsRegisteredForTraining ? 1:0);
                    self.contactObservable.CourseId(response.CourseId);
                    self.contactObservable.TrainingCourseName(response.TrainingCourseName);
                    self.contactObservable.HowManyAttended(response.HowManyAttended);
                    self.contactObservable.ACTIONSTEP(response.ACTIONSTEP);

                    self.selectedPOC(self.opportunity.CONTACTID());
                },
                error: function () { }
            });
        }
    });
    self.opportunity = opportunityObservable;



    self.IsSaved = ko.observable(false);

    self.companyObservable.COMPANYNAME.extend({ required: "" });
    self.companyObservable.POCLastName.extend({ required: "" });
    self.companyObservable.POCFirstName.extend({ required: "" });
    self.companyObservable.IndustryId.extend({ required: "" });
    self.companyObservable.IsNewCompany(1);//default set to Yes
    if (self.contactObservable.CourseTrainingDate() != null && self.contactObservable.CourseTrainingDate() != "") {
        self.contactObservable.CourseTrainingDatec = ko.observable(kendo.parseDate(self.contactObservable.CourseTrainingDate())).extend({ required: "" });
    }
    else {
        self.contactObservable.CourseTrainingDatec = ko.observable('');
    }

    if (self.contactObservable.NEXT_CONTACT_DATE() != null && self.contactObservable.NEXT_CONTACT_DATE() != "") {
        self.contactObservable.NextContactDatec = ko.observable(kendo.parseDate(self.contactObservable.NEXT_CONTACT_DATE())).extend({ required: "" });
    }
    else {
        self.contactObservable.NextContactDatec = ko.observable('').extend({ required: "" });
    }
    self.contactObservable.ApptSourceId.extend({ required: "" });
    self.contactObservable.ACTIONSTEP.extend({ required: "" });
    self.contactObservable.IsNewAppointment(1);//default set to Yes

    self.opportunity.NAME.extend({ required: "" });
    self.opportunity.Pain.extend({ required: "" });
    self.opportunity.ProductID.extend({ required: "" });
    self.opportunity.STATUSID.extend({ required: "" });
    self.opportunity.salesRepId = ko.observable(false);
    self.opportunity.salesRepId.extend({ required: "" });
    self.opportunity.STATUSID.subscribe(function (newValue) {
        if (newValue != '') {
            //console.log(newValue);
            var statusObj = $.grep(self.oppStatus, function (element, index) {
                return element.ID == newValue;
            });
            if (newValue == '1' || newValue == '2') {
                //console.log(statusObj[0].Name);
                self.opportunity.NAME(((self.companyObservable.COMPANYNAME() == null) ? '' : self.companyObservable.COMPANYNAME()) + '-' + statusObj[0].Name);
            }
            else
                self.opportunity.NAME('');

            self.opportunity.WINPROBABILITY(statusObj[0].WinProbability);
        }
    });
    self.opportunity.salesRepId.subscribe(function (newValue) {
        self.opportunity.SALESREPLASTNAME('');
        self.opportunity.SALESREPFIRSTNAME('');
        if (newValue != '') {
            //console.log(newValue);
            var salesRepObj = $.grep(self.salesReps(), function (element, index) {
                return element.id == newValue;
            });
            //console.log(salesRepObj[0]);

            self.opportunity.SALESREPLASTNAME(salesRepObj[0].lastName);
            self.opportunity.SALESREPFIRSTNAME(salesRepObj[0].firstName);
        }
    });

    self.opportunity.SourceID.extend({ required: "" });
    self.opportunity.TypeID.extend({ required: "" });
    self.opportunity.VALUE.extend({ required: "" });
    self.opportunity.WINPROBABILITY.extend({ required: "" });
    self.opportunity.WEIGHTEDVALUE = ko.computed(function () {
        if ($.isNumeric(self.opportunity.VALUE()) && $.isNumeric(self.opportunity.WINPROBABILITY())) {
            return self.opportunity.VALUE() * self.opportunity.WINPROBABILITY() / 100;
        }
    }, self);
    if (self.opportunity.CLOSEDATE() != null && self.opportunity.CLOSEDATE() != "") {
        self.opportunity.OppCloseDatec = ko.observable(kendo.parseDate(self.opportunity.CLOSEDATE())).extend({ required: "" });
    }
    else {
        self.opportunity.OppCloseDatec = ko.observable('').extend({ required: "" });
    }


    //Set some defaults...remove once testing done
    //self.companyObservable.COMPANYNAME('BitSoft Inc');
    //self.companyObservable.POCLastName('BSPocLn');
    //self.companyObservable.POCFirstName('BSPocFn');
    //self.companyObservable.POCPhone('8458458458');
    //self.companyObservable.POCEmail('pocemail@gmail.com');
    //self.companyObservable.IndustryId('1');
    //self.opportunity.NAME('BSPocFn');
    //self.opportunity.Pain('None');
    //self.opportunity.ProductID('1');
    //self.opportunity.STATUSID('1');
    //self.opportunity.SourceID('1');
    //self.opportunity.TypeID('1');
    //self.opportunity.VALUE('5000000');
    //self.opportunity.OppCloseDatec('12/30/2014');
    //self.contactObservable.NextContactDatec('11/30/2014');
    //self.contactObservable.ApptSourceId('1');
    //self.contactObservable.ACTIONSTEP('test step');


    //For Notes
    self.Notes = ko.observable(self.opportunity.Notes());

    self.pageTitle = ko.computed(function () {
        if (self.scenario != undefined && self.scenario == 'add')
            return 'Add New Opportunity';
        else if (self.scenario == 'edit')
            return 'Edit Existing [or Add New] Contact & Opportunity';
        else
            return 'Add 3-in-1:Company, Contact & Opportunity';
    });

    self.dirtyFlag = new ko.dirtyFlag_quickStart(self);

    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);


    self.hideEditContainer = function () {
        $('#saveEditContainer').modal('hide');
        $('#quickStart_body').unblock();
        self.companyObservable.COMPANIESID('');
        self.contactObservable.COMPANYID('');
        self.dirtyFlag.reset();
    };

    self.editSave = function () {
        self.companySave();
        self.contactSave(function (response) {
            if (response != undefined) {
                self.contactObservable.CONTACTSID(response.CONTACTSID);
                if (response.CONTACTSID > 0) {
                    self.opportunity.COMPANYID(response.COMPANYID);
                    self.opportunity.CONTACTID(response.CONTACTSID);
                    self.pipelineSave();
                    $('#saveEditContainer').modal('hide');
                    $('#quickStart_body').unblock();
                } else {
                    showNoti_.error('Unable to save contact.', true);
                }
            }
        });
    };

    self.continueWithSave = function () {
        self.dirtyFlag.reset();
        $('#quickStart_body').block({ message: null });
        self.companyObservable.NEXTCONTACT_DATE(self.contactObservable.NextContactDatec());

        self.contactObservable.FIRSTNAME(self.companyObservable.POCFirstName());
        self.contactObservable.LASTNAME(self.companyObservable.POCLastName());
        self.contactObservable.PHONE(self.companyObservable.POCPhone());
        self.contactObservable.EMAIL(self.companyObservable.POCEmail());
        self.contactObservable.NEXT_CONTACT_DATE(self.contactObservable.NextContactDatec());
        self.contactObservable.CourseTrainingDate(self.contactObservable.CourseTrainingDatec());

        self.opportunity.CLOSEDATE(self.opportunity.OppCloseDatec());
        self.companySave(function (response) {
            //console.log(response);
            if (response != null || response != undefined) {
                self.companyObservable.COMPANIESID(response.UniqueId);
                self.contactObservable.COMPANYID(response.UniqueId);
                if (response.success) {
                    self.contactSave(function (response) {
                        if (response != undefined) {
                            self.contactObservable.CONTACTSID(response.CONTACTSID);
                            if (response.CONTACTSID > 0) {
                                self.opportunity.COMPANYID(response.COMPANYID);
                                self.opportunity.CONTACTID(response.CONTACTSID);
                                self.pipelineSave();
                            } else {
                                showNoti_.error('Unable to save contact.', true);
                            }
                        }
                    });
                }
                else {
                    modalOptions = { backdrop: 'static', show: true };
                    var modalHeader = 'Make your selection';
                    $('#modal-headerLabel').text(modalHeader);
                    $('#saveEditContainer').modal(modalOptions);
                }
            }

        });

    };

    self.Save = function () {


        if (!self.companyObservable.COMPANYNAME()) {
            showNoti_.error('Company Name is Required!!', false);
            $('#QS_CompanyName').focus();
            return;
        }
        if (!self.companyObservable.POCFirstName()) {
            showNoti_.error('POC First Name is Required!!', false);
            $('#QS_POCFirstName').focus();
            return;
        }
        if (!self.companyObservable.POCLastName()) {
            showNoti_.error('POC Last Name is Required!!', false);
            $('#QS_POCLastName').focus();
            return;
        }
        if (!self.opportunity.STATUSID()) {
            showNoti_.error('Opportunity Status is Required!!', false);
            $('#QS_OppStatus').focus();
            return;
        }
        if (!self.opportunity.NAME()) {
            showNoti_.error('Opportunity Name is Required!!', false);
            $('#QS_OpportunityName').focus();
            return;
        }
        if (!self.opportunity.salesRepId()) {
            showNoti_.error('Sales Rep is Required!!', false);
            $('#QS_SalesRep').focus();
            return;
        }
        if (!self.opportunity.Pain()) {
            showNoti_.error('Pain is Required!!', false);
            $('#QS_Pain').focus();
            return;
        }

        if (!self.opportunity.ProductID()) {
            showNoti_.error('Product is Required!!', false);
            $('#QS_Product').focus();
            return;
        }
        if (!self.opportunity.STATUSID()) {
            showNoti_.error('Opportunity Status is Required!!', false);
            $('#QS_OppStatus').focus();
            return;
        }
        if (!self.opportunity.SourceID()) {
            showNoti_.error('Opportunity Source is Required!!', false);
            $('#QS_OppSource').focus();
            return;
        }
        if (!self.opportunity.TypeID()) {
            showNoti_.error('Opportunity Type is Required!!', false);
            $('#QS_OppType').focus();
            return;
        }
        if (!self.opportunity.VALUE()) {
            showNoti_.error('Estimated Opportunity Value is Required!!', false);
            $('#QS_Value').focus();
            return;
        }
        if (!self.contactObservable.ACTIONSTEP()) {
            showNoti_.error('Next Step is Required!!', false);
            $('#QS_NextStep').focus();
            return;
        }

        var nextContactDate = $('#QS_NextContactDate').val();
        if (!nextContactDate == "") {
            var d1 = kendo.parseDate(nextContactDate, "MM/dd/yyyy");
            if (d1 == null) {
                showNoti_.error('Next Contact Date is NOT a valid date.', false);
                $('#QS_NextContactDate').focus();
                return;
            }
        }
        else {
            showNoti_.error('Next Contact Date Date is required.', false);
            $('#QS_NextContactDate').focus();
            return;
        }

        if (!self.contactObservable.ApptSourceId()) {
            showNoti_.error('Appointment Source is Required!!', false);
            $('#QS_AppSource').focus();
            return;
        }

        //Conditional check if Registered for Training is Yes

        if (self.contactObservable.IsRegisteredForTraining() == "1") {

            if (!self.contactObservable.CourseId()) {
                showNoti_.error('Course Type is Required!!', false);
                $('#QS_CourseType').focus();
                return;
            }

            var dte = $('#QS_CourseTrainingDate').val();
            if (!dte == "") {
                var d = kendo.parseDate(dte, "MM/dd/yyyy");
                if (d == null) {
                    showNoti_.error('Course Training Date is NOT a valid date.', false);
                    $('#QS_CourseTrainingDate').focus();
                    return;
                }
            }
            else {

                showNoti_.error('Course Training Date is required.', false);
                $('#QS_CourseTrainingDate').focus();
                return;
            }


            if (!self.contactObservable.TrainingCourseName()) {
                showNoti_.error('Training Course Name is Required!!', false);
                $('#QS_TrainingCourseName').focus();
                return;
            }
            if (!self.contactObservable.HowManyAttended()) {
                showNoti_.error('Class Head Count is Required!!', false);
                $('#QS_ClassHeadCount').focus();
                return;
            }

        }

        if (!self.companyObservable.IndustryId()) {
            showNoti_.error('Industry is Required!!', false);
            $('#QS_Industry').focus();
            return;
        }

        var estOppCloseDate = $('#QS_EstOppCloseDate').val();
        if (!estOppCloseDate == "") {
            var d1 = kendo.parseDate(estOppCloseDate, "MM/dd/yyyy");
            if (d1 == null) {
                showNoti_.error('Estimated Opportunity Close Date is NOT a valid date.', false);
                $('#QS_EstOppCloseDate').focus();
                return;
            }
        }
        else {
            showNoti_.error('Estimated Opportunity Close Date is required.', false);
            $('#QS_EstOppCloseDate').focus();
            return;
        }

        ////Take care of bit Fields
        //if (self.IsBudgeIdentifiedInt() > 0) {
        // self.IsBudgeIdentified(true);
        //}
        //else {
        // self.IsBudgeIdentified(false);
        //}
        //if (self.IsMoveForwardInt() > 0) {
        // self.IsMoveForward(true);
        //}
        //else {
        // self.IsMoveForward(false);
        //}
        //if (self.IsNewAppointmentInt() > 0) {
        // self.IsNewAppointment(true);
        //}
        //else {
        // self.IsNewAppointment(false);
        //}
        //if (self.IsRegisteredForTrainingInt() > 0) {
        // self.IsRegisteredForTraining(true);
        //}
        //else {
        // self.IsRegisteredForTraining(false);
        //}
        //if (self.IsNewCompanyInt() > 0) {
        // self.IsNewCompany(true);
        //}
        //else {
        // self.IsNewCompany(false);
        //}
        //Now Continue
        self.continueWithSave();
    };

    self.companySave = function (callback) {
        $.ajax({
            url: 'api/QS/CompanySave',
            type: "POST",
            data: ko.toJSON(self.companyObservable),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (response) {
                if (callback != undefined || callback != null)
                    callback(response);
            },
            error: function (response, errorText) {
                showNoti_.error('Unable to save company, server error occures.', true);
                $('#quickStart_body').unblock();
                return false;
            }
        });
    }

    self.contactSave = function (callback) {
        self.contactObservable.IsRegisteredForTraining(self.contactObservable.IsRegisteredForTraining() == 1 ? true : false);
        self.contactObservable.IsNewAppointment(self.contactObservable.IsNewAppointment() == 1 ? true : false);
        $.ajax({
            url: 'api/QS/ContactSave',
            type: "POST",
            data: ko.toJSON(self.contactObservable),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (response) {
                if (callback != undefined || callback != null)
                    callback(response);
            },
            error: function (response, errorText) {
                showNoti_.error('Unable to save contact, server error occures.', true);
                $('#quickStart_body').unblock();
                return false;
            }
        });
    };

    self.pipelineSave = function () {
        //console.log(ko.toJSON(self.opportunity));
        self.opportunity.IsBudgeIdentified(self.opportunity.IsBudgeIdentified() == 1 ? true : false);
        self.opportunity.IsMoveForward(self.opportunity.IsMoveForward() == 1 ? true : false);
        $.ajax({
            url: 'api/QS/PipelineSave',
            type: "POST",
            data: ko.toJSON(self.opportunity),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (response) {
                //console.log('saved pipeline');
                $('#quickStart_body').unblock();
                showNoti_.info('Opportunity added successfully.', true);
                modalOptions = { backdrop: 'static', show: true };
                $('#meetingInviteContainer').modal(modalOptions);
            },
            error: function (response, errorText) {
                showNoti_.error('Unable to save pipeline, server error occures.', true);
                return false;
            }
        });
    };

    self.reset = function (type) {

        self.companyObservable.COMPANYNAME('');
        self.companyObservable.POCFirstName('');
        self.companyObservable.POCLastName('');
        self.companyObservable.POCPhone('');
        self.companyObservable.POCEmail('');
        self.companyObservable.IsNewCompany('');
        self.companyObservable.IndustryId('');
        self.companyObservable.COMPANIESID('');

        self.contactObservable.ACTIONSTEP('');
        self.contactObservable.IsNewAppointment('');
        self.contactObservable.ApptSourceId('');
        self.contactObservable.IsRegisteredForTraining('');
        self.contactObservable.CourseId('');
        self.contactObservable.CourseTrainingDatec('');
        self.contactObservable.TrainingCourseName('');
        self.contactObservable.HowManyAttended('');
        self.contactObservable.NextContactDatec('');
        self.contactObservable.COMPANYID('');
        self.contactObservable.CONTACTSID('');

        self.opportunity.NAME('');
        self.opportunity.Pain('');
        self.opportunity.LengthOfProblem('');
        self.opportunity.Alternatives('');
        self.opportunity.CostToFix('');
        self.opportunity.IsBudgeIdentified('');
        self.opportunity.IsMoveForward('');
        self.opportunity.ProductID('');
        self.opportunity.STATUSID('');
        self.opportunity.SourceID('');
        self.opportunity.TypeID('');
        self.opportunity.VALUE('');
        self.opportunity.IsActive(false);
        self.opportunity.Notes('');
        self.opportunity.OppCloseDatec('');
        self.opportunity.CONTACTID();
        self.opportunity.SALESREPFIRSTNAME('');
        self.opportunity.SALESREPLASTNAME('');
        self.opportunity.WINPROBABILITY('');
        self.opportunity.salesRepId('');
        self.opportunity.COMPANYID('');
        self.opportunity.CONTACTID('');

        self.opportunityModeSelectionId('');
        self.selectOppsVisible(false);
        self.POCs([]);
        self.selectedPOC('');
        self.selectedCompanyId('');
        self.selectedOpportunity();
        self.opportunities([]);
        self.Notes('');

        self.initialCountOfCompanyOpportunties = 0;
        //self.dirtyFlag.reset();

        if (type != 'Clear') {
            self.IsSaved(true);
        }
        else {
            self.IsSaved(false);
        }
    }

    self.sendInvite = function () {

        //call to send invite

        //hide this modal
        $('#meetingInviteContainer').modal('hide');
        $('#quickStart_body').unblock();

        //open next modal
        modalOptions = { backdrop: 'static', show: true };
        $('#newEntryResponseContainer').modal(modalOptions);
    };

    self.denySendInvite = function () {
        $('#meetingInviteContainer').modal('hide');
        $('#quickStart_body').unblock();

        //open next modal
        modalOptions = { backdrop: 'static', show: true };
        $('#newEntryResponseContainer').modal(modalOptions);        
    };

    self.createAnotherOpportunity = function () {
        self.contactObservable.COMPANYID('');
        self.contactObservable.CONTACTSID('');
        self.opportunity.COMPANYID('');
        self.opportunity.CONTACTID('');

        $('#newEntryResponseContainer').modal('hide');
        $('#quickStart_body').unblock();
    };

    self.createAnotherOpportunityEditMode = function () {
        self.contactObservable.COMPANYID('');
        self.contactObservable.CONTACTSID('');
        self.opportunity.COMPANYID('');
        self.opportunity.CONTACTID('');

        $('#newEntryResponseContainer').modal('hide');
        $('#quickStart_body').unblock();
    };

    self.editExistingOpportunityEditMode = function () {

        $('#newEntryResponseContainer').modal('hide');
        $('#quickStart_body').unblock();
    };

    self.denyCreateAnotherOpportunity = function () {
        $('#newEntryResponseContainer').modal('hide');
        $('#quickStart_body').unblock();
        self.reset();
    };
}

//////////////
///Dirty Flag Checker
//////////////

ko.dirtyFlag_quickStart = function (root, isInitiallyDirty) {

    var result = function () { },
        _initialState = ko.observable(ko.toJSON(root)),
        _isInitiallyDirty = ko.observable(isInitiallyDirty);

    result.isDirty = ko.computed(function () {
        return _isInitiallyDirty() || _initialState() !== ko.toJSON(root);
    });

    result.reset = function () {
        _initialState(ko.toJSON(root));
        _isInitiallyDirty(false);
    };

    return result;
};



