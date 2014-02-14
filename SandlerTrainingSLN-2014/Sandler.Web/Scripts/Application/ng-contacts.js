﻿function ng_contactsCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        $("#ContactsSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();


        //To do
        //Remove sorting for TotalCompanyValue
        //Set sorting for Representative 
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
                    { field: "FullName", title: "Name", width: "80px" },
                    { field: "Phone", title: "Phone", width: "80px" },
                    { field: "Email", title: "Email", width: "80px" },
                    { field: "COMPANYNAME", title: "Company", width: "60px" }
                ]
            }
            return kendoGridData;
        }

        function get_gridDataSource(searchText) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/ContactView/",
                        dataType: "json",
                        data: { companyId: '' },
                        cache: false //This is required othewise grid does not refresh after Edit operation in IE
                    }
                },
                schema: {
                    data: "results",
                    total: "__count",
                    model: {
                        fields: {
                            FullName: { type: 'string' },
                            Phone: { type: 'string' },
                            Email: { type: 'string' },
                            COMPANYNAME: { type: 'string' }
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
            var dataItem = $("#ContactsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
            console.log(dataItem);
            //var path = "navi?url=/crm/Event/ManageEvent?eventId=" + dataItem.SPCEVNTID + "%26passThruParam=0"; @* Edit Window *@
            //showModal_.html(path, null, '95%');
        }
    });

};