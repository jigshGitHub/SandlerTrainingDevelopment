function showDetails(e) {
    e.preventDefault();
    var dataItem = $("#contactsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    // console.log(dataItem);
    var path = "navi?url=/CRM/Contacts/Manage?id=" + dataItem.ContactsId;
    showModal_.html(path, null, '70%');
}

function ng_contactsCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        var contactsSearchgrid = $("#contactsSearchgrid").kendoGrid(kendoGridData);

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
                    { field: "COMPANYNAME", title: "Company", width: "60px" },
                    { field: "ContactsId", hidden:"true" }
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
                        data: { companyId: '0' },
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
                            COMPANYNAME: { type: 'string' },
                            ContactsId: { type: 'string' }
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
                contactsSearchgrid.data("kendoGrid").dataSource.filter({ field: "COMPANIESID", operator: "eq", value: parseInt(companySelectedId) });
            } else {
                contactsSearchgrid.data("kendoGrid").dataSource.filter({});
            }
        };
    });

};