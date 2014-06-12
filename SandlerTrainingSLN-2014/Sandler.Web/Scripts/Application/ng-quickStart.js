﻿

function ng_quickStartCtrl($scope, $http) {
    angular.element(document).ready(function () {
        
        $("#bt_cancel_evt").click(function () {            
            initialize_quickStartF('Clear');

        });        
        
        var vm = new quickStartDataVM(observable);
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
    quickStartVM.LengthofProblem('');
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
    function quickStartDataVM(opportunityObservable) {
        var self = this;

        self.products = startModule.getProductTypes();
        console.log(startModule.getProductTypes());
        self.whyLosts = startModule.getOpportunityWhyLosts();
        self.oppStatus = startModule.getOpportunityStatus();
        self.oppSources = startModule.getOpportunitySources();
        self.oppTypes = startModule.getOpportunityTypes();
        self.industries = startModule.getIndustryTypes();
        self.appSources = startModule.getAppointmentSources();
        self.yesNoData = startModule.getYesNoOptions();
        self.courseTypes = startModule.getCourses();


        self.opportunity = opportunityObservable;

        var company;
        if (self.opportunity.ID > 0) {
            //load company
            //self.company = 
            //load primary contact for POC
            company = startModule.getCompanyById(self.opportunity.COMPANYID);
            self.contact = ko.observable(startModule.getCompanyById(self.opportunity.CONTACTID));
        }
        else {
            company = jsonDataCaller.syncCall(baseUrl + "/api/Company/Get?id=0", null);
            self.companyObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Company/Get?id=0", null));
            self.contactObservable = ko.mapping.fromJS(jsonDataCaller.syncCall(baseUrl + "/api/Contact/Get?id=0", null));
        }
        self.IsSaved = ko.observable(false);
        //self.COMPANYNAME = ko.observable(company.COMPANYNAME).extend({ required: "" });
        //self.POCLastName = ko.observable(company.POCLastName).extend({ required: "" });
        //self.POCFirstName = ko.observable(company.POCFirstName).extend({ required: "" });
        //self.POCPhone = ko.observable(company.POCPhone);
        //self.POCDepartment = ko.observable(company.POCDepartment);
        //self.POCEmail = ko.observable(company.POCEmail);

        self.companyObservable.COMPANYNAME.extend({ required: "" });
        self.companyObservable.POCLastName.extend({ required: "" });
        self.companyObservable.POCFirstName.extend({ required: "" });
        self.companyObservable.IndustryId.extend({ required: "" });

        //if (self.contactObservable.CourseTrainingDate() != null && self.contactObservable.CourseTrainingDate() != "") {
        //    self.contactObservable.CourseTrainingDatec = ko.observable(kendo.parseDate(self.contactObservable.CourseTrainingDate())).extend({ required: "" });
        //}
        //else {
        //    self.contactObservable.CourseTrainingDatec = ko.observable('').extend({ required: "" });
        //}

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
        self.opportunity.SourceID.extend({ required: "" });
        self.opportunity.TypeID.extend({ required: "" });
        self.opportunity.VALUE.extend({ required: "" });

        if (self.opportunity.CLOSEDATE() != null && self.opportunity.CLOSEDATE() != "") {
            self.opportunity.OppCloseDatec = ko.observable(kendo.parseDate(self.opportunity.CLOSEDATE())).extend({ required: "" });
        }
        else {
            self.opportunity.OppCloseDatec = ko.observable('').extend({ required: "" });
        }




        //For Notes
        self.Notes = ko.observable(self.opportunity.Notes());

        self.pageTitle = ko.computed(function () {
            return ("Add 3-In-1");
        });

        self.dirtyFlag = new ko.dirtyFlag_quickStart(self);

        self.isDirty = ko.computed(function () {
            return self.dirtyFlag.isDirty()
        }, this);



        self.continueWithSave = function () {
            console.log(self.companyObservable);
            console.log(self.contactObservable);
            console.log(self.opportunity);
            self.dirtyFlag.reset();
            $('#quickStart_body').block({ message: null });
            
            $.ajax({
                url: 'api/ContactSave',
                type: "POST",
                data: { contact: ko.toJSON(self.contactObservable), quickstartSave: true },
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: false,
                success: function (response) {
                    console.log('saved contact');
                    showNoti_.info('Contact saved successfully.', true);
                    //RefreshGrid();
                },
                error: function (response, errorText) {
                    showNoti_.error('Unable to save contact, server error occures.', true);
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



