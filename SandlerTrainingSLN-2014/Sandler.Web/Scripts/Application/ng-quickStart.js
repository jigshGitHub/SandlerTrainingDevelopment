

function ng_quickStartCtrl($scope, $http) {
    angular.element(document).ready(function () {
        
        $("#bt_cancel_evt").click(function () {            
            initialize_quickStartF('Clear');

        });        
        
        var vm = new quickStartDataVM(observable, scenario);
        ko.applyBindings(vm, document.getElementById("quickStart_body"));
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
    quickStartVM.COMPANYNAME('');
    quickStartVM.POCFirstName('');
    quickStartVM.POCLastName('');
    quickStartVM.POCPhone('');
    quickStartVM.POCEmail('');
    quickStartVM.NAME('');
    quickStartVM.SalesRepLastName('');
    quickStartVM.SalesRepFirstName('');
    quickStartVM.Pain('');
    quickStartVM.LengthOfProblem('');
    quickStartVM.Alternatives('');
    quickStartVM.CostToFix('');
    quickStartVM.IsBudgeIdentified('');  
    quickStartVM.IsMoveForward('');    
    quickStartVM.ProductID('');
    quickStartVM.STATUSID('');
    quickStartVM.SourceID('');
    quickStartVM.TypeID('');
    quickStartVM.Value('');
    quickStartVM.ActionStep('');
    quickStartVM.IsNewAppointment('');

    quickStartVM.ApptSourceId('');
    quickStartVM.IsRegisteredForTraining('');
   
    quickStartVM.CourseTypeID('');
    quickStartVM.CourseTrainingDatec('');
   
    quickStartVM.TrainingCourseName('');
    quickStartVM.HowManyAttended('');
    quickStartVM.IsNewCompany('');
    
    quickStartVM.IndustryId('');
    quickStartVM.NEXT_CONTACT_DATEc('');
    quickStartVM.CLOSEDATEc('');
    //For Notes
    quickStartVM.Notes('');
    quickStartVM.dirtyFlag.reset();

    quickStartVM.IsMoveForwardInt(0);
    quickStartVM.IsBudgeIdentifiedInt(0);
    quickStartVM.IsNewAppointmentInt(0);
    quickStartVM.IsRegisteredForTrainingInt(0);
    quickStartVM.IsNewCompanyInt(0);

    if (type != 'Clear') {
        quickStartVM.IsSaved(true);
    }
    else {
        quickStartVM.IsSaved(false);
    }  
}
    var startModule = sandler.appStart.module;
    //First time display the data
    function quickStartDataVM(opportunityObservable, scenario) {
        var self = this;
        self.scenario = scenario;
        self.products = startModule.getProductTypes();
        //console.log(startModule.getProductTypes());
        self.whyLosts = startModule.getOpportunityWhyLosts();
        self.oppStatus = startModule.getOpportunityStatus();
        self.oppSources = startModule.getOpportunitySources();
        self.oppTypes = startModule.getOpportunityTypes();
        self.industries = startModule.getIndustryTypes();
        self.appSources = startModule.getAppointmentSources();
        self.yesNoData = startModule.getYesNoOptions();
        self.courseTypes = startModule.getCourses();
        self.companies = startModule.getUserCompanies();
        self.companyObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Company/Get?id=0", null));
        self.contactObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Contact/Get?id=0", null));
        self.salesReps = ko.computed(function () {
            var data = jsonDataCaller.syncCall("/api/FranchiseeUsersView?searchText=&page=0&pageSize=0&sort[0][field]=LastName&sort[0][dir]=ASC", null)

            var filteredSalesReps = new Array();
            $.each(data.results, function (i, item) {
                if (item.FirstName != null && item.LastName != null)
                    filteredSalesReps.push({ 'id': item.ID, 'fullName' : item.LastName + ', ' + item.FirstName, 'lastName':item.LastName, 'firstName':item.FirstName });
            });
            console.log(filteredSalesReps);
            return filteredSalesReps;
        }, self);

        self.selectedCompanyId = ko.observable();
        self.selectedOpportunity = ko.observable();
        self.opportunities = ko.observableArray([]);
        self.selectedCompanyId.subscribe(function (newValue) {
            if (newValue != '') {
                self.companyObservable.COMPANIESID(newValue);
                if (self.scenario == 'edit') {
                    $.ajax({
                        url: 'api/company',
                        type: "GET",
                        data: { id: newValue },
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        success: function (response) {
                            console.log(response);
                            self.companyObservable.COMPANYNAME(response.COMPANYNAME);
                            self.companyObservable.POCLastName(response.POCLastName);
                            self.companyObservable.POCFirstName(response.POCFirstName);
                            self.companyObservable.POCPhone(response.POCPhone);
                            self.companyObservable.POCEmail(response.POCEmail);
                            self.companyObservable.IndustryId(response.IndustryId);
                        },
                        error: function () { }
                    });
                    $.ajax({
                        url: 'api/PipelineViewForCompany',
                        type: "GET",
                        data: { companyId: newValue },
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        async: false,
                        success: function (response) {
                            self.opportunities(response.results);
                            console.log(self.opportunities());
                        },
                        error: function () { }
                    });
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
                        self.opportunity.NAME(response.NAME);
                        self.opportunity.Pain(response.Pain);
                        self.opportunity.ProductID(response.ProductID);
                        self.opportunity.STATUSID(response.STATUSID);
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
                        self.opportunity.IsBudgeIdentified(response.IsBudgeIdentified);
                        self.opportunity.IsMoveForward(response.IsMoveForward);
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
                        self.contactObservable.CONTACTSID(self.opportunity.CONTACTID());
                        if (response.CourseTrainingDate != null && response.CourseTrainingDate != "") {
                            self.contactObservable.CourseTrainingDatec(kendo.parseDate(response.CourseTrainingDate));
                        }
                        if (response.NEXT_CONTACT_DATE != null && response.NEXT_CONTACT_DATE != "") {
                            self.contactObservable.NextContactDatec(kendo.parseDate(response.NEXT_CONTACT_DATE));
                        }
                        self.contactObservable.ApptSourceId(response.ApptSourceId);
                        self.contactObservable.IsNewAppointment(response.IsNewAppointment);
                        self.contactObservable.IsRegisteredForTraining(response.IsRegisteredForTraining);
                        self.contactObservable.CourseId(response.CourseId);
                        self.contactObservable.TrainingCourseName(response.TrainingCourseName);
                        self.contactObservable.HowManyAttended(response.HowManyAttended);
                        self.contactObservable.ACTIONSTEP(response.ACTIONSTEP);
                        
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

        self.opportunity.NAME.extend({ required: "" });
        self.opportunity.Pain.extend({ required: "" });
        self.opportunity.ProductID.extend({ required: "" });
        self.opportunity.STATUSID.extend({ required: "" });
        self.opportunity.salesRepId = ko.observable(false);
        self.opportunity.salesRepId.extend({ required: "" });
        self.opportunity.STATUSID.subscribe(function (newValue) {
            if (newValue != '') {
                console.log(newValue);
                if(newValue == '1' || newValue == '2')
                {
                    var statusObj = $.grep(self.oppStatus, function (element, index) {
                        return element.ID == newValue;
                    });
                    console.log(statusObj[0].Name);

                    self.opportunity.NAME(((self.companyObservable.COMPANYNAME() == null) ? '' : self.companyObservable.COMPANYNAME()) + '-' + statusObj[0].Name);
                }
                else
                    self.opportunity.NAME('');
            }
        });
        self.opportunity.salesRepId.subscribe(function (newValue) {
            self.opportunity.SALESREPLASTNAME('');
            self.opportunity.SALESREPFIRSTNAME('');
            if (newValue != '') {
                console.log(newValue);
                var salesRepObj = $.grep(self.salesReps(), function (element, index) {
                    return element.id == newValue;
                });
                console.log(salesRepObj[0]);

                self.opportunity.SALESREPLASTNAME(salesRepObj[0].lastName);
                self.opportunity.SALESREPFIRSTNAME(salesRepObj[0].firstName);
            }
        });

        self.opportunity.SourceID.extend({ required: "" });
        self.opportunity.TypeID.extend({ required: "" });
        self.opportunity.VALUE.extend({ required: "" });

        if (self.opportunity.CLOSEDATE() != null && self.opportunity.CLOSEDATE() != "") {
            self.opportunity.OppCloseDatec = ko.observable(kendo.parseDate(self.opportunity.CLOSEDATE())).extend({ required: "" });
        }
        else {
            self.opportunity.OppCloseDatec = ko.observable('').extend({ required: "" });
        }


        //Set some defaults...remove once testing done
        //self.companyObservable.COMPANYNAME('JCInc');
        //self.companyObservable.POCLastName('POCLn');
        //self.companyObservable.POCFirstName('POCFn');
        //self.companyObservable.IndustryId('1');
        //self.opportunity.NAME('JCIncOpp');
        //self.opportunity.Pain('None');
        //self.opportunity.ProductID('1');
        //self.opportunity.STATUSID('1');
        //self.opportunity.SourceID('1');
        //self.opportunity.TypeID('1');
        //self.opportunity.VALUE('5000000');
        //self.opportunity.OppCloseDatec('7/1/2014');
        //self.contactObservable.NextContactDatec('7/1/2014');
        //self.contactObservable.ApptSourceId('1');


        //For Notes
        self.Notes = ko.observable(self.opportunity.Notes());

        self.pageTitle = ko.computed(function () {
            if (self.scenario != undefined && self.scenario == 'add')
                return 'Add New Opportunity';
            else if (self.scenario == 'edit')
                return 'Edit Opportunity';
            else
                return 'Add 3-in-1:Company, Contact & Opportunity';
        });

        self.dirtyFlag = new ko.dirtyFlag_quickStart(self);

        self.isDirty = ko.computed(function () {
            return self.dirtyFlag.isDirty()
        }, this);



        self.continueWithSave = function () {
            //console.log(self.companyObservable);
            //console.log(self.contactObservable);
            //console.log(self.opportunity);
            self.dirtyFlag.reset();
            $('#quickStart_body').block({ message: null });
            self.companyObservable.NEXTCONTACT_DATE(self.contactObservable.NextContactDatec());

            self.contactObservable.FIRSTNAME(self.companyObservable.POCLastName());
            self.contactObservable.LASTNAME(self.companyObservable.POCFirstName());
            self.contactObservable.NEXT_CONTACT_DATE(self.contactObservable.NextContactDatec());
            self.contactObservable.CourseTrainingDate(self.contactObservable.CourseTrainingDatec());

            self.opportunity.CLOSEDATE(self.opportunity.OppCloseDatec());
            $.ajax({
                url: 'api/QS/CompanySave',
                type: "POST",
                data: ko.toJSON(self.companyObservable),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: false,
                success: function (response) {
                    if (response.success) {
                        self.contactObservable.COMPANYID(response.UniqueId);
                        $.ajax({
                            url: 'api/QS/ContactSave',
                            type: "POST",
                            data: ko.toJSON(self.contactObservable),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            async: false,
                            success: function (response) {
                                if (response != undefined) {
                                    self.opportunity.COMPANYID(response.COMPANYID);
                                    self.opportunity.CONTACTID(response.CONTACTSID);
                                    $.ajax({
                                        url: 'api/QS/PipelineSave',
                                        type: "POST",
                                        data: ko.toJSON(self.opportunity),
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        async: false,
                                        success: function (response) {
                                            console.log('saved contact');
                                            $('#quickStart_body').unblock();
                                            showNoti_.info('Opportunity added successfully.', true);
                                        },
                                        error: function (response, errorText) {
                                            showNoti_.error('Unable to save pipeline, server error occures.', true);
                                            return false;
                                        }
                                    });
                                }
                            },
                            error: function (response, errorText) {
                                showNoti_.error('Unable to save contact, server error occures.', true);
                                $('#quickStart_body').unblock();
                                return false;
                            }
                        });
                    }
                },
                error: function (response, errorText) {
                    showNoti_.error('Unable to save company, server error occures.', true);
                    return false;
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
            if (!self.opportunity.NAME()) {
                showNoti_.error('Opportunity Name is Required!!', false);
                $('#QS_OpportunityName').focus();
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

            var dte1 = $('#QS_EstOppCloseDate').val();
            if (!dte1 == "") {
                var d1 = kendo.parseDate(dte1, "MM/dd/yyyy");
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
            //    self.IsBudgeIdentified(true);
            //}
            //else {
            //    self.IsBudgeIdentified(false);
            //}
            //if (self.IsMoveForwardInt() > 0) {
            //    self.IsMoveForward(true);
            //}
            //else {
            //    self.IsMoveForward(false);
            //}

            //if (self.IsNewAppointmentInt() > 0) {
            //    self.IsNewAppointment(true);
            //}
            //else {
            //    self.IsNewAppointment(false);
            //}

            //if (self.IsRegisteredForTrainingInt() > 0) {
            //    self.IsRegisteredForTraining(true);
            //}
            //else {
            //    self.IsRegisteredForTraining(false);
            //}
            //if (self.IsNewCompanyInt() > 0) {
            //    self.IsNewCompany(true);
            //}
            //else {
            //    self.IsNewCompany(false);
            //}
            //Now Continue
            self.continueWithSave();
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



