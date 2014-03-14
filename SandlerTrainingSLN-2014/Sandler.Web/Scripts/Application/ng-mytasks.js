
var taskF;

function get_kendoGridData(selDte) {
    var dataSource = get_gridDataSource(selDte)
    var kendoGridData = {
        dataSource: dataSource,
        height: 280,
        filterable: false,
        sortable: true,
        resizable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            
            { field: "Topic", title: "Topic", width: 80, attributes: { "class": "sptablecell" } },
            { field: "Description", title: "Description", width: 80, attributes: { "class": "sptablecell" } },
            { field: "Phone", title: "Phone", width: 60, attributes: { "class": "sptablecell" } },
            { field: "StartTime", title: "Start Time", width: 60, format: "{0:hh:mm tt}", attributes: { "class": "sptablecell" } }
            
        ]
    }
    return kendoGridData;
}

function get_gridDataSource(selDte) {

    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/MyTasksView",
                dataType: "json",
                data: { selDte: selDte },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Topic: { type: 'string' },
                    Description: { type: 'string' },
                    Phone: { type: 'string' },
                    StartTime: { type: 'date' },
                    
                }
            }
        },
        pageSize: 20,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function scheduler_edit(e) {
        e.preventDefault();
        //@*get the date selected if the user - we will pass it only if it is add operation*@
        var selDte = kendo.toString(new Date(e.event.start), "d");
        //Now first update the Lable as per selected Date
        taskF.TaskLabel("To do List for : " + selDte);
        //Now bind the Kendo Grid
        var kendoGridData = get_kendoGridData(selDte);
        $("#MyTasksSearchgrid").kendoGrid(kendoGridData);
  }

 //Schedular Data Source
 function get_DataSource() {

     var dataSource =
           {
            type: "json",
            transport: {
                read: {
                    url: "/api/TasksView/",
                    dataType: "json"
                }
            },
            schema: {
                data: "results",
                model: {
                    id: "UniqueID",
                    fields: {
                        title: { from: "Topic", defaultValue: "No Title", type: "string" },
                        start: { type: "date", from: "TaskDate", format: "{0:MM/dd/yy hh:mm}" },
                        end: { type: "date", from: "NextDay", format: "{0:MM/dd/yy hh:mm}" }
                    }
                }
            }

        };
        return dataSource;
    }

//Schdular Defination
 function get_SchedularData() {
     var dataSource = get_DataSource()

        var SchedularData = {
            dataSource: dataSource,
            date: new Date(),
            height: 600,
            edit: scheduler_edit,
            editable: {
                destroy: false,
                resize: false
            },
            views: [
                { type: "month" }
            ]

        }
        return SchedularData;
 }

 function initialize_taskF() {

     var selDte = kendo.toString(new Date(taskF.FollowUpDatec()), "d");
     taskF.TaskLabel("To do List for : " + selDte);
     $("#MyTasksSearchgrid").html('');
     //Now bind the Kendo Grid
     var kendoGridData = get_kendoGridData(selDte);
     $("#MyTasksSearchgrid").kendoGrid(kendoGridData);
     //Rest values in Add Item window
     taskF.FollowUpDatec('');
     taskF.StartTimec('');
     taskF.Description('');
     taskF.Topic('');
     taskF.Phone('');
     taskF.dirtyFlag.reset();
     taskF.IsJustAdded(true);

 }

 //Tracking whether there is unsaved change(s). 
 ko.dirtyFlag_addtask = function (root, isInitiallyDirty) {

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

 /*Task Model*/
 function taskF_viewModel() {

     var self = this;

     //This is for TimePicker Max and Min time settings : 8 am to 6 pm
     self.minTime = new Date(1950, 0, 1, 8, 0, 0);
     self.maxTime = new Date(2049, 11, 31, 18, 0, 0);

     self.IsJustAdded = ko.observable(false);
     
     //Follow Up Date 
     self.FollowUpDatec = ko.observable().extend({ required: "" });
     self.FollowUpDate = ko.computed(function () {
         return dateUtil_.toNoTimeZone(self.FollowUpDatec());
     });

     self.StartTimec = ko.observable();
     self.StartTime = ko.computed(function () {
         return dateUtil_.toNoTimeZone(self.StartTimec());
     });
          
     self.Description = ko.observable().extend({ required: "" });
     self.Topic = ko.observable().extend({ required: "" });

     self.Phone = ko.observable();

     self.continueWithSave = function () {

         self.dirtyFlag.reset();
         $('#add_task').block({ message: null });
         dao_.save("/api/MyTask/Save", ko.toJSON(self),
             function (result) {
                 if (result.success)
                 {
                     //First clear the Calendar Control and then Rebind 
                     $("#scheduler").html('');
                     var SchedularData = get_SchedularData();
                     $("#scheduler").kendoScheduler(SchedularData);
                     //Take care of unblock
                     $("#add_task").unblock();
                     showNoti_.hide();
                     initialize_taskF();
                     
                 }
                 else {
                     $("#add_task").unblock();
                     showNoti_.hide();
                     showNoti_.error(result.message, false);
                 }
             },
             function () {
                 $("#add_task").unblock();
                 showNoti_.hide();
             });

     };



     //This is for to save Task item
     self.Save = function () {
         
         //For Last Contact Date
         var dte = $('#task_followUpdate').val();
         if (!dte == "") {
             var d = kendo.parseDate(dte, "MM/dd/yyyy");
             if (d == null) {
                 showNoti_.error('Follow-up Date is NOT a valid date.', false);
                 $('#task_followUpdate').focus();
                 return;
             }
         }
         else {

             showNoti_.error('Follow-up Date is required.', false);
             $('#task_followUpdate').focus();
             return;
         }

         if (!self.Topic()) {
             showNoti_.error('Topic is Required!!', false);
             $('#task_topic').focus();
             return;
         }

         if (!self.Description()) {
             showNoti_.error('Description is Required!!', false);
             $('#task_description').focus();
             return;
         }

         //Now Continue
         self.continueWithSave();
     };

     self.dirtyFlag = new ko.dirtyFlag_addtask(self);

     self.isDirty = ko.computed(function () {
         return self.dirtyFlag.isDirty()
     }, this);

     //This is Label for View Task Kendo Grid
     self.TaskLabel = ko.observable();

 }

function ng_mytasksCtrl($scope, $http) {
    angular.element(document).ready(function () {

        //Let us fill up the Schedular Data first
        var SchedularData = get_SchedularData();
        $("#scheduler").kendoScheduler(SchedularData);

        //Now bind the Client side model for Add New Follow-up Item
        taskF = new taskF_viewModel();
        ko.applyBindings(taskF, document.getElementById("add_task"));

    });

};