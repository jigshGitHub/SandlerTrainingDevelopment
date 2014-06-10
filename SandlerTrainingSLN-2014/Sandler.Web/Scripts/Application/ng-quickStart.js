

function ng_quickStartCtrl($scope, $http) {
    angular.element(document).ready(function () {
        
        $("#bt_cancel_evt").click(function () {            
            initialize_quickStartF('Clear');

        });

        //opportunityObservable = jsonDataCaller.syncCall(baseUrl + "/api/QuickStart/Get?id=0", null);
        //console.log(opportunityObservable.Pain());
        quickStartVM = new quickStartDataVM(opportunityObservable);
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

//First time display the data
function quickStartDataVM(opportunityObservable) {
    var startModule = sandler.appStart.module;
    var self = this;

    self.products = startModule.getProductTypes();
    self.whyLosts = startModule.getOpportunityWhyLosts();
    self.oppStatus = startModule.getOpportunityStatus();
    self.oppSources = startModule.getOpportunitySources();
    self.oppTypes = startModule.getOpportunityTypes();
    self.industries = startModule.getIndustryTypes();
    self.appSources = startModule.getAppointmentSources();
    self.yesNoDataSrces = startModule.getYesNoOptions();
    self.courseTypes = startModule.getCourses();

    
    self.opportunity = opportunityObservable;
        
    if(self.opportunity.ID > 0)
    {
        //load company
        //self.company = 
        //load primary contact for POC
        self.company = ko.observable(startModule.getCompanyById(self.opportunity.COMPANYID));
        self.contact = ko.observable(startModule.getCompanyById(self.opportunity.CONTACTID));
    }
    else {
        self.company = ko.observable(startModule.createCompany());
        self.contact = ko.observable(startModule.createContact());
    }
    console.log(self.company());
    self.IsSaved = ko.observable(false);
    self.company.name.extend({ required: "" });
    //self.company.industryId.extend({ required: "" });
    //self.contact.firstName.extend({ required: "" });
    //self.contact.lastName.extend({ required: "" });
    //self.contact.apptSourceId.extend({ required: "" });
    //self.contact.courseId.extend({ required: "" });
    self.opportunity.NAME.extend({ required: "" });
    self.opportunity.Pain.extend({ required: "" });
    self.opportunity.ProductID.extend({ required: "" });
    self.opportunity.STATUSID.extend({ required: "" });
    self.opportunity.SourceID.extend({ required: "" });
    self.opportunity.TypeID.extend({ required: "" });
    self.opportunity.VALUE.extend({ required: "" });
   
  

    //Next Contact Date
    if (self.contact.NEXT_CONTACT_DATE != null && self.contact.NEXT_CONTACT_DATE != "") {
        self.contact.NEXT_CONTACT_DATEc = ko.observable(kendo.parseDate(self.contact.NEXT_CONTACT_DATE));
    }
    else {
        self.contact.NEXT_CONTACT_DATEc = ko.observable();
    }
    self.contact.NEXT_CONTACT_DATE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.contact.NEXT_CONTACT_DATEc);
    });

    //Course Training Date

    if (self.contact.CourseTrainingDate != null && self.contact.CourseTrainingDate != "") {
        self.contact.CourseTrainingDatec = ko.observable(kendo.parseDate(self.contact.CourseTrainingDate));
    }
    else {
        self.contact.CourseTrainingDatec = ko.observable();
    }
    self.contact.CourseTrainingDate = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.contact.CourseTrainingDatec);
    });
    //Creation Date
    if (self.opportunity.CLOSEDATE != null && self.opportunity.CLOSEDATE != "") {
        self.opportunity.CLOSEDATEc = ko.observable(kendo.parseDate(self.opportunity.CLOSEDATE())).extend({ required: "" });
    }
    else {
        self.opportunity.CLOSEDATEc = ko.observable().extend({ required: "" });
    }
    self.opportunity.CLOSEDATE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.opportunity.CLOSEDATEc());
    });


    //For Notes
    //self.Notes = ko.observable(self.opportunity.Notes());

    self.pageTitle = ko.computed(function () {
        return ("Add 3-In-1");
    });

    self.dirtyFlag = new ko.dirtyFlag_quickStart(self);

    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);


    
    self.continueWithSave = function () {
      
        self.dirtyFlag.reset();
        $('#quickStart_body').block({ message: null });
        dao_.save(baseUrl + "/api/QuickStart/Save", ko.toJSON(self),
            function (result) {
                if (result.success) {
                    $("#quickStart_body").unblock();
                    showNoti_.hide();
                    initialize_quickStartF('Save');                    
                }
                else {
                    $("#quickStart_body").unblock();
                    showNoti_.hide();
                    showNoti_.error(result.message, false);
                }
            },
            function () {
                $("#quickStart_body").unblock();
                showNoti_.hide();
            });
    };


    self.Save = function () {
    

        if (!self.CompanyName()) {
            showNoti_.error('Company Name is Required!!', false);
            $('#QS_CompanyName').focus();
            return;
        }
        if (!self.POCFirstName()) {
            showNoti_.error('POC First Name is Required!!', false);
            $('#QS_POCFirstName').focus();
            return;
        }
        if (!self.POCLastName()) {
            showNoti_.error('POC Last Name is Required!!', false);
            $('#QS_POCLastName').focus();
            return;
        }
        if (!self.NAME()) {
            showNoti_.error('Opportunity Name is Required!!', false);
            $('#QS_OpportunityName').focus();
            return;
        }
        if (!self.Pain()) {
            showNoti_.error('Pain is Required!!', false);
            $('#QS_Pain').focus();
            return;
        }
        
        
        if (!self.ProductID()) {
            showNoti_.error('Product is Required!!', false);
            $('#QS_Product').focus();
            return;
        }
        if (!self.STATUSID()) {
            showNoti_.error('Opportunity Status is Required!!', false);
            $('#QS_OppStatus').focus();
            return;
        }
        if (!self.SourceID()) {
            showNoti_.error('Opportunity Source is Required!!', false);
            $('#QS_OppSource').focus();
            return;
        }
        if (!self.TypeID()) {
            showNoti_.error('Opportunity Type is Required!!', false);
            $('#QS_OppType').focus();
            return;
        }
        if (!self.Value()) {
            showNoti_.error('Estimated Opportunity Value is Required!!', false);
            $('#QS_Value').focus();
            return;
        }
        if (!self.ApptSourceId()) {
            showNoti_.error('Appointment Source is Required!!', false);
            $('#QS_AppSource').focus();
            return;
        }

        var dte2 = $('#QS_CourseTrainingDate').val();
        if (!dte2 == "") {
            var d = kendo.parseDate(dte2, "MM/dd/yyyy");
            if (d == null) {
                showNoti_.error('Course Training Date is NOT a valid date.', false);
                $('#QS_CourseTrainingDate').focus();
                return;
            }
        }
        
        //Conditional check if Registered for Training is Yes

        if (self.IsRegisteredForTrainingInt() == "1") {

            if (!self.CourseTypeID()) {
                showNoti_.error('Course Type is Required!!', false);
                $('#QS_CourseType').focus();
                return;
            }

            //For Last Contact Date
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


            if (!self.TrainingCourseName()) {
                showNoti_.error('Training Course Name is Required!!', false);
                $('#QS_TrainingCourseName').focus();
                return;
            }
            if (!self.HowManyAttended()) {
                showNoti_.error('Class Head Count is Required!!', false);
                $('#QS_ClassHeadCount').focus();
                return;
            }

        }
        
        if (!self.IndustryId()) {
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


        //Take care of bit Fields
        if (self.IsBudgeIdentifiedInt() > 0) {
            self.IsBudgeIdentified(true);
        }
        else {
            self.IsBudgeIdentified(false);
        }
        if (self.IsMoveForwardInt() > 0) {
            self.IsMoveForward(true);
        }
        else {
            self.IsMoveForward(false);
        }

        if (self.IsNewAppointmentInt() > 0) {
            self.IsNewAppointment(true);
        }
        else {
            self.IsNewAppointment(false);
        }

        if (self.IsRegisteredForTrainingInt() > 0) {
            self.IsRegisteredForTraining(true);
        }
        else {
            self.IsRegisteredForTraining(false);
        }
        if (self.IsNewCompanyInt() > 0) {
            self.IsNewCompany(true);
        }
        else {
            self.IsNewCompany(false);
        }
        //Now Continue
        self.continueWithSave();
    };

}

