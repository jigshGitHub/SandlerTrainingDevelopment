
function archivePG(e) {
    e.preventDefault();
    var dataItem = $("#PerformanceGoalsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    console.log(dataItem.Id);
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Goal for - " + dataItem.UserName + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/Company/ArchivePG",
                  type: 'POST',
                  data: ko.toJSON(dataItem),
                  contentType: 'application/json',
                  success: function (result) {
                      if (!result.success) {
                          showNoti_.error(result.message, true);
                          $("#content").unblock();
                      }
                      else {
                          showNoti_.hide();
                          RefreshGrid();
                          $("#content").unblock();
                      }
                  },
                  error: function (xhr, ajaxOptions, thrownError) {
                      showNoti_.error("There is some issue in Archiving the Performance Goal. Please try again later.", true);
                      $("#content").unblock();
                  }
              });
          },
          function () {
              //user said no
              showNoti_.hide();
              $("#content").unblock();
          });//confirm ends here

}


function showGoalDetails(e) {
    e.preventDefault();
    var dataItem = $("#PerformanceGoalsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/RDL/Home/EditPG?id=" + dataItem.Id;
    //alert("before Navi");
    showModal_.html(path, null, '45%');
}


function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}


function RefreshGrid() {
    $("#btnSearch").click();
}//end refresh grid function


function onDataBound(arg) {

    //Selects all Archive Buttons
    $("#PerformanceGoalsSearchgrid tbody tr .deletesa").each(function () {
        var currentDataItem = $("#PerformanceGoalsSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#SandlerRole").val() != "FranchiseeOwner") {
            $(this).remove();
        }
    })
}

//To do
//Remove sorting for TotalCompanyValue
function get_kendoGridData(searchText, selectForExcel) {
    var dataSource = get_gridDataSource(searchText, selectForExcel)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        dataBound: onDataBound,
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit Goal' class='btn btn-success btn-sm editsa' onclick='showGoalDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                             { template: "&nbsp;<button title='Archive Goal' class='btn btn-warning btn-sm deletesa' onclick='archivePG(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "65px"
            },
            { field: "UserName", title: "User Name", width: 80, attributes: { "class": "sptablecell" } },
            { field: "FirstName", title: "First Name", width: 80, attributes: { "class": "sptablecell" } },
            { field: "LastName", title: "Last Name", width: 80, attributes: { "class": "sptablecell" } },
            { field: "Year", title: "Year", width: 60, attributes: { "class": "sptablecell" } },
            { field: "MonthAsText", title: "Month", width: 80, attributes: { "class": "sptablecell" } },
            { field: "CallsGoal", title: "Calls", width: 40, attributes: { "class": "sptablecell" } },
            { field: "MeetingsGoal", title: "Meetings", width: 40, attributes: { "class": "sptablecell" } },
            { field: "SalesGoal", title: "Sales Value", width: 80, format: "{0:c2}", attributes: { "class": "sptablecell" } }

        ]
    }
    return kendoGridData;
}

function get_gridDataSource(searchText, selectForExcel) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/PerformanceGoalView/",
                dataType: "json",
                data: { searchText: searchText, selectForExcel: false },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    UserName: { type: 'string' },
                    FirstName: { type: 'string' },
                    LastName: { type: 'string' },
                    Year: { type: 'number' },
                    MonthAsText: { type: 'string' },
                    CallsGoal: { type: 'number' },
                    MeetingsGoal: { type: 'number' },
                    SalesGoal: { type: 'number' }

                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}




function ng_PerformanceGoalsCtrl($scope, $http) {
    angular.element(document).ready(function () {

        var kendoGridData = get_kendoGridData("", false);
        $("#PerformanceGoalsSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#PerformanceGoalsSearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText, false);
            grid.dataSource.transport.options.read.data = { searchText: searchText, selectForExcel: false };
            grid.dataSource.page(1);
        });

        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        //Hide any Pines Notify 
        showNoti_.hide();
        
        
    });

};