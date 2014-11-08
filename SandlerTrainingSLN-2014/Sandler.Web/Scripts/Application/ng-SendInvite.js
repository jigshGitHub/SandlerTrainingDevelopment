
var sendInviteF;
var mtgTypeData = jsonDataCaller.syncCall(baseUrl + "/api/GetMeetingTypeOptions", null);
var mtgFreqData = jsonDataCaller.syncCall(baseUrl + "/api/GetMeetingFrequencyTypes", null);
var usrgdata = jsonDataCaller.syncCall(baseUrl + "/api/GetUserEmailGroups", null);
var yesNoData = startModule.getYesNoOptions();

function UserGroup_viewModel(data, idx) {
    self = this;
    self.id = ko.observable(idx);
    self.Id = ko.observable(data.Id);
    self.name = ko.observable(data.GroupName);
    self.IsSelected = ko.observable(false);
}

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

function sendInviteF_viewModel() {
    var self = this;

    self.SUBJECT = ko.observable().extend({ required: "" });
    self.LOCATION = ko.observable().extend({ required: "" });
    self.RCPNTS = ko.observable();

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

    //This is for TimePicker Max and Min time settings : 8 am to 6 pm
    self.minTime = new Date(1950, 0, 1, 2, 0, 0);
    self.maxTime = new Date(2049, 11, 31, 23, 0, 0);

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
    };
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
    
    self.Duration = ko.observable();
    self.RecurrenceCount = ko.observable();
    self.MESSAGE = ko.observable().extend({ required: "" });

    //class=""

    //For Meeting Type
    self.TypeId = ko.observable();
    self.MTGTYPEDATA = ko.observableArray(mtgTypeData.results);

    //For Meeting Freq
    self.FreqId = ko.observable();
    self.MTGFREQDATA = ko.observableArray(mtgFreqData.results);

    //Start Date 
    self.STARTDTEc = ko.observable('').extend({ required: "" });
    self.STARTDTE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.STARTDTEc());
    });

    //End Date
    self.ENDDTEc = ko.observable('');
    self.ENDDTE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.ENDDTEc());
    });
    
    //For Event Start Time
    self.STARTTIMEc = ko.observable('');
    self.STARTTIME = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.STARTTIMEc());
    });

    //For Event End Time
    self.ENDTIMEc = ko.observable('');
    self.ENDTIME = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.ENDTIMEc());
    });

    self.IsEndRowVisible = ko.observable(true);
    self.yesNoData = ko.observableArray(yesNoData);
    self.IsRecurring = ko.observable();
    
    self.recOptionClass = ko.computed(function () {
        return (self.IsEndRowVisible() ? "col-md-12 no-margin" : "col-md-6 no-margin");
    });

    self.IsRecurring.subscribe(function (newValue) {
        if (newValue == 1) {
            self.IsEndRowVisible(false);
            $('#sinv_enddte').val('');
            $('#sinv_endtime').val('');
        }
        else {
            self.IsEndRowVisible(true);
            self.Duration("");
            self.RecurrenceCount("");
            self.FreqId("");
        }
    });
    
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

    self.ResetForm = function () {
        self.SUBJECT("");
        self.RCPNTS("");
        self.LOCATION("");
        self.Duration("");
        self.RecurrenceCount("");
        self.MESSAGE("");
        self.FILENAME("");
        self.FILENAMES("");
        self.TypeId("");
        self.FreqId("");
        self.IsRecurring("");
        //Start and End Date/Time
        $('#sinv_startdte').val('');
        $('#sinv_starttime').val('');
        $('#sinv_enddte').val('');
        $('#sinv_endtime').val('');
        //Own groups
        self.userEmailGroups.removeAll();
        self.ProcessUserEmailGroups();
        showNoti_.info("Meeting Invite Sent Successfully !!", false);
    };

    //Send the Email Now
    self.Send = function () {

        //Client side Validation 
        if (!self.SUBJECT()) {
            showNoti_.error('Meeting Subject is Required!!', false);
            $('#sinv_subject').focus();
            return;
        }
        //Client side Validation 
        if (!self.LOCATION()) {
            showNoti_.error('Location is Required!!', false);
            $('#sinv_lcn').focus();
            return;
        }
        //Message
        if (!self.MESSAGE()) {
            showNoti_.error('Message is Required!!', false);
            $('#sinv_message').focus();
            return;
        }
        //Start Date        
        var dte = $('#sinv_startdte').val();
        if (dte == "") {
            showNoti_.error('Start Date is required.', false);
            $('#sinv_startdte').focus();
            return;
        }
        if (!dte == "") {
            var d = kendo.parseDate(dte, "MM/dd/yyyy");
            if (d == null) {
                showNoti_.error('Start Date is NOT a valid date.', false);
                $('#sinv_startdte').focus();
                return;
            }
        }
        //Start Time
        var stme = $('#sinv_starttime').val();
        if (stme == "") {
            showNoti_.error('Start Time is required.', false);
            $('#sinv_starttime').focus();
            return;
        }
        if (!stme == "") {
            var d = kendo.parseDate(stme, "HH:mm");
            if (d == null) {
                showNoti_.error('Start Time is NOT a valid.', false);
                $('#sinv_starttime').focus();
                return;
            }
        }
        
        //Now Send Meeting Invite...
        $.ajax({
            url: "/api/Email/SendMeetingInviteNow",
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
                showNoti_.error("There is some issue in sending Meeting Invite.", true);
            }
        });
        
    };
        
}

function ng_SendInviteCtrl($scope, $http) {
    angular.element(document).ready(function () {
               
        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        /*Bind with the Model*/
        sendInviteF = new sendInviteF_viewModel();
        ko.applyBindings(sendInviteF, document.getElementById("sendInviteDiv"));

        //Below section is for collapsible panels > (Right) and Down arrow show and hide options
        $('#collapseOne').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendInviteF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-right");
        })

        $('#collapseOne').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendInviteF.Div1Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseTwo').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendInviteF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseTwo').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendInviteF.Div2Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseThree').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendInviteF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseThree').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendInviteF.Div3Hideshow("pull-right glyphicon glyphicon-chevron-down");
        });

        $('#collapseFour').on('hidden.bs.collapse', function () {
            //Right Arrow as we are closing
            sendInviteF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-right");
        });

        $('#collapseFour').on('show.bs.collapse', function () {
            //Down Arrow as we are showing
            sendInviteF.Div4Hideshow("pull-right glyphicon glyphicon-chevron-down");
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
                        sendInviteF.FILENAME(data.orgfilename);
                        sendInviteF.FILENAMES(data.serverfilename);
                    }
                    else {
                        showNoti_.error(data.message, true);
                    }
                }
            });
    });
    //console.log(begdata);
};