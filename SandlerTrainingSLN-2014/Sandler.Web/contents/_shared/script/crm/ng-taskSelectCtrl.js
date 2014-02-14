/* [[[ Tasks Select ]]] - BT */

/* Kendo Grid Data Source */
    function get_gridDataSourceTK(uidBy, uidFor, IsDueDate, COMPDTEFR, COMPDTETO, DUEDTEFR, DUEDTETO, IsIncludeAllCompTasks, IsIncludeAllOpenTasks, groupType) {

        var dataSourceTK = {
            type: "json",
            transport: {
                read: {
                    url: "crm/Task/GetTaskSearchResults",
                    dataType: "json",
                    data: { uidBy: uidBy, uidFor: uidFor, IsDueDate: IsDueDate, COMPDTEFR: COMPDTEFR, COMPDTETO: COMPDTETO, DUEDTEFR: DUEDTEFR, DUEDTETO: DUEDTETO, IsIncludeAllCompTasks: IsIncludeAllCompTasks, IsIncludeAllOpenTasks: IsIncludeAllOpenTasks, groupType: groupType },
                    cache: false //This is required othewise grid does not refresh after Edit operation in IE

                }
            },
            schema: {
                data: "results",
                total: "__count",
                model: {
                    fields: {

                        DUEBY: { type: 'date' },
                        SCHEDFOR: { type: 'string' },
                        TASKTYPE: { type: 'string' },
                        SUBJECT: { type: 'string' },
                        PID: { type: 'string' },
                        NAME: { type: 'string' },
                        CITY: { type: 'string' },
                        STATE: { type: 'string' },
                        HMPHN: { type: 'string' },
                        BSPHN: { type: 'string' },
                        CELL: { type: 'string' },
                        DONE: { type: 'boolean' },
                        DONEON: { type: 'date' },
                        SCHEDON: { type: 'date' },
                        SCHEDBY: { type: 'string' }

                    }
                }
            },
            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true
        };
        return dataSourceTK;
    }

/* Kendo Grid Data */
    function get_kendoGridDataTK(uidBy, uidFor, IsDueDate, COMPDTEFR, COMPDTETO, DUEDTEFR, DUEDTETO, IsIncludeAllCompTasks, IsIncludeAllOpenTasks, groupType) {

        //alert(_taskSearch);
        var dataSourceTK = get_gridDataSourceTK(uidBy, uidFor, IsDueDate, COMPDTEFR, COMPDTETO, DUEDTEFR, DUEDTETO, IsIncludeAllCompTasks, IsIncludeAllOpenTasks, groupType)
        var kendoGridDataTK = {
            dataSource: dataSourceTK,
            height: 480,
            filterable: false,
            sortable: true,
            pageable: {
                refresh: true,
                pageSizes: true
            },
            resizable: true,
            change: onChangeTK,
            dataBound: onDataBoundTK,
            columnMenu: true,
            scrollable: true,
            navigatable: true,
            selectable: "multiple,row",
            columns: [

                { field: 'DUEBY', title: 'Date', width: 150, format: "{0:MM/dd/yy}" },
                { field: 'SCHEDFOR', title: 'For', width: 160 },
                { field: 'TASKTYPE', title: 'Type', width: 145 },
                { field: 'SUBJECT', title: 'Subject', width: 185 },
                { field: 'PID', title: 'Id', width: 135 },
                { field: 'NAME', title: 'Name', width: 165 },
                { field: 'CITY', title: 'City', width: 145 },
                { field: 'STATE', title: 'State', width: 125 },
                { field: 'HMPHN', title: 'Home', width: 135 },
                { field: 'BSPHN', title: 'Work', width: 135 },
                { field: 'CELL', title: 'Cell', width: 135 },
                {
                    field: 'DONE', title: 'Done', width: 120,
                    template: '<input type=\'checkbox\' # if(DONE){ # checked #} # disabled=\'disabled\' class=\'chkbx\' />'
                },
                { field: 'DONEON', title: 'Done On', width: 150, format: "{0:MM/dd/yy}" },
                { field: 'SCHEDON', title: 'Sched On', width: 150, format: "{0:MM/dd/yy}" },
                { field: 'SCHEDBY', title: 'By', width: 180 }

            ]
        }
        return kendoGridDataTK;
    }

    function ReassignTaskTo() {
        /*First confirm with the user if they want to go ahead with Reassign Task To*/
        var dropdownlist = $("#reassign_list").data("kendoDropDownList");
        $('#content').block({ message: null });
        showNoti_.confirm("Are you sure to reassign selected task(s) to " + dropdownlist.text() + "?",
        function () {
            var grid = $("#grid_taskResults").data("kendoGrid");
            grid.select().each(function () {
                var dataItem = grid.dataItem($(this));
                $.post('@Url.Action("ReassignTask", "Task")', { actId: dataItem.ACTID, uid: dropdownlist.value() }, function (data) {
                    if (!data.success) {
                        showNoti_.Info(data.message, true);
                    }
                });

            });
            $("#content").unblock();
            /*Let us refresh the Kendo Grid*/
            PerformSearchTK();
            /*Let us set selected Index as 0 again*/
            dropdownlist.select(0);
            $("#reassign_list").data('kendoDropDownList').enable(false);
        },
        function () {
            //user said no
            $("#content").unblock();
        });//confirm ends here
    }

    function onSelectingUserTK(e) {
        var dataItem = this.dataItem(e.item.index());
        taskF.IsUserSelected(true);
    };

    function PerformSearchTK() {
        $('#content').block({ message: null });
        showNoti_.progress(NOTIFICMSG.SEARCHING, false);
        var IsCanBeDone = jsonDataCaller.syncCall("/crm/Task/TaskCanBeSearched", ko.toJSON(taskF), 'POST');
        if (IsCanBeDone.success) {

            $("#grid_taskResults").empty();
            var kendoGridDataTK = get_kendoGridDataTK(IsCanBeDone.uidBy, IsCanBeDone.uidFor, IsCanBeDone.IsDueDate, kendo.toString(new Date(kendo.parseDate(IsCanBeDone.COMPDTEFR)), "d"), kendo.toString(new Date(kendo.parseDate(IsCanBeDone.COMPDTETO)), "d"), kendo.toString(new Date(kendo.parseDate(IsCanBeDone.DUEDTEFR)), "d"), kendo.toString(new Date(kendo.parseDate(IsCanBeDone.DUEDTETO)), "d"), IsCanBeDone.IsIncludeAllCompTasks, IsCanBeDone.IsIncludeAllOpenTasks, IsCanBeDone.groupType);
            $("#grid_taskResults").kendoGrid(kendoGridDataTK);
            $("#content").unblock();
            showNoti_.hide();
        }
        else {
            //Some issue in validation
            if (IsCanBeDone.returneddata != null) {
                $("#" + IsCanBeDone.returneddata + "").show();
                $("#" + IsCanBeDone.returneddata + "Div").show();
            }
            $("#content").unblock();
            showNoti_.error(IsCanBeDone.message, true);
        }
    }

    function PopulateReassignList() {

        /*Reassing Task - Get Users List*/
        var reassignList = jsonDataCaller.syncCall("/crm/api/Task/ReassignList", { groupType: $("#pageData1Value").val() });
        $("#reassign_list").kendoDropDownList({
            dataTextField: "name",
            dataValueField: "ssusruid",
            select: onSelectingUserTK,
            dataSource: reassignList
        });
    }

    function onChangeTK(arg) {
        /*Enable Open Donor and Open Task buttons*/
        taskF.IsEnable(true);
        $("#reassign_list").data('kendoDropDownList').enable(true);
    }

    function onDataBoundTK(arg) {
        /*Disable Open Donor and Open Task buttons as we have just bounded the grid*/
        taskF.IsEnable(false);
        taskF.IsUserSelected(false);
        $("#reassign_list").data('kendoDropDownList').enable(false);
    }

    function OpenNaviTK(d) {

        var grid = $("#grid_taskResults").data("kendoGrid");
        grid.select().each(function () {
            var dataItem = grid.dataItem($(this));
            if (d == "people") {
                //var path = "navi?url=/crm/People/Open/" + dataItem.PID;    /* Open New Window */
                var path = "navi?url=/crm/People/Open?id=" + dataItem.PID + "%26tab=Task";
                showModal_.html(path, null, '95%');
            }
            if (d == "task") {
                var path = "navi?url=/crm/People/OpenTask?pid=" + +dataItem.PID + "%26ACTID=" + dataItem.ACTID;    /* Open New Window */
                showModal_.html(path, null, '95%');
            }
            //OpenTask(string udlo, int? pid, int? ACTID)
        });
    }


/* View Model - Task */
    var taskF;

    /*Tracking whether there is unsaved change(s). */
    ko.dirtyFlag_event = function (root, isInitiallyDirty) {

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

    function scheduleBy_viewModel(data, idx) {
        self = this;
        self.id = ko.observable(idx);
        self.uid = ko.observable(data ? data.uid : 0);
        self.name = ko.observable(data ? data.name : '');
        self.userid = ko.observable(data ? data.userid : '');
        self.IsSelected = ko.observable(data ? data.selected : false)
    }

    function scheduleFor_viewModel(data, idx) {
        self = this;
        self.id = ko.observable(idx);
        self.uid = ko.observable(data ? data.uid : 0);
        self.name = ko.observable(data ? data.name : '');
        self.name2 = ko.observable(data ? data.name : '');
        self.userid = ko.observable(data ? data.userid : '');
        self.IsSelected = ko.observable(data ? data.selected : false)
    }

    /*Task Model*/
    function taskF_viewModel(schByData, schForData) {

        var self = this;
        self.scheduleByUsers = ko.observableArray([]);
        self.scheduleForUsers = ko.observableArray([]);
        self.reassignToUsers = ko.observableArray([]);
        self.groupType = ko.observable($("#pageData1Value").val());
        self.IsEnable = ko.observable();//False will be set with Databound. True will be set when user selects the row
        self.IsUserSelected = ko.observable(false);

        /*For Schedule By Table List*/
        var i = 0;
        ko.utils.arrayForEach(schByData, function (scheduleByUser) {
            var scheduleByUser_ = new scheduleBy_viewModel(scheduleByUser, i);
            self.scheduleByUsers.push(scheduleByUser_);
            i += 1;
        });
        self.IsAllSelectedBy = ko.computed({
            read: function () {
                var isAllSelected = true;
                ko.utils.arrayForEach(self.scheduleByUsers(), function (item) {
                    isAllSelected = isAllSelected && item.IsSelected()
                });
                return isAllSelected;
            },
            write: function (value) {
                ko.utils.arrayForEach(self.scheduleByUsers(), function (item) {
                    if (value) item.IsSelected(true);
                    else item.IsSelected(false);
                });
            }
        });

        /*For Schedule For Table List*/
        var p = 0;
        ko.utils.arrayForEach(schForData, function (scheduleForUser) {
            var scheduleForUser_ = new scheduleFor_viewModel(scheduleForUser, p);
            self.scheduleForUsers.push(scheduleForUser_);
            p += 1;
        });
        self.IsAllSelectedFor = ko.computed({
            read: function () {
                var isAllSelected = true;
                ko.utils.arrayForEach(self.scheduleForUsers(), function (item) {
                    isAllSelected = isAllSelected && item.IsSelected()
                });
                return isAllSelected;
            },
            write: function (value) {
                ko.utils.arrayForEach(self.scheduleForUsers(), function (item) {
                    if (value) item.IsSelected(true);
                    else item.IsSelected(false);
                });
            }
        });

        /*For Step 3 : Due Date or Completed Date selection*/
        self.IsDueDate = ko.observable(true);
        self.IsIncludeAllDueDates = ko.observable(true);
        self.IsIncludeAllCompDates = ko.observable(false);

        self.IsIncludeAllOpenTasks = ko.observable(true);
        self.IsIncludeAllCompTasks = ko.observable(false);

        self.DUEDTEFR = ko.observable();
        self.DUEDTETO = ko.observable();
        self.COMPDTEFR = ko.observable();
        self.COMPDTETO = ko.observable();

        self.IsDueDate.ForEditing = ko.computed({
            read: function () {
                return this.IsDueDate().toString();
            },
            write: function (newValue) {
                this.IsDueDate(newValue === "true");
            },
            owner: this
        });

        self.ShowCompletedDate = ko.computed(function () {
            return self.IsDueDate() == true ? false : true;
        });

        self.ShowDueDate = ko.computed(function () {
            return self.IsDueDate() == true ? true : false;
        });

        self.ManageDueDateFromTo = ko.computed(function () {
            var datepickerDFrom = $("#duedate_from").data("kendoDatePicker");
            var datepickerDTo = $("#duedate_to").data("kendoDatePicker");
            var datepickerCFrom = $("#compdate_from").data("kendoDatePicker");
            var datepickerCTo = $("#compdate_to").data("kendoDatePicker");
            /*For Due Date From and To*/
            if (self.IsIncludeAllDueDates()) {
                datepickerDFrom.enable(false);
                datepickerDTo.enable(false);
                datepickerDFrom.value(null);
                datepickerDTo.value(null);
                self.IsIncludeAllCompDates(false);
                datepickerCFrom.value(null);
                datepickerCTo.value(null);
                self.DUEDTEFR(null);
                self.DUEDTETO(null);
                self.COMPDTEFR(null);
                self.COMPDTETO(null);

            }
        else {
                datepickerDFrom.enable(true);
            datepickerDTo.enable(true);
            datepickerCFrom.value(null);
            datepickerCTo.value(null);
            self.COMPDTEFR(null);
            self.COMPDTETO(null);
        }

        }, this);

    self.ManageCompDateFromTo = ko.computed(function () {
        var datepickerDFrom = $("#duedate_from").data("kendoDatePicker");
        var datepickerDTo = $("#duedate_to").data("kendoDatePicker");
        var datepickerCFrom = $("#compdate_from").data("kendoDatePicker");
        var datepickerCTo = $("#compdate_to").data("kendoDatePicker");

        if (self.IsIncludeAllCompDates()) {
            datepickerCFrom.enable(false);
            datepickerCTo.enable(false);
            datepickerCFrom.value(null);
            datepickerCTo.value(null);
            self.IsIncludeAllDueDates(false);
            datepickerDFrom.value(null);
            datepickerDTo.value(null);
            self.DUEDTEFR(null);
            self.DUEDTETO(null);
            self.COMPDTEFR(null);
            self.COMPDTETO(null);
        }
        else {
            datepickerCFrom.enable(true);
            datepickerCTo.enable(true);
            datepickerDFrom.value(null);
            datepickerDTo.value(null);
            self.DUEDTEFR(null);
            self.DUEDTETO(null);
        }
    }, this);

    self.dirtyFlag = new ko.dirtyFlag_event(self);

    self.isDirty = ko.computed(function () {
        return self.dirtyFlag.isDirty()
    }, this);

    }

    //We need the same name as the Controller Name
    function ng_taskSelectCtrl($scope, $http) {
                        
            angular.element(document).ready(function () {
                
                /*For Accordion*/
                $("#taskaccordion").accordion({
                    collapsible: true, heightStyle: "content"
                });

                /*We need this then the checkbox enable/disable will work*/
                $("#duedate_from").kendoDatePicker().attr("id");
                $("#duedate_to").kendoDatePicker().attr("id");
                $("#compdate_from").kendoDatePicker().attr("id");
                $("#compdate_to").kendoDatePicker().attr("id");

                /*Get Data*/
                var schByData;
                var schForData;

                schByData = jsonDataCaller.syncCall("/crm/api/Task/ScheduleBy", null);
                schForData = jsonDataCaller.syncCall("/crm/api/Task/ScheduleFor", { groupType: $("#pageData1Value").val() });

                /*Bind with the Model*/
                taskF = new taskF_viewModel(schByData, schForData);
                ko.applyBindings(taskF, document.getElementById("task_body"));

                PopulateReassignList();
                $("#reassign_list").data('kendoDropDownList').enable(false);

                //Link for Bootstrap : http://stackoverflow.com/questions/17241817/bootstrap-horizontal-alignment-of-form-form-groups


            });

        };

//console.log('I was run - Task');