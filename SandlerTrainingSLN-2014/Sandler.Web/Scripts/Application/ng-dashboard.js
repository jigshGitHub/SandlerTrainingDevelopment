
function showOppDetails(e) {
    e.preventDefault();
    var dataItem = $("#myPipelineListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    // console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/CRM/Pipeline/Manage?id=" + dataItem.UniqueID;
    showModal_.html(path, null, '95%');
}
function archiveOpportunity(e) {
    e.preventDefault();
    var dataItem = $("#myPipelineListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    console.log(dataItem);
    //Let us block the Div while we wait for User response
    $('#dashboard_body').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this opportunity - " + dataItem.OpportunityName + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/PipelineArchive",
                  type: 'GET',
                  data: { id: dataItem.UniqueID, isActive: false },
                  contentType: 'application/json',
                  success: function (response) {
                      showNoti_.hide();
                      LoadmyOpportunityListGrid();
                      $("#dashboard_body").unblock();
                  },
                  error: function (response, errorText) {
                      showNoti_.error('Unable to archive opportunity, server error occures.', true);
                  }
              });
          },
          function () {
              //user said no
              showNoti_.hide();
              $("#dashboard_body").unblock();
          });//confirm ends here

}

function showTaskDetails(e) {
    e.preventDefault();
    var dataItem = $("#myTaskListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //console.log(dataItem);
    // console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/MyDay/Home/ViewMyTask?id=" + dataItem.UniqueID + "%26Loc=";
    showModal_.html(path, null, '45%');
}
function archiveTaskD(e) {
    e.preventDefault();
    var dataItem = $("#myTaskListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    console.log(dataItem);
    //Let us block the Div while we wait for User response
    $('#dashboard_body').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Task - " + dataItem.Topic + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/MyTask/ArchiveDTask",
                  type: 'POST',
                  data: ko.toJSON(dataItem),
                  contentType: 'application/json',
                  success: function (result) {
                      if (!result.success) {
                          showNoti_.error(result.message, true);
                          $("#dashboard_body").unblock();
                      }
                      else {
                          showNoti_.hide();
                          LoadmyAppointmentListGrid();
                          LoadmyTaskListGrid();
                          $("#dashboard_body").unblock();
                      }
                  },
                  error: function (xhr, ajaxOptions, thrownError) {
                      showNoti_.error("There is some issue in Archiving the Task. Please try again later.", true);
                      $("#dashboard_body").unblock();
                  }
              });
          },
          function () {
              //user said no
              showNoti_.hide();
              $("#dashboard_body").unblock();
          });//confirm ends here
}

function showDDetails(e) {
    e.preventDefault();
    var dataItem = $("#myAppointmentListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    console.log(dataItem);
    // console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/MyDay/Home/ViewMyTask?id=" + dataItem.UniqueID + "%26Loc=";
    showModal_.html(path, null, '45%');
}
function archiveTaskDD(e) {
    e.preventDefault();
    var dataItem = $("#myAppointmentListgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    console.log(dataItem);
    //Let us block the Div while we wait for User response
    $('#dashboard_body').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Task - " + dataItem.Topic + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/MyTask/ArchiveDTask",
                  type: 'POST',
                  data: ko.toJSON(dataItem),
                  contentType: 'application/json',
                  success: function (result) {
                      if (!result.success) {
                          showNoti_.error(result.message, true);
                          $("#dashboard_body").unblock();
                      }
                      else {
                          showNoti_.hide();
                          LoadmyAppointmentListGrid();
                          LoadmyTaskListGrid();
                          $("#dashboard_body").unblock();
                      }
                  },
                  error: function (xhr, ajaxOptions, thrownError) {
                      showNoti_.error("There is some issue in Archiving the Task. Please try again later.", true);
                      $("#dashboard_body").unblock();
                  }
              });
          },
          function () {
              //user said no
              showNoti_.hide();
              $("#dashboard_body").unblock();
          });//confirm ends here
}

function LoadmyTaskListGrid() {
    var myTaskList = get_taskListData();
    $("#myTaskListgrid").kendoGrid(myTaskList);
}
function LoadmyAppointmentListGrid() {
    var myAppointmentList = get_AppointmentListData();
    $("#myAppointmentListgrid").kendoGrid(myAppointmentList);
}
function LoadmyOpportunityListGrid() {
    var myOpportunityList = get_OpportunityListData();
    $("#myPipelineListgrid").kendoGrid(myOpportunityList);
}

function get_OpportunityListData() {
    var dataSource = get_OpportunityListDataSource()

    var OpportunityListData = {
        dataSource: dataSource,
        height: 300,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showOppDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                            { template: "&nbsp;<button title='Archive Opportunity' class='btn btn-warning btn-sm deletesa' onclick='archiveOpportunity(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "100px"
            },
            { field: "CompanyName", title: "Company Name", width: 130, attributes: { "class": "sptablecell" } },
            { field: "OpportunityName", title: "Opportunity Name", width: 130, attributes: { "class": "sptablecell" } },
            { field: "Status", title: "Status", width: 130, attributes: { "class": "sptablecell" } },
            { field: "ActionStep", title: "Action Step", width: 130, attributes: { "class": "sptablecell" } },
            { field: "NEXT_CONTACT_DATE", title: "Next Contact Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
            { field: "VALUE", title: "Value", width: 130, format: "{0:C2}", attributes: { "class": "sptablecell" } },            
            { field: "CloseDate", title: "Close Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } }

        ]
    }
    return OpportunityListData;

}
function get_OpportunityListDataSource() {

    var opportunitydataSource =
          {
              type: "json",
              transport: {
                  read: {
                      url: "api/MyOpportunityListView/",
                      dataType: "json",
                      cache: false
                  }
              },
              schema: {
                  data: "results",
                  total: "__count",
                  model: {
                      fields: {
                          CompanyName: { type: 'string' },
                          OpportunityName: { type: 'string' },
                          Status: { type: 'string' },
                          ActionStep: { type: 'string' },
                          NEXT_CONTACT_DATE: { type: 'date' },
                          VALUE: { type: 'number' },
                          CloseDate: { type: 'date' }

                      }
                  }
              },
              pageSize: 5,
              serverPaging: true,
              serverFiltering: true,
              serverSorting: true

          };
    return opportunitydataSource;
}

function get_AppointmentListData() {
    var dataSource = get_AppointmentListDataSource()

    var AppointmentListData = {
        dataSource: dataSource,
        height: 300,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showDDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                            { template: "&nbsp;<button title='Archive Opportunity' class='btn btn-warning btn-sm deletesa' onclick='archiveTaskDD(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "100px"
            },


        { field: "Topic", title: "Topic", width: 90, attributes: { "class": "sptablecell" } },
        { field: "Description", title: "Description", width: 120, attributes: { "class": "sptablecell" } },
        { field: "Phone", title: "Phone", width: 90, attributes: { "class": "sptablecell" } },
        { field: "StartTime", title: "Start Time", width: 90, format: "{0:hh:mm tt}", attributes: { "class": "sptablecell" } }
            
        ]
    }
    return AppointmentListData;

}
function get_AppointmentListDataSource() {

    var appointmentdataSource =
          {
              type: "json",
              transport: {
                  read: {
                      url: "api/MyAppointmentsListView/",
                      dataType: "json",
                      cache: false
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
              pageSize: 5,
              serverPaging: true,
              serverFiltering: true,
              serverSorting: true

          };
    return appointmentdataSource;
}

function get_taskListData() {
    var dataSource = get_DataSource()

    var TaskListData = {
        dataSource: dataSource,
        height: 300,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,        
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [                          
            	
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showTaskDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                            { template: "&nbsp;<button title='Archive Opportunity' class='btn btn-warning btn-sm deletesa' onclick='archiveTaskD(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "100px"
            },

			{ field: "Topic", title: "Topic", width: 120, attributes: { "class": "sptablecell" } },
            { field: "Description", title: "Description", width: 120, attributes: { "class": "sptablecell" } },
            { field: "FollowUpDate", title: "Follow up Date", width: 120, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
			{ field: "Phone", title: "Phone", width: 90, attributes: { "class": "sptablecell" } }
			
        ]
    }
    return TaskListData;

}
function get_DataSource() {

    var dataSource =
          {
              type: "json",
              transport: {
                  read: {
                      url: "api/MytasksListView/",
                      dataType: "json",
                      cache: false
                  }
              },
              schema: {
                  data: "results",
                  total: "__count",
                  model: {                      
                      fields: {
                                								
						Topic: { type: 'string' },
                        Description: { type: 'string' },
                        FollowUpDate: { type: 'date' },
						Phone: { type: 'string' },
                    }
                  }
              },
              pageSize: 5,
              serverPaging: true,
              serverFiltering: true,
              serverSorting: true

          };
    return dataSource;
}

function ng_dashboardCtrl($scope, $http) {
    angular.element(document).ready(function () {
        //console.log("start here");
        LoadmyOpportunityListGrid();
        LoadmyTaskListGrid();
        LoadmyAppointmentListGrid();
        //console.log("finish here");
    });

};