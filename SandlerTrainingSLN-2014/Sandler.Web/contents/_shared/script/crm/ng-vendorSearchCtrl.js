
// Key pressed at Searchbox -> Search Button Click 
function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

// Kendo Grid Data Source
function get_gridDataSource(searchText) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "crm/Vendor/searchVendor",
                dataType: "json",
                data: { searchText: searchText }
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    ENTITYID: { type: "number" },
                    CODE: { type: "string" },
                    ORGNAME: { type: "string" },
                    FNAME: { type: "string" },
                    MNAME: { type: "string" },
                    LNAME: { type: "string" },
                    STREET: { type: "string" },
                    CITY: { type: "string" },
                    STATE: { type: "string" },
                    ZIP: { type: "string" },
                    IS1099: { type: "boolean" },
                    TAXID: { type: "string" },
                    FTXNDTE: { type: "date" },
                    LTXNDTE: { type : "date" },
                    CTDNO_EXP: { type: "number" },
                    CTDAMT_EXP: { type: "number" },
                    YTDNO_EXP: { type: "number" },
                    YTDAMT_EXP: { type: "number" },
                    CUMAMT_EXP: { type: "number" },
                    CTDNO_REC: { type: "number" },
                    CTDAMT_REC: { type: "number" },
                    YTDNO_REC: { type: "number" },
                    YTDAMT_REC: { type: "number" },
                    CUMAMT_REC: { type: "number" }
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

// Kendo Grid Data
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
                className: "k-grid-add add",
                imageClass: "k-icon ob-only-icon k-add"
            }
        ],
        columns: [
            {
                command: [
                   
                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editVendor' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                    { template: "&nbsp;<button title='Delete' class='btn btn-danger btn-sm deleteVendor' onclick='delVendor(event)'><span class='glyphicon glyphicon-remove'></span></button>" }

                ],
                title: " ", width: "100px"
            },
            {
                field: "CODE",
                filterable: false,
                title: "Type",
                width: 90
            },
            {
                field: "ORGNAME",
                filterable: false,
                title: "Vendor Name",
                width: 120
            },
            {
                field: "FNAME",
                title: "First",
                width: 100
            },
            {
                field: "MNAME",
                title: "MIddle",
                width: 80
            },
            {
                field: "LNAME",
                title: "Last",
                width: 120
            },
            {
                field: "STREET",
                title: "Street",
                width: 200
            },
            {
                field: "CITY",
                title: "Street",
                width: 100
            },
            {
                field: "STATE",
                title: "State",
                width: 80
            },
            {
                field: "ZIP",
                title: "Zip",
                width: 80
            },
            {
                field: "FTXNDTE",
                title: "First$ Date",
                width: 100,
                format: "{0:MM/dd/yy}"
            },
            {
                field: "LTXNDTE",
                title: "Last$ Date",
                width: 100,
                format: "{0:MM/dd/yy}"
            },
            {
                field: "CTDNO_EXP",
                title: "Exp Ctd#",
                width: 100,
                format: "{0:n0}"
            },
            {
                field: "CTDAMT_EXP",
                title: "Exp Ctd$",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "YTDNO_EXP",
                title: "Exp Ytd#",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "YTDAMT_EXP",
                title: "Exp Ytd$",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "CUMAMT_EXP",
                title: "Exp Total$",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "CTDNO_REC",
                title: "Rec Ctd#",
                width: 100,
                format: "{0:n0}"
            },
            {
                field: "CTDAMT_REC",
                title: "Rec Ctd$",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "YTDNO_REC",
                title: "Rec Ytd#",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "YTDAMT_REC",
                title: "Rec Ytd$",
                width: 100,
                format: "{0:c2}"
            },
            {
                field: "CUMAMT_REC",
                title: "Rec Total$",
                width: 100,
                format: "{0:c2}"
            }
        ]
    }
    return kendoGridData;
}


// Show Details
var wnd,
    detailsTemplate;

function showDetails(e) {
    e.preventDefault();
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    var dataItem = $("#vQuickSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    
    $('#dvModalBody_pSearch').children().remove();

    var path = "navi?url=/crm/Vendor/Open/" + dataItem.ENTITYID;    // Edit Window 

    showModal_.html(path, null, '95%');
}

// Delete
function delVendor(e) {
    e.preventDefault();
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    var dataItem = $("#vQuickSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //alert(dataItem.ENTITYID);
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Delete this Vendor?",
                function () {
                    showNoti_.progress(NOTIFICMSG.DELETING, false);
                    //Proceed with the Delete as user said Yes - No will be handled automatically
                    $.ajax({
                        url: "crm/api/Vendor/Delete",
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
                                $("#btnSearch").click();
                                $("#content").unblock();
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            showNoti_.error("There is some issue in Deleting the Vendor.", true);
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

    
function ng_vendorSearchCtrl($scope, $http) {

    angular.element(document).ready(function () {

        var kendoGridData = get_kendoGridData("");
        $("#vQuickSearchgrid").kendoGrid(kendoGridData);

        // When Search Button is clicked
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#vQuickSearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText);
            grid.dataSource.transport.options.read.data = { searchText: searchText };
            grid.dataSource.page(1);
        });

        // Per close of Modal Window, clean the content 
        $('#dvModal_pSearch').on('hidden', function () {
            $('#dvModalBody_pSearch').children().remove();
        });

        // Add New Vendor code goes Here
        $('#vQuickSearchgrid').on('click', '.add', function (e) {
            e.preventDefault();
            var path = "navi?url=/crm/Vendor/Add"; // Add Window
            showModal_.html(path, null, '95%');
        });

        // Do not show the Add button if user does not have Add right
        if ('@session.can_i_do("cmdiapp.dms.Entity_Browser", "a")' == 'False') {
            $(".k-toolbar").hide();
        };

        // delete access
        $("#vQuickSearchgrid tbody tr .deleteVendor").each(function () {
            var currentDataItem = $("#vQuickSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
            //Check in the current dataItem if the row is removable
            if ('@session.can_i_do("cmdiapp.dms.Entity_Browser", "d")' == 'False') {
                $(this).remove();
            }
        })

    });

};


