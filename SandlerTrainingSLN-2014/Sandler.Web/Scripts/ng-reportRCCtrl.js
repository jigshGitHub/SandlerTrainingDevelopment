/* [[[ Assessement Index ]]] - BT */

//@* Key pressed at Searchbox -> Search Button Click *@
function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

function get_gridDataSource(searchText) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: baseUrl + "/Compliance/Home/GetComplianceReportData",
                dataType: "json",
                data: { searchText: searchText, reportType: $('#reportType').val(), roleEntityValue: $('#roleEntityValue').val(), hdnUserRole: $('#hdnUserRole').val() },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    ComPlaintId: { type: 'string' },
                    AccountNumber: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    LastFourSSN: { type: 'string' },
                    ComplaintDate: { type: "date" },
                    ResolvedDate: { type: "date" },
                    ResponseTimeDays: { type: "number" }
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
                      //{ id: "edit", name: "edit", template: "<a class='k-button k-grid-edit editsa' title='View/Edit' style='min-width:16px;'><span class='k-icon k-edit'></span></a>" },
                      { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa'><span class='glyphicon glyphicon-search'></span></button>" }

                ], title: " ", width: "20px"
            },
            { field: "ComPlaintId", title: "Complaint ID", width: "60px" },
            { field: "AccountNumber", title: "Account#", width: "60px" },
            { field: "LastName", title: "Last Name", width: "60px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "LastFourSSN", title: "Last 4 SSN", width: "60px" },
            { field: "ComplaintDate", title: "Start Date", width: "60px", format: "{0:MM/dd/yy}" },
            { field: "ResolvedDate", title: "Date Resolved", width: "80px", format: "{0:MM/dd/yy}" },
            { field: "ResponseTimeDays", title: "Response Time(Days)", width: 100, format: "{0:n0}" }

        ]
    }
    return kendoGridData;
}

function ng_reportRCCtrl($scope, $http) {
    angular.element(document).ready(function () {

       //@*Edit record*@
        $('#RCSearchgrid').on('click', '.editsa', function (e) {
            //e.preventDefault();
            //var dataItem = $("#RCSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
            ////@*Now let us clear what we have on this page*@
            //$('#clubSearch').children().remove();
            //var path = baseUrl + "/Compliance/Home/ViewEdit?id=" + dataItem.AccountNumber + "&agency=" + dataItem.AgencyId;
            //$.get(path, function (data) {
            //    //@*Now Refill the data*@
            //    $('#clubSearch').html(data);
            //});


            e.preventDefault();
            var item = $("#RCSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
            //Create Random Number and send with the Get request - Helps to uniquely differ each request*@
            var randomnumber = Math.floor(Math.random() * 101);
            var path = "navi?url=/Compliance/Home/ViewEdit?id=" + item.AccountNumber + "%26p=" + randomnumber + "%26agency=" + item.AgencyId;
            showModal_.html(path, null, '95%');


        });
        showNoti_.progress(NOTIFICMSG.PROCESSING, false);
        //@*First time Grid Binding*@
        var kendoGridData = get_kendoGridData("");
        $("#RCSearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //@* When Search Button is clicked *@
        $("#btnSearch").click(function () {
            showNoti_.progress(NOTIFICMSG.PROCESSING, false);
            var searchText = $("#searchBox").attr('value');
            var grid = $("#RCSearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText);
            grid.dataSource.transport.options.read.data = { searchText: searchText, reportType: $('#reportType').val() };
            grid.dataSource.read();
            showNoti_.hide();
        });
        
    });

};