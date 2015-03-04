
var createCampaignF;
var usrgdata = jsonDataCaller.syncCall(baseUrl + "/api/GetUserEmailGroups", null);
var cmpgTypeData = jsonDataCaller.syncCall(baseUrl + "/api/GetCampaignTypeOptions", null);
var callToActionTypeData = jsonDataCaller.syncCall(baseUrl + "/api/GetCallToActionTypeOptions", null);
var frpersons = jsonDataCaller.syncCall(baseUrl + "/api/GetFranchiseePersonnel", null);

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

ko.bindingHandlers.richText = {
    init: function (element, valueAccessor) {

        var modelValue = valueAccessor();
        var value = ko.utils.unwrapObservable(valueAccessor());
        var element$ = $(element);

        // Set initial value and create the CKEditor
        element$.html(value);
        var editor = element$.ckeditor().editor;

        editor.addCommand('fastimage', new CKEDITOR.dialogCommand('fastimage'));

        editor.ui.addButton('fastimage', {
            label: 'Fast Image Upload',
            command: 'fastimage',
            toolbar: 'insert'
        });

        // bind to change events and link it to the observable
        editor.on('change', function (e) {
            var self = this;
            if (ko.isWriteableObservable(self)) {
                self($(e.listenerData).val());
            }
        }, modelValue, element);


        /* Handle disposal if KO removes an editor 
         * through template binding */
        ko.utils.domNodeDisposal.addDisposeCallback(element,
            function () {
                editor.updateElement();
                editor.destroy();
            });
    },

    /* Hook and handle the binding updating so we write 
     * back to the observable */
    update: function (element, valueAccessor) {
        var element$ = $(element);
        var newValue = ko.utils.unwrapObservable(valueAccessor());
        if (element$.ckeditorGet().getData() != newValue) {
            element$.ckeditorGet().setData(newValue);
        }
    }
}

ko.dirtyFlag_ace = function (root, isInitiallyDirty) {

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

function createCampaignF_viewModel() {
    var self = this;

    self.minTime = new Date(1950, 0, 1, 8, 0, 0);
    self.maxTime = new Date(2049, 11, 31, 18, 0, 0);

    self.AceId = ko.observable(0);
    self.CAMPGNAME = ko.observable().extend({ required: "" });
    self.CAMPGPURPOSE = ko.observable().extend({ required: "" });

    self.MSGSUBJECT = ko.observable().extend({ required: "" });
    self.MSGNO = ko.observable().extend({ required: "" });
    self.DAYSFROMEVENT = ko.observable().extend({ required: "" });

    self.MESSAGE = ko.observable().extend({ required: "" });
    
    //For Meeting Type
    self.CampaignTypeId = ko.observable().extend({ required: "" });
    self.CMPGTYPEDATA = ko.observableArray(cmpgTypeData.results);

    self.CallToActionId = ko.observable().extend({ required: "" });
    self.CALLTOACTIONTYPEDATA = ko.observableArray(callToActionTypeData.results);
    
    self.UserId = ko.observable(jsonDataCaller.syncCall(baseUrl + "/api/GetCurrentUserId", null));
    self.FRPERSONS = ko.observableArray(frpersons.results);

    //For Event Date 
    self.EVENTDATEc = ko.observable('').extend({ required: "" });
    self.EVENTDATE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.EVENTDATEc());
    });
    //For Event Date

    //TimeSent

    //For Send Time
    self.TimeSentc = ko.observable('').extend({ required: "" });
    self.TimeSent = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.TimeSentc());
    });
    //For Send Time
    
    self.RCPNTS = ko.observable().extend({ required: "" });
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
    
    //For User Own Groups....
    self.userEmailGroups = ko.observableArray([]);
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
    self.dirtyFlag = new ko.dirtyFlag_ace(self);
    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);

    //We do not want div collapse and hide change IsDirty Flag so this will come after the dirty flag declaration
    self.Div1Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div2Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div3Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
    self.Div4Hideshow = ko.observable("pull-right glyphicon glyphicon-chevron-down");
       
    //Reset after the message is sent...
    self.ResetForm = function () {
        self.CAMPGNAME("");
        self.CAMPGPURPOSE("");
        self.EVENTDATEc("");
        self.TimeSentc("");
        self.MSGSUBJECT("");
        self.MSGNO("");
        self.DAYSFROMEVENT("");
        self.RCPNTS("");
        self.MESSAGE("");
        self.FILENAME("");
        self.FILENAMES("");
        self.CampaignTypeId("");
        self.CallToActionId("");
        self.userEmailGroups.removeAll();
        self.ProcessUserEmailGroups();
        self.UserId(jsonDataCaller.syncCall(baseUrl + "/api/GetCurrentUserId", null));

        showNoti_.info("Campagin created Successfully !!", false);
    }
    
    //Reset after the message is sent...
    self.ResetPartForm = function () {
        self.TimeSentc("");
        self.MSGSUBJECT("");
        self.MSGNO("");
        self.DAYSFROMEVENT("");
        self.MESSAGE("");
        self.FILENAME("");
        self.FILENAMES("");
        self.CallToActionId("");
        self.UserId(jsonDataCaller.syncCall(baseUrl + "/api/GetCurrentUserId", null));
        showNoti_.info("Campagin created Successfully. Please continue to add more. !!", false);
    }
    
    self.SendAndAdd = function () {

        //Client side Validation 
        if (!self.CAMPGNAME()) {
            showNoti_.error('Campaign Name is Required!!', false);
            $('#ace_cmpname').focus();
            return false;
        }

        //Event Date
        var dte = $('#ace_eventdte').val();
        if (dte == "") {
            showNoti_.error('Event Date is required.', false);
            $('#ace_eventdte').focus();
            return false;
        }
        if (!dte == "") {
            var d = kendo.parseDate(dte, "MM/dd/yyyy");
            if (d == null) {
                showNoti_.error('Event Date is NOT a valid date.', false);
                $('#ace_eventdte').focus();
                return false;
            }
        }
        //Done for Event Date

        //Sent Time
        var stme = $('#ace_sentTime').val();
        if (stme == "") {
            showNoti_.error('Sent Time is required.', false);
            $('#ace_sentTime').focus();
            return false;
        }
        if (!stme == "") {
            var d = kendo.parseDate(stme, "HH:mm");
            if (d == null) {
                showNoti_.error('Sent Time is NOT a valid.', false);
                $('#ace_sentTime').focus();
                return false;
            }
        }
        //Sent Time
        
        if (!self.CampaignTypeId()) {
            showNoti_.error('Campaign Type is required', false);
            $('#ace_cmpgtype').focus();
            return false;
        }

        if (!self.CAMPGPURPOSE()) {
            showNoti_.error('Campaign Purpose is Required!!', false);
            $('#ace_cmppurpose').focus();
            return false;
        }


        if (!self.MSGNO()) {
            showNoti_.error('Message # is Required!!', false);
            $('#ace_msgno').focus();
            return false;
        }

        if (!self.DAYSFROMEVENT()) {
            showNoti_.error('Message # is Required!!', false);
            $('#ace_daysfromevent').focus();
            return false;
        }

        if (!self.CallToActionId()) {
            showNoti_.error('Call-To-Action is required', false);
            $('#ace_calltoaction').focus();
            return false;
        }

        if (!self.MESSAGE()) {
            showNoti_.error('Message is Required!!', false);
            $('#ace_message').focus();
            return false;
        }

        //Now Save the Campaign Details...
        $.ajax({
            url: "/api/AceMain/SaveCampaign",
            type: 'POST',
            data: ko.toJSON(self),
            contentType: 'application/json',
            success: function (result) {
                if (!result.success)
                    showNoti_.error(result.message, false);
                else
                    self.ResetPartForm();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                showNoti_.error("There is some issue in saving Campaign Information.", true);
            }
        });

    }
    
    //Send the Email Now
    self.Send = function () {
        
        //Client side Validation 
        if (!self.CAMPGNAME()) {
            showNoti_.error('Campaign Name is Required!!', false);
            $('#ace_cmpname').focus();
            return false;
        }

        //Event Date
        var dte = $('#ace_eventdte').val();
        if (dte == "") {
            showNoti_.error('Event Date is required.', false);
            $('#ace_eventdte').focus();
            return false;
        }
        if (!dte == "") {
            var d = kendo.parseDate(dte, "MM/dd/yyyy");
            if (d == null) {
                showNoti_.error('Event Date is NOT a valid date.', false);
                $('#ace_eventdte').focus();
                return false;
            }
        }
        //Done for Event Date

        //Sent Time
        var stme = $('#ace_sentTime').val();
        if (stme == "") {
            showNoti_.error('Sent Time is required.', false);
            $('#ace_sentTime').focus();
            return false;
        }
        if (!stme == "") {
            var d = kendo.parseDate(stme, "HH:mm");
            if (d == null) {
                showNoti_.error('Sent Time is NOT a valid.', false);
                $('#ace_sentTime').focus();
                return false;
            }
        }
        //Sent Time

        if (!self.CampaignTypeId()) {
            showNoti_.error('Campaign Type is required', false);
            $('#ace_cmpgtype').focus();
            return false;
        }

        if (!self.CAMPGPURPOSE()) {
            showNoti_.error('Campaign Purpose is Required!!', false);
            $('#ace_cmppurpose').focus();
            return false;
        }


        if (!self.MSGNO()) {
            showNoti_.error('Message # is Required!!', false);
            $('#ace_msgno').focus();
            return false;
        }

        if (!self.DAYSFROMEVENT()) {
            showNoti_.error('Message # is Required!!', false);
            $('#ace_daysfromevent').focus();
            return false;
        }

        if (!self.CallToActionId()) {
            showNoti_.error('Call-To-Action is required', false);
            $('#ace_calltoaction').focus();
            return false;
        }

        if (!self.MESSAGE()) {
            showNoti_.error('Message is Required!!', false);
            $('#ace_message').focus();
            return false;
        }
                
        //Now Save the Campaign Details...
        $.ajax({
            url: "/api/AceMain/SaveCampaign",
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
                showNoti_.error("There is some issue in saving Campaign Information.", true);
            }
        });
        
    }
    
}

function ng_createCampaignCtrl($scope, $http) {
    angular.element(document).ready(function () {

        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        createCampaignF = new createCampaignF_viewModel();
        ko.applyBindings(createCampaignF, document.getElementById("campaignMainDiv"));
      

        //Below section is for collapsible panels > (Right) and Down arrow show and hide options
        $('#collapseOne').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createCampaignF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-right");
        })

        $('#collapseOne').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createCampaignF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseTwo').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createCampaignF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseTwo').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createCampaignF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseThree').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createCampaignF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseThree').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createCampaignF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseFour').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            createCampaignF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseFour').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            createCampaignF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        //Converto to ckEditor...
        $('#ace_message').ckeditor();
                
        //var editorN = $('#ace_message').ckeditor().editor;

        //editorN.addCommand('fastimage', new CKEDITOR.dialogCommand('fastimage'));

        //editorN.ui.addButton('fastimage', {
        //    label: 'Fast Image Upload',
        //    command: 'fastimage',
        //    toolbar: 'insert'
        //});



        //This is for Attachment File Upload...
        $('#fileupload_ace').fileupload(
            {
                url: '/ACE/Home/UploadEmailDocument',
                dataType: 'json',
                pasteZone: null,
                success: function (data) {
                    //console.log(data);
                    if (data.success) {
                        createCampaignF.FILENAME(data.orgfilename);
                        createCampaignF.FILENAMES(data.serverfilename);
                    }
                    else {
                        showNoti_.error(data.message, true);
                    }
                }
            });



    });
};