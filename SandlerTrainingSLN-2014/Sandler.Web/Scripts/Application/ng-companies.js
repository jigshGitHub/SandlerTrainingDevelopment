function ng_companiesCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        $("#CompaniesSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();


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
                    { field: "COMPANYNAME", title: "Company Name", width: "80px" },
                    { field: "IndustryTypeName", title: "Industry", width: "80px" },
                    { field: "ProductTypeName", title: "Product", width: "60px" },
                    { field: "Representative", title: "Sandler Rep Name", width: "60px" },
                    { field: "TotalCompanyValue", title: "Total Company Value", width: "50px" }

                ]
            }
            return kendoGridData;
        }

        function get_gridDataSource(searchText) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/CompanyView/",
                        dataType: "json",
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
                            TotalCompanyValue: { type: 'string' }
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

        function showDetails(e) {
            e.preventDefault();
            //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
            var dataItem = $("#CompaniesSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
            console.log(dataItem);
            //var path = "navi?url=/crm/Event/ManageEvent?eventId=" + dataItem.SPCEVNTID + "%26passThruParam=0"; @* Edit Window *@
            //showModal_.html(path, null, '95%');
        }
    });

};