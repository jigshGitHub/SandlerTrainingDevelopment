﻿/* [[[ Assessement Index ]]] - BT */

//@* Key pressed at Searchbox -> Search Button Click *@
function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

//@* Kendo Grid Data Source *@
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
                    DateRequested: { type: "date" },
                    AgencyRequestDate: { type: "date" },
                    ComplaintIssue: { type: 'string' }
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

//@* Kendo Grid Data *@
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
            { field: "LastName", title: "Last Name", width: "50px" },
            { field: "FirstName", title: "First Name", width: "50px" },
            { field: "LastFourSSN", title: "Last 4 SSN", width: "50px" },
            { field: "ComplaintDate", title: "Start Date", width: "50px", format: "{0:MM/dd/yy}" },
            { field: "DateRequested", title: "Debtor Request Date", width: "60px", format: "{0:MM/dd/yy}" },
            { field: "AgencyRequestDate", title: "Agency Request Date", width: "60px", format: "{0:MM/dd/yy}" },
            { field: "ComplaintIssue", title: "Issue", width: "60px" }

        ]
    }
    return kendoGridData;
}

function ng_reportAAICtrl($scope, $http) {
    angular.element(document).ready(function () {

        //@*Edit record*@
        $('#AAISearchgrid').on('click', '.editsa', function (e) {
            e.preventDefault();
            //var dataItem = $("#AAISearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
            ////@*Now let us clear what we have on this page*@
            //$('#clubSearch').children().remove();
            //var path = baseUrl + "/Compliance/Home/ViewEdit?id=" + dataItem.AccountNumber + "&agency=" + dataItem.AgencyId;
            //$.get(path, function (data) {
            //    //@*Now Refill the data*@
            //    $('#clubSearch').html(data);
            //});

            e.preventDefault();
            var item = $("#AAISearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
            //Create Random Number and send with the Get request - Helps to uniquely differ each request*@
            var randomnumber = Math.floor(Math.random() * 101);
            var path = "navi?url=/Compliance/Home/ViewEdit?id=" + item.AccountNumber + "%26p=" + randomnumber + "%26agency=" + item.AgencyId;
            showModal_.html(path, null, '95%');


        });
        showNoti_.progress(NOTIFICMSG.PROCESSING, false);
        //@*First time Grid Binding*@
        var kendoGridData = get_kendoGridData("");
        $("#AAISearchgrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //@* When Search Button is clicked *@
        $("#btnSearch").click(function () {
            showNoti_.progress(NOTIFICMSG.PROCESSING, false);
            var searchText = $("#searchBox").attr('value');
            var grid = $("#AAISearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText);
            grid.dataSource.transport.options.read.data = { searchText: searchText, reportType: $('#reportType').val() };
            grid.dataSource.read();
            showNoti_.hide();
        });
        
    });

};