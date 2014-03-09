
function showFrDetails(e) {
    e.preventDefault();
    var dataItem = $("#FranchiseeSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //console.log(dataItem);
    var path = "navi?url=/CRM/HomeOffice/Edit?id=" + dataItem.ID;
    //alert("before Navi");
    showModal_.html(path, null, '95%');
}

function archiveFranchisee(e) {
    e.preventDefault();
    var dataItem = $("#FranchiseeSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Franchisee - " + dataItem.Name + "?",
          function () {
                  showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
                  //Proceed with the Archive 
                  $.ajax({
                      url: "api/Franchisee/Archive",
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
                              RefreshFrGrid();
                              $("#content").unblock();
                          }
                      },
                      error: function (xhr, ajaxOptions, thrownError) {
                          showNoti_.error("There is some issue in Archiving the Franchisee. Please try again later.", true);
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

function RefreshFrGrid() {
    $("#btnSearch").click();
}//end refresh grid function

function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

function onDataBound(arg) {
    
    //FranchiseeOwner

    //HomeOfficeAdmin
            
    //Selects all Archive Buttons
    $("#FranchiseeSearchgrid tbody tr .editsa").each(function () {
        var currentDataItem = $("#FranchiseeSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#SandlerRole").val() != "HomeOfficeAdmin") {
            $(this).remove();
        }
    })


    //Selects all Archive Buttons
    $("#FranchiseeSearchgrid tbody tr .deletesa").each(function () {
          var currentDataItem = $("#FranchiseeSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
          if ($("#SandlerRole").val() != "HomeOfficeAdmin") {
                $(this).remove();
            }
        })
    }

function get_kendoGridData(searchText, selectForExcel) {
    var dataSource = get_gridDataSource(searchText, selectForExcel)
    var kendoGridData;
    //Let us get Grid Data based on the Role
    if ($("#SandlerRole").val() != "HomeOfficeAdmin") {

        kendoGridData = {
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
                
                { field: "Name", title: "Franchise Name", width: 80 },
                { field: "LastName", title: "Last Name", width: 40 },
                { field: "FirstName", title: "First Name", width: 40 },
                { field: "WorkEmail", title: "Primary Office Email", width: 80 },
                { field: "OfficePhone", title: "Contact Number", width: 60 },
                { field: "LastUpdatedDate", title: "Last Updated", width: 40, format: "{0:MM/dd/yyyy}" }
                
            ]
        }

    }

    else {

        kendoGridData = {
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
                                { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showFrDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                                 { template: "&nbsp;<button title='Archive' class='btn btn-warning btn-sm deletesa' onclick='archiveFranchisee(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                    ],
                    title: " ", width: "35px"
                },
                { field: "Name", title: "Franchise Name", width: 80 },
                { field: "LastName", title: "Last Name", width: 40 },
                { field: "FirstName", title: "First Name", width: 40 },
                { field: "WorkEmail", title: "Primary Office Email", width: 80 },
                { field: "OfficePhone", title: "Contact Number", width: 60 },
                { field: "LastUpdatedDate", title: "Last Updated", width: 40, format: "{0:MM/dd/yyyy}" }
                
            ]
        }


    }

    return kendoGridData;
}

function get_gridDataSource(searchText, selectForExcel) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/FranchiseeView/",
                dataType: "json",
                data: { searchText: searchText , selectForExcel:false},
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Name: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    WorkEmail: { type: 'string' },
                    OfficePhone: { type: 'string' },
                    LastUpdatedDate: { type: "date" }
                    
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

function ng_franchiseesCtrl($scope, $http) {
    angular.element(document).ready(function () {

        //showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("", false);
        $("#FranchiseeSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#FranchiseeSearchgrid").data("kendoGrid");
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