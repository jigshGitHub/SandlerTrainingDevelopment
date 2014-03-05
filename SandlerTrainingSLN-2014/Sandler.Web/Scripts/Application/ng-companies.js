
function showDetails(e) {
    e.preventDefault();
    var dataItem = $("#CompaniesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //console.log(dataItem);
    var path = "navi?url=/CRM/Companies/Edit?id=" + dataItem.COMPANIESID;
    //alert("before Navi");
    showModal_.html(path, null, '95%');
}

function archiveCompany(e) {
    e.preventDefault();
    var dataItem = $("#CompaniesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Company - " + dataItem.COMPANYNAME + "?",
          function () {
                  showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
                  //Proceed with the Archive 
                  $.ajax({
                      url: "api/Company/Archive",
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
                          showNoti_.error("There is some issue in Archiving the Company. Please try again later.", true);
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

function RefreshGrid() {
    $("#btnSearch").click();
}//end refresh grid function


function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

function onDataBound(arg) {
        
      //Selects all Archive Buttons
      $("#CompaniesSearchgrid tbody tr .deletesa").each(function () {
          var currentDataItem = $("#CompaniesSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
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
                            { template: "<button title='View/Edit Company' class='btn btn-success btn-sm editsa' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                             { template: "&nbsp;<button title='Archive Company' class='btn btn-danger btn-sm deletesa' onclick='archiveCompany(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "COMPANYNAME", title: "Company Name", width: 80 },
            { field: "IndustryTypeName", title: "Industry", width: 80 },
            { field: "ProductTypeName", title: "Product", width: 60 },
            { field: "Representative", title: "Sandler Rep Name", width: 60 },
            { field: "TotalCompanyValue", title: "Total Company Value", width: 80, format: "{0:c2}" }

        ]
    }
    return kendoGridData;
}

function get_gridDataSource(searchText, selectForExcel) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/CompanyView/",
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
                    COMPANYNAME: { type: 'string' },
                    IndustryTypeName: { type: 'string' },
                    ProductTypeName: { type: 'string' },
                    Representative: { type: 'string' },
                    TotalCompanyValue: { type: 'number' }
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

function ng_companiesCtrl($scope, $http) {
    angular.element(document).ready(function () {

        //showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("", false);
        $("#CompaniesSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#CompaniesSearchgrid").data("kendoGrid");
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