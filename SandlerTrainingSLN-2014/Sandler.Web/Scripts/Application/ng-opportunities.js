

function showDetails(e) {
    e.preventDefault();
    var dataItem = $("#OpportunitiesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
   // console.log(dataItem);
    var path = "navi?url=/CRM/Opportunities/Edit?id=" + dataItem.COMPANIESID;
    showModal_.html(path, null, '95%');
}



function ng_opportunitiesCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        var opportunitiesSearchgrid = $("#opportunitiesSearchgrid").kendoGrid(kendoGridData);

        $('#companiesSelection').kendoDropDownList(get_kendoCompaniesData());
        showNoti_.hide();

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

        //To do
        //Remove sorting for TotalCompanyValue
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
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                        ],
                        title: " ", width: "20px"
                    },
                    { field: "ID", title: "ID", width: "80px" },
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
            console.log('selected company' + companySelectedId);
            if (companySelectedId) {
                opportunitiesSearchgrid.data("kendoGrid").dataSource.filter({ field: "COMPANIESID", operator: "eq", value: parseInt(companySelectedId) });
            } else {
                opportunitiesSearchgrid.data("kendoGrid").dataSource.filter({});
            }
        };
        
        
    });

};