
var createGroupF;
var coachdata = jsonDataCaller.syncCall(baseUrl + "/api/GetCoachEmailInfo", null);
var frownerdata = jsonDataCaller.syncCall(baseUrl + "/api/FrOwnerAdrsInfo", null);
var frusrsdata = jsonDataCaller.syncCall(baseUrl + "/api/FrUsersAdrsInfo", null);
var frctsdata = jsonDataCaller.syncCall(baseUrl + "/api/FrContactsAdrsInfo", null);

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

ko.dirtyFlag_cgrp = function (root, isInitiallyDirty) {

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


function CoachEmail_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.CoachID);
    self.name = ko.observable(data.CoachEmail);
    self.IsSelected = ko.observable(false);
}

function Frse_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.UserId);
    self.name = ko.observable(data.Email);
    self.IsSelected = ko.observable(false);
}

function FrContact_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.ContactsId);
    self.name = ko.observable(data.Fullname);
    self.IsSelected = ko.observable(false);
}

function createGroupF_viewModel() {
    var self = this;
    
    self.GRPNAME = ko.observable().extend({ required: "" });
    self.FRNAME = ko.observable(jsonDataCaller.syncCall(baseUrl + "/api/GetFranchiseeName", null));

    self.frcoachEmails = ko.observableArray([]);
    self.frownerEmails = ko.observableArray([]);
    self.fruserEmails = ko.observableArray([]);
    self.frcontactEmails = ko.observableArray([]);
    
   
    self.ProcessFrCoachEmails = function () {
        /*Faster Code*/
        underlyingArray = self.frcoachEmails();
        for (var i = 0, j = coachdata.results.length; i < j; i++) {
            var chd = new CoachEmail_viewModel(coachdata.results[i], i);
            //console.log(usrgvm);
            underlyingArray.push(chd);
        }
        self.frcoachEmails.valueHasMutated();
    }
    self.ProcessFrOwnerEmails = function () {
        /*Faster Code*/
        underlyingArray = self.frownerEmails();
        for (var i = 0, j = frownerdata.results.length; i < j; i++) {
            var fro = new Frse_viewModel(frownerdata.results[i], i);
            //console.log(usrgvm);
            underlyingArray.push(fro);
        }
        self.frownerEmails.valueHasMutated();
    }
    self.ProcessFrUsersEmails = function () {
        /*Faster Code*/
        underlyingArray = self.fruserEmails();
        for (var i = 0, j = frusrsdata.results.length; i < j; i++) {
            var fru = new Frse_viewModel(frusrsdata.results[i], i);
            //console.log(usrgvm);
            underlyingArray.push(fru);
        }
        self.fruserEmails.valueHasMutated();
    }
    self.ProcessFrContactsEmails = function () {
        /*Faster Code*/
        underlyingArray = self.frcontactEmails();
        for (var i = 0, j = frctsdata.results.length; i < j; i++) {
            var frct = new FrContact_viewModel(frctsdata.results[i], i);
            //console.log(usrgvm);
            underlyingArray.push(frct);
        }
        self.frcontactEmails.valueHasMutated();
    }
    
    self.ProcessFrCoachEmails();
    self.IsAllCoachEmail = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.frcoachEmails(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.frcoachEmails(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });

    self.ProcessFrOwnerEmails();
    self.IsAllFrOwnerEmail = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.frownerEmails(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.frownerEmails(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });

    self.ProcessFrUsersEmails();
    self.IsAllFrUserEmail = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.fruserEmails(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.fruserEmails(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });

    self.ProcessFrContactsEmails();
    self.IsAllFrContactEmail = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.frcontactEmails(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.frcontactEmails(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });
        
    //To track Dirty flag on page
    self.dirtyFlag = new ko.dirtyFlag_cgrp(self);
    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);

    //We do not want div collapse and hide change IsDirty Flag so this will come after the dirty flag declaration
    self.Div1Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div2Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div3Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-right");
    self.Div4Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-right");

    self.ResetForm = function () {
        self.GRPNAME("");
        self.frcoachEmails.removeAll();
        self.frownerEmails.removeAll();
        self.fruserEmails.removeAll();
        self.frcontactEmails.removeAll();
        self.ProcessFrCoachEmails();
        self.ProcessFrOwnerEmails();
        self.ProcessFrUsersEmails();
        self.ProcessFrContactsEmails();
        showNoti_.info("Email Group Created Successfully !!", false);
    }
        
    self.Send = function () {

        //Client side Validation 
        if (!self.GRPNAME()) {
            showNoti_.error('Group Name is Required!!', false);
            $('#cg_grp').focus();
            return;
        }

        //Now Save the Email Group...
        $.ajax({
            url: "/api/Email/SaveEmailGroupNow",
            type: 'POST',
            data: ko.toJSON(self),
            contentType: 'application/json',
            success: function (result) {
                if (!result.success)
                    showNoti_.error(result.message, false);
                else
                    self.ResetForm();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                showNoti_.error("There is some issue in Creating Email Group.", true);
            }
        });
        
    }

}

function ng_CreateGroupCtrl($scope, $http) {
    angular.element(document).ready(function () {
               
        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        /*Bind with the Model*/
        createGroupF = new createGroupF_viewModel();
        ko.applyBindings(createGroupF, document.getElementById("createGroupMainDiv"));

        //Below section is for collapsible panels > (Right) and Down arrow show and hide options
        $('#collapseOne').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createGroupF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-right");
        })

        $('#collapseOne').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createGroupF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseTwo').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createGroupF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseTwo').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createGroupF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseThree').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createGroupF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseThree').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createGroupF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseFour').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createGroupF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseFour').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createGroupF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

                      
    });
    
};

