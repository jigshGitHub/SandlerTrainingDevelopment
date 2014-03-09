function showAllRecordDetails(e) {
    e.preventDefault();
    //var recordType = localStorage.getItem("Type");
    //alert(recordType);
    var path;
    var dataItem = $("#GlobalSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
 
    if (dataItem.RecordType == "Company") {        
        path = "navi?url=" + baseUrl + "/CRM/Companies/Edit?id=" + dataItem.RecordId;
    }
    if (dataItem.RecordType == "Contact") {        
        path = "navi?url=" + baseUrl + "/CRM/Contacts/Manage?id=" + dataItem.RecordId;
    }
    if (dataItem.RecordType == "Opportunity") {        
        path = "navi?url=" + baseUrl + "/CRM/Pipeline/Manage?id=" + dataItem.RecordId;
    }    
    
    showModal_.html(path, null, '70%');
    // console.log(dataItem);
   
}

function showCompanyDetails(e) {
    e.preventDefault();
    var dataItem = $("#GlobalSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    var path = "navi?url=" + baseUrl + "/CRM/Companies/Edit?id=" + dataItem.COMPANIESID;
    showModal_.html(path, null, '95%');
}
function showContactDetails(e) {
    e.preventDefault();
    var dataItem = $("#GlobalSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    var path = "navi?url=" + baseUrl + "/CRM/Contacts/Manage?id=" + dataItem.ContactsId;
    showModal_.html(path, null, '95%');
}
function showOpportunityDetails(e) {
    e.preventDefault();
    var dataItem = $("#GlobalSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    var path = "navi?url=" + baseUrl + "/CRM/Pipeline/Manage?id=" + dataItem.ID;
    showModal_.html(path, null, '95%');
}

function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}


function ng_globalSearchCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);
       var data = [
                       { text: "All", value: "All" },
                       { text: "Companies", value: "Companies" },
                       { text: "Contact", value: "Contact" },
                       { text: "Opportunity", value: "Opportunity" }
                      
        ];
        $("#SearchRecordTypeSelection").kendoDropDownList({
            dataTextField: "text",
            dataValueField: "value",
            dataSource: data,
            height: 100            
        })
        
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            //localStorage.setItem("Type", '');
            var searchText = $("#searchBox").attr('value');
            var searchRecordType = $("#SearchRecordTypeSelection").attr('value');
                       
            var CHANGE = 'change',
                $grid = $("#GlobalSearchgrid");
            if ($grid.length > 0 && $grid.data().kendoGrid) {
                var thisKendoGrid = $grid.data().kendoGrid;
                if (thisKendoGrid.dataSource && CHANGE, thisKendoGrid._refreshHandler) {
                    thisKendoGrid.dataSource.unbind(CHANGE, thisKendoGrid._refreshHandler);
                    $grid.removeData('kendoGrid');
                    $grid.empty();
                }
            }
            if (searchRecordType == "All") {
                var kendoGridData = get_kendoGridData(searchText, searchRecordType);               
                
                $("#GlobalSearchgrid").kendoGrid(kendoGridData);
                
               // localStorage.setItem("Type", 'All');
            }
            if (searchRecordType == "Companies") {
                var kendoGridData = get_CompanykendoGridData(searchText, false);
                
                $("#GlobalSearchgrid").kendoGrid(kendoGridData);
                //localStorage.setItem("Type", 'Companies');
            }
            if (searchRecordType == "Contact") {
                var kendoGridData = get_ContactkendoGridData(searchText);
                
                $("#GlobalSearchgrid").kendoGrid(kendoGridData);
                //localStorage.setItem("Type", 'Contact');
            }
            if (searchRecordType == "Opportunity") {
                var kendoGridData = get_OpportunitykendoGridData(searchText);
                
                $("#GlobalSearchgrid").kendoGrid(kendoGridData);
                //localStorage.setItem("Type", 'Opportunity');
            }
                       

      
        });     
      

        function get_kendoGridData(searchText, searchRecordType) {
            var dataSource = get_gridDataSource(searchText, searchRecordType)
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
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }                                     
                        ],
                        title: " ", width: "35px"
                    },
                    { field: "RecordType", title: "Record Type", width: "80px" },                    
                    { field: "COMPANYNAME", title: "Company", width: "80px" },
                    { field: "FranchiseeName", title: "Franchisee", width: "60px" },
                    { field: "POCName", title: "POC Name", width: "60px" },                    
                    { field: "OppName", title: "Opportunity Name", width: "60px" },                    
                    { field: "RecordId", hidden: "true" }

                ]
            }
            return kendoGridData;
        }
        function get_gridDataSource(searchText, searchRecordType) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/GlobalSearchView/",
                        dataType: "json",
                        data: { searchText: searchText, searchRecordType: searchRecordType },
                        cache: false //This is required othewise grid does not refresh after Edit operation in IE
                    }
                },
                schema: {
                    data: "results",
                    total: "__count",
                    model: {
                        fields: {
                            RecordType: { type: 'string' },
                            COMPANYNAME: { type: 'string' },
                            FranchiseeName: { type: 'string' },
                            POCName: { type: 'string' },
                            OppName: { type: 'string' },
                            RecordId: { type: 'string' }                           
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

        function get_CompanykendoGridData(searchText, selectForExcel) {            
            var dataSource = get_CompanygridDataSource(searchText, selectForExcel)
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
                                    { template: "<button title='View/Edit Company' class='btn btn-success btn-sm editsa' onclick='showCompanyDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                        ],
                        title: " ", width: "35px"
                    },
                    { field: "COMPANYNAME", title: "Company Name", width: 80 },
                    { field: "IndustryTypeName", title: "Industry", width: 80 },
                    { field: "ProductTypeName", title: "Product", width: 60 },
                    { field: "Representative", title: "Sandler Rep Name", width: 60 },
                    { field: "TotalCompanyValue", title: "Total Company Value", width: 60, format: "{0:c2}" }

                ]
            }
            return kendoGridData;
        }
        function get_CompanygridDataSource(searchText, selectForExcel) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/CompanyView/",
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

        function get_ContactkendoGridData(searchText) {
            var dataSource = get_ContactgridDataSource(searchText)
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
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showContactDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                        ],
                        title: " ", width: "35px"
                    },
                    { field: "FullName", title: "Name", width: "80px" },
                    { field: "Phone", title: "Phone", width: "80px" },
                    { field: "Email", title: "Email", width: "80px" },
                    { field: "COMPANYNAME", title: "Company", width: "60px" },
                    { field: "ContactsId", hidden: "true" }
                ]
            }
            return kendoGridData;
        }
        function get_ContactgridDataSource(searchText) {
            var dataSource = {
                type: "json",
                transport: {
                    read: {
                        url: "api/ContactView/",
                        dataType: "json",
                        data: { companyId: '0', searchText: searchText, selectForExcel: false },
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
        
        function get_OpportunitykendoGridData(searchText) {
            var dataSource = get_OpportunitygridDataSource(searchText)
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
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showOpportunityDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
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
        function get_OpportunitygridDataSource(searchText) {
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

     
    });

};