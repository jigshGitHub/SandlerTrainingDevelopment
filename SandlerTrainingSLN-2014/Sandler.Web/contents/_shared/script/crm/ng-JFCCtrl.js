
// Key pressed at Searchbox -> Search Button Click
function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearchDistribution").click();
    }
}


//Kendo Data Source
function get_gridDataSource(searchText) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "crm/JFC/SearchDistributions",
                dataType: "json",
                data: { searchText: searchText }
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    DISTRIBID: { type: "number" },
                    DISTRIBNO: { type: "string" },
                    DISTRIBDTE: { type: "date" },
                    FUNDCODE: { type: "string" },
                    STATUS: { type: "string" },
                    TOTALNO: { type: "number" },
                    TOTALAMT: { type: "number" }
                }
            }
        },
        pageSize: 10,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}


//Kendo Grid Data
function get_kendoGridData(searchText) {
    var dataSource = get_gridDataSource(searchText)
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
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        toolbar: [
            {
                name: "add",
                text: "Add",
                className: "k-grid-add addsa",
                imageClass: "k-icon ob-only-icon k-add"
            }
        ],
        columns: [
                {
                    command: [
                        { template: "<button class='btn btn-success btn-sm ' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                        { template: "&nbsp;<button class='btn btn-danger btn-sm deletesa' onclick='deleteDist(event)'><span class='glyphicon glyphicon-remove'></span></button>"}
                    ],
                    title: " ", width: "70px"
                },
                { field: 'DISTRIBID', filterable: false, title: 'Distribution ID', width: 120 },
                { field: 'DISTRIBNO', title: 'Distribution No', width: 120 },
                { field: 'DISTRIBDTE', title: 'Distribution Date', width: 120, format: "{0:MM/dd/yy}" },
                { field: 'FUNDCODE', title: 'Fund Code', width: 120 },
                { field: 'TOTALNO', title: 'Total #', width: 120 },
                { field: 'TOTALAMT', title: 'Total Amount', width: 120, format: "{0:C0}" },
                { field: 'STATUS', title: 'Status', width: 200 }
        ]
    }
    return kendoGridData;
}

//View
function showDetails(e) {
    e.preventDefault();
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    var dataItem = $("#distributionsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    $('#dvModalBody_pSearch').children().remove();

    // View Window 
    var path = "navi?url=/crm/JFC/DistributionEdit/" + dataItem.DISTRIBID;

    if (dataItem.STATUS == "Pending") {
        // Edit Window
        path = "navi?url=/crm/JFC/DistributionEdit/" + dataItem.DISTRIBID;
    }

    showModal_.html(path, null, '70%');

}


// Delete 
function deleteDist(e) {
    e.preventDefault();
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    var dataItem = $("#distributionsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));

    //$('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Delete this Transaction?",
              function () {
                  showNoti_.progress(NOTIFICMSG.DELETING, false);

                  if (dataItem.STATUS == "Pending") {
                      //Proceed with the Delete as user said Yes - No will be handled automatically
                      $.ajax({
                          url: "crm/api/Distribution/Delete",
                          type: 'POST',
                          data: ko.toJSON(dataItem),
                          contentType: 'application/json',
                          success: function (result) {
                              if (!result.success) {
                                  showNoti_.error(result.message, true);
                                  //$("#content").unblock();
                              }
                              else {
                                  showNoti_.hide();
                                  $("#btnSearch").click();
                                  //$("#content").unblock();
                              }
                          },
                          error: function (xhr, ajaxOptions, thrownError) {
                              showNoti_.error("There is some issue in Deleting the Transaction.", true);
                              //$("#content").unblock();
                          }
                      });
                  }
                  else {
                      showNoti_.error("Only Pending Distributions can be deleted.", true);
                  }


              },
          function () {
              //user said no
              showNoti_.hide();
              //$("#content").unblock();
          });//confirm ends here

}


// Document Ready
//app_.controller('ng_JFCCtrl', ['$scope', '$http',
function ng_JFCCtrl($scope, $http) {

         angular.element(document).ready(function () {

             var kendoGridData = get_kendoGridData("");
             $("#distributionsSearchgrid").kendoGrid(kendoGridData);

             // When Search Button is clicked 
             $("#btnSearchDistribution").click(function () {
                 var searchText = $("#searchBoxDistribution").attr('value');
                 var grid = $("#distributionsSearchgrid").data("kendoGrid");
                 var dataSource = get_gridDataSource(searchText);
                 grid.dataSource.transport.options.read.data = { searchText: searchText };
                 grid.dataSource.page(1);
                 //grid.dataSource.read();
             });

             //Add New Receipts
             $('#distributionsSearchgrid').on('click', '.addsa', function (e) {
                 //e.preventDefault();
                 //var path = "navi?url=/crm/JFC/DistributionAdd"; // Add Window
                 //showModal_.html(path, null, '70%');
                 showNoti_.info("Create Distribution Advanced Search - Pending.", true);
             });


         });

     };
//]);