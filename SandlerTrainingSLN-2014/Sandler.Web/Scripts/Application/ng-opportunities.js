

function showDetails(e) {
    e.preventDefault();
    var dataItem = $("#opportunitiesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
   // console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/CRM/Pipeline/Manage?id=" + dataItem.ID;
    showModal_.html(path, null, '70%');
}

function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

function RefreshGrid() {
    $("#btnSearch").click();
}
function archiveOpportunity(e) {
    e.preventDefault();
    var dataItem = $("#opportunitiesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this opportunity - " + dataItem.NAME + "?",
          function () {
                  showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
                  //Proceed with the Archive 
                  $.ajax({
                      url: "api/PipelineArchive",
                      type: 'GET',
                      data: {id:dataItem.ID, isActive:false},
                      contentType: 'application/json',
                      success: function (response) {
                          showNoti_.hide();
                          RefreshGrid();
                          $("#content").unblock();
                      },
                      error: function (response, errorText) {
                          showNoti_.error('Unable to archive opportunity, server error occures.', true);
                      }
                  });
              },
          function () {
              //user said no
              showNoti_.hide();
              $("#content").unblock();
          });//confirm ends here

}
function ng_opportunitiesCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        var opportunitiesSearchgrid = $("#opportunitiesSearchgrid").kendoGrid(kendoGridData);

        $('#companiesSelection').kendoDropDownList(get_kendoCompaniesData());
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#opportunitiesSearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText);
            grid.dataSource.transport.options.read.data = { searchText: searchText };
            grid.dataSource.page(1);
        });

        function get_kendoCompaniesData() {
            var startModule = sandler.appStart.module;
            var data = startModule.getUserCompanies();
            var kendoDropDownData = {
                dataTextField: "name",
                dataValueField: "id",
                optionLabel: "All",
                dataSource: data,
                index: 0,
                change: companyOnChange
            };
            return kendoDropDownData;
        }

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
                columns: [
                    {
                        command: [
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                                    { template: "&nbsp;<button title='Archive Opportunity' class='btn btn-danger btn-sm deletesa' onclick='archiveOpportunity(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                        ],
                        title: " ", width: "35px"
                    },
                    { field: "ID", title: "ID", width: "30px" },
                    { field: "NAME", title: "Name", width: "80px" },
                    { field: "COMPANYNAME", title: "Company", width: "60px" },
                    { field: "VALUE", title: "Value", width: "60px" },
                    { field: "CLOSEDATE", title: "Close Date", width: "50px" },
                    { field: "SALESREP", title: "Sales Rep", width: "50px" },
                    { field: "Status", title: "Status", width: "50px" }

                ]
            }
            return kendoGridData;
        }

        function get_gridDataSource(searchText) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/PipelineView/",
                        dataType: "json",
                        data: { searchText: searchText },
                        cache: false //This is required othewise grid does not refresh after Edit operation in IE
                    }
                },
                schema: {
                    data: "results",
                    total: "__count",
                    model: {
                        fields: {
                            ID: { type: 'string' },
                            NAME: { type: 'string' },
                            COMPANYNAME: { type: 'string' },
                            VALUE: { type: 'string' },
                            CLOSEDATE: { type: 'string' },
                            SALESREP: { type: 'string' },
                            Status: { type: 'string' }
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

        function companyOnChange() {
            var companySelectedId = $("#companiesSelection").val();
            //console.log('selected company' + companySelectedId);
            if (companySelectedId) {
                opportunitiesSearchgrid.data("kendoGrid").dataSource.filter({ field: "COMPANIESID", operator: "eq", value: parseInt(companySelectedId) });
            } else {
                opportunitiesSearchgrid.data("kendoGrid").dataSource.filter({});
            }
        };        
        
    });

};