

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
            
            //{ field: "CompanyName", title: "Company Name", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "FullName", title: "Contact", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "Location", title: "Location", width: 130},
            //{ field: "HowManyAttended", title: "How Many Attended", width: 130, attributes: { "class": "sptablecell" }},
            //{ field: "Discussion", title: "Discussion", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "ContactDate", title: "Contact Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } }

        { field: "Topic", title: "Topic", width: 80, attributes: { "class": "sptablecell" } },
        { field: "Description", title: "Description", width: 80, attributes: { "class": "sptablecell" } },
        { field: "Phone", title: "Phone", width: 60, attributes: { "class": "sptablecell" } },
        { field: "StartTime", title: "Start Time", width: 60, format: "{0:hh:mm tt}", attributes: { "class": "sptablecell" } }
            
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
                          //CompanyName: { type: 'string' },
                          //FullName: { type: 'string' },
                          //Location: { type: 'string' },
                          //HowManyAttended: { type: 'string' },
                          //Discussion: { type: 'string' },
                          //ContactDate: { type: 'date' }

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
            //{ field: "CompanyName", title: "Company Name", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "Description", title: "Description", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "ActionStep", title: "Action Step", width: 130, attributes: { "class": "sptablecell" } },
            //{ field: "FollowUpDate", title: "FollowUpDate", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
            //{ field: "CompanyNextContactDate", title: "Company Next Contact Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
            //{ field: "ContactNextContactDate", title: "Contact Next Contact Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } }
			
			{ field: "Topic", title: "Topic", width: 80, attributes: { "class": "sptablecell" } },
            { field: "Description", title: "Description", width: 80, attributes: { "class": "sptablecell" } },
            { field: "FollowUpDate", title: "Follow up Date", width: 130, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
			{ field: "Phone", title: "Phone", width: 60, attributes: { "class": "sptablecell" } }
			
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
                                //CompanyName: { type: 'string' },
                                //Description: { type: 'string' },
                                //ActionStep: { type: 'string' },
                                //FollowUpDate: { type: 'date' }
                                //CompanyNextContactDate: { type: 'date' },
                                //ContactNextContactDate: { type: 'date' }
								
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
        LoadmyTaskListGrid();
        LoadmyAppointmentListGrid();
        LoadmyOpportunityListGrid();
    });

};