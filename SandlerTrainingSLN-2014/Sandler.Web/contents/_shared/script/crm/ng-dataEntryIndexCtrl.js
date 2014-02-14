/* [[[ Data Entry - Index Page ]]] - BT */

//Key pressed at Searchbox -> Search Button Click *@
function triggerSearchDE(e) {
        var unicode = e.keyCode ? e.keyCode : e.charCode;
        if (unicode == 13) {
            $("#btnSearch").click();
        }
    }
function triggerOptionSearchDE() {
    $("#btnSearch").click();
}

//Kendo Grid Data Source *@
 function get_gridDataSourceDE(searchText, OpenBatchOption, BalancedBatchOption,randomnumber) {
        var dataSourceDE = {
            type: "json",
            transport: {
                read: {
                    url: "crm/DataEntry/GetBatchList",
                    dataType: "json",
                    data: { searchText: searchText, OpenBatchOption: OpenBatchOption, BalancedBatchOption:BalancedBatchOption, rn: randomnumber },
                    cache: false //This is required othewise grid does not refresh after Edit operation in IE
                }
            },
            schema: {
                data: "results",
                total: "__count",
                model: {
                    fields: {
                        BATCHID: { type: 'string' },
                        BATCHNO: { type: 'string' },
                        BATCHDTE: { type: "date" },
                        BATTYPEDESC: { type: 'string' },
                        FUNDDESC: { type: 'string' },
                        BATCHCNT: { type: "number" },
                        BATCHAMT: { type: "number" },
                        sNOMONY: { type: "number" },
                        sAMTMONY: { type: "number" }
                    }
                }
            },
            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true
        };
        return dataSourceDE;
    }

 function RefreshGridDE(searchText) {
        //alert("hello");
        var grid = $("#batchListQuickSearchgrid").data("kendoGrid");
        var OpenBatchOption = $('#OpenBatchChkBox').is(':checked');
        var BalancedBatchOption = $('#BalancedBatchChkBox').is(':checked');
        var randomnumber = Math.floor(Math.random() * 101);
        var dataSource = get_gridDataSourceDE(searchText, OpenBatchOption, BalancedBatchOption, randomnumber);
        grid.dataSource.transport.options.read.data = { searchText: searchText, OpenBatchOption: OpenBatchOption, BalancedBatchOption: BalancedBatchOption, rn: randomnumber };
        grid.dataSource.read();
}//end refresh grid function

function onDataBoundDE(arg) {
    //Show and Hide Edit and Delete buttons*@
    //Selects all Edit Buttons
    $("#batchListQuickSearchgrid tbody tr .editsa").each(function () {
        var currentDataItem = $("#batchListQuickSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#CanEdit").val() == "false") {
            $(this).remove();
        }
    })
    //Selects all Delete Buttons
    $("#batchListQuickSearchgrid tbody tr .deletesa").each(function () {
        var currentDataItem = $("#batchListQuickSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#CanDelete").val() == "false") {
            $(this).remove();
        }
    })
}

//Kendo Grid Data *@
 function get_kendoGridDataDE(searchText, OpenBatchOption, BalancedBatchOption,randomnumber) {
        var dataSourceDE = get_gridDataSourceDE(searchText, OpenBatchOption, BalancedBatchOption, randomnumber)
        var kendoGridData = {
            dataSource: dataSourceDE,
            height: 495,
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
            dataBound: onDataBoundDE,
            selectable: true,
            toolbar: [
                {
                    name: "add", 
                    text: "Add",
                    className: "k-grid-add addsa",
                    imageClass: "k-icon ob-only-icon k-add"
                }
            ],
            columns: [
                {
                    command: [
                           { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa'><span class='glyphicon glyphicon-search'></span></button>" },
                           { template: "&nbsp;<button title='Delete' class='btn btn-danger btn-sm deletesa'><span class='glyphicon glyphicon-remove'></span></button>" }
                    ],
                    title: " ", width: "35px"
                },

                { field: "BATCHID", title: "id#", width: 35 },
                { field: "BATCHNO", title: "Batch #", width: 35 },
                { field: "BATCHDTE", title: "Batch Date", width: 50, format: "{0:MM/dd/yy}" },
                { field: "BATTYPEDESC", title: "Type", width: 45 },
                { field: "FUNDDESC", title: "Committee", width: 70 },
                { field: "BATCHCNT", title: "# in Header", width: 35 },
                { field: "BATCHAMT", title: "$ in Header", width: 40, format: "{0:c2}" },
                { field: "sNOMONY", title: "# in System", width: 35 },
                { field: "sAMTMONY", title: "$ in System", width: 45, format: "{0:c2}" }
                
            ]
        }
        return kendoGridData;
    }

        function ng_dataEntryIndexCtrl ($scope, $http) {
            angular.element(document).ready(function () {
                                
                    //alert("1");
                    ////Add record*@
                    $('#batchListQuickSearchgrid').on('click', '.addsa', function (e) {
                        e.preventDefault();
                        var path = "navi?url=/crm/DataEntry/CreateBatchHeader";
                        showModal_.html(path, null, '95%');
                    });
        
                    ////Delete record*@
                    $('#batchListQuickSearchgrid').on('click', '.deletesa', function (e) {
                        e.preventDefault();
                        var item = $("#batchListQuickSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
                        $('#content').block({ message: null });
                        showNoti_.confirm("Are you sure to delete Batch# " + item.BATCHNO +"?",
                            function () {
                                var randomnumber = Math.floor(Math.random() * 101);
                                //alert(randomnumber);
                                $.post("/DataEntry/DeleteBatch", { batchId: item.BATCHID, p: randomnumber }, function (data) {
                                if (!data.success) {
                                        showNoti_.info(data.message, true);
                                        $("#content").unblock();
                                    }
                                    else {
                                        //Rebind and Inform the user*@
                                        var searchText = $("#searchBox").attr('value');
                                        RefreshGridDE(searchText);
                                        showNoti_.info(data.message, true);
                                        $("#content").unblock();
                                    }
                                });

                            },
                            function () {
                                //user said no
                                showNoti_.hide();
                                $("#content").unblock();
                            });
                    });
        
                    //Edit record*@
                    $('#batchListQuickSearchgrid').on('click', '.editsa', function (e) {
                        e.preventDefault();
                        var item = $("#batchListQuickSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
                        //Create Random Number and send with the Get request - Helps to uniquely differ each request*@
                        var randomnumber = Math.floor(Math.random() * 101);
                        //Also find the SearchText if anything is enetered by user - this will be useful while binding the grid after Edit is done*@
                        var searchText = $("#searchBox").attr('value');
                        var path = "navi?url=/crm/DataEntry/ShowBatchHeader/" + "?batchid=" + item.BATCHID + "%26p=" + randomnumber + "&26searchText=" + searchText;
                        showModal_.html(path, null, '95%');
                    });

                    //First time Grid Binding*@
                    var randomnumber = Math.floor(Math.random() * 101);
                    var kendoGridData = get_kendoGridDataDE("", $('#OpenBatchChkBox').is(':checked'), $('#BalancedBatchChkBox').is(':checked'), randomnumber); 
                    $("#batchListQuickSearchgrid").kendoGrid(kendoGridData);
                
                    // When Search Button is clicked *@
                    $("#btnSearch").click(function () {
                        var searchText = $("#searchBox").attr('value');
                        var OpenBatchOption = $('#OpenBatchChkBox').is(':checked');
                        var BalancedBatchOption = $('#BalancedBatchChkBox').is(':checked');
                        var grid = $("#batchListQuickSearchgrid").data("kendoGrid");
                        var randomnumber = Math.floor(Math.random() * 101);
                        var dataSource = get_gridDataSourceDE(searchText, OpenBatchOption, BalancedBatchOption, randomnumber);
                        grid.dataSource.transport.options.read.data = { searchText: searchText, OpenBatchOption: OpenBatchOption, BalancedBatchOption: BalancedBatchOption, rn: randomnumber };
                        grid.dataSource.page(1);
                    });

                    if ($("#CanAdd").val() == "false") {
                        $(".k-toolbar").hide();
                    }


            });

        };

     //console.log('I was run DE Index.');
