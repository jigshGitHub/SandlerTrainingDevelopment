
var sendEmailF;
var begdata = jsonDataCaller.syncCall(baseUrl + "/api/GetBlastEmailGroupByRole", null);
var usrgdata = jsonDataCaller.syncCall(baseUrl + "/api/GetUserEmailGroups", null);

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

ko.dirtyFlag_dent = function (root, isInitiallyDirty) {

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

function FrGroup_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.Id);
    self.name = ko.observable(data.BlastGroupName);
    self.IsSelected = ko.observable(false);
}

function UserGroup_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.Id);
    self.name = ko.observable(data.GroupName);
    self.IsSelected = ko.observable(false);
}

function sendEmailF_viewModel() {
    var self = this;

    self.SUBJECT = ko.observable().extend({ required: "" });
    self.RCPNTS = ko.observable();
    self.MESSAGE = ko.observable().extend({ required: "" });
    self.FILENAME = ko.observable();
    self.FILENAMES = ko.observable();
    self.FILEINFO = ko.computed(function () {
        if (self.FILENAME() != "" && self.FILENAME() != null) {
            return "Attachment: " + self.FILENAME();
        }
        else {
            return "";
        }
    });
    //For Franchisee Groups...
    self.blastEmailGroups = ko.observableArray([]);
    //For User Own Groups....
    self.userEmailGroups = ko.observableArray([]);
    
    self.ProcessBlastEmailGroups = function () {
        /*Faster Code*/
        underlyingArray = self.blastEmailGroups();
        for (var i = 0, j = begdata.results.length; i < j; i++) {
            var bgdvm = new FrGroup_viewModel(begdata.results[i], i);
            underlyingArray.push(bgdvm);
        }
        self.blastEmailGroups.valueHasMutated();
    }

    self.ProcessUserEmailGroups = function () {
        /*Faster Code*/
        underlyingArray = self.userEmailGroups();
        for (var i = 0, j = usrgdata.results.length; i < j; i++) {
            var usrgvm = new UserGroup_viewModel(usrgdata.results[i], i);
            //console.log(usrgvm);
            underlyingArray.push(usrgvm);
        }
        self.userEmailGroups.valueHasMutated();
     }
    
    self.ProcessBlastEmailGroups();
    self.IsAllFrGroup = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.blastEmailGroups(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.blastEmailGroups(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });
    /*End For Franchisee Groups*/

    /*For User Email Groups*/
    self.ProcessUserEmailGroups();
    self.IsAllUserGroup = ko.computed({
        read: function () {
            var isAllSelected = true;
            ko.utils.arrayForEach(self.userEmailGroups(), function (item) {
                isAllSelected = isAllSelected && item.IsSelected()
            });
            return isAllSelected;
        },
        write: function (value) {
            ko.utils.arrayForEach(self.userEmailGroups(), function (item) {
                if (value) item.IsSelected(true);
                else item.IsSelected(false);
            });
        }
    });
    /*End For User Email Groups*/
        
    //To track Dirty flag on page
    self.dirtyFlag = new ko.dirtyFlag_dent(self);
    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);

    //We do not want div collapse and hide change IsDirty Flag so this will come after the dirty flag declaration
    self.Div1Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div2Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div3Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-right");
    self.Div4Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-right");

    //Reset after the message is sent...
    self.ResetForm = function () {
        self.SUBJECT("");
        self.RCPNTS("");
        self.MESSAGE("");
        self.FILENAME("");
        self.FILENAMES("");
        self.userEmailGroups.removeAll();
        self.blastEmailGroups.removeAll();
        self.ProcessBlastEmailGroups();
        self.ProcessUserEmailGroups();
        showNoti_.info("Email sent Successfully !!", false);
    }

    //Send the Email Now
    self.Send = function () {
        //Client side Validation 
        if (!self.SUBJECT()) {
            showNoti_.error('Subject is Required!!', false);
            $('#sm_subject').focus();
            return;
        }
        
        if (!self.MESSAGE()) {
            showNoti_.error('Message is Required!!', false);
            $('#sm_message').focus();
            return;
        }
        //Now Send Email...
        $.ajax({
            url: "/api/Email/SendEmailNow",
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
                            showNoti_.error("There is some issue in sending Email message.", true);
                }
        });
                
    }
    
}

function ng_SendEmailCtrl($scope, $http) {
    angular.element(document).ready(function () {
               
        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        /*Bind with the Model*/
        sendEmailF = new sendEmailF_viewModel();
        ko.applyBindings(sendEmailF, document.getElementById("sendEmailMainDiv"));

        //Below section is for collapsible panels > (Right) and Down arrow show and hide options
        $('#collapseOne').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendEmailF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-right");
        })

        $('#collapseOne').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendEmailF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseTwo').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendEmailF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseTwo').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendEmailF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });
                
        $('#collapseThree').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendEmailF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseThree').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendEmailF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });
        
        $('#collapseFour').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendEmailF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseFour').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendEmailF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });
        
        //This is for Attachment File Upload...
        $('#fileupload_sm').fileupload(
            {
                url: '/RDL/Home/UploadEmailDocument',
                dataType: 'json',
                pasteZone: null,
                success: function (data) {
                    //console.log(data);
                    if (data.success) {
                        sendEmailF.FILENAME(data.orgfilename);
                        sendEmailF.FILENAMES(data.serverfilename);
                    }
                    else {
                        showNoti_.error(data.message, true);
                    }
                }
            });
        });
        //console.log(begdata);
};