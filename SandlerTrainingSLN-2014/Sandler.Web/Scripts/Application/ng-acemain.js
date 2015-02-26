
function showCampaignDetails(e) {
    e.preventDefault();
    var dataItem = $("#AceDetailsGrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/ACE/Home/Create?id=" + dataItem.AceId;
    //alert("before Navi");
    showModal_.html(path, null, '95%');
}

function archiveCampaign(e) {
    e.preventDefault();
    var dataItem = $("#AceDetailsGrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Campaign - " + dataItem.CampaignName + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/AceMain/Archive",
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
                          RefreshGrid();
                          $("#content").unblock();
                      }
                  },
                  error: function (xhr, ajaxOptions, thrownError) {
                      showNoti_.error("There is some issue in Archiving the Campaign. Please try again later.", true);
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

function RefreshGrid() {
    $("#btnSearch").click();
}//end refresh grid function

function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}

function onDataBound(arg) {

    //Selects all Archive Buttons
    $("#AceDetailsGrid tbody tr .deletesa").each(function () {
        var currentDataItem = $("#AceDetailsGrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#SandlerRole").val() != "FranchiseeOwner") {
            $(this).remove();
        }
    })
}

function get_kendoGridData(searchText, selectForExcel) {
    
    var dataSource = get_gridDataSource(searchText, selectForExcel)
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
        dataBound: onDataBound,
        columnMenu: true,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit Campaign' class='btn btn-success btn-sm editsa' onclick='showCampaignDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                             { template: "&nbsp;<button title='Archive Campaign' class='btn btn-warning btn-sm deletesa' onclick='archiveCampaign(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                ],
                title: " ", width: "75px"
            },
            { field: "CampaignName", title: "Campaign Name", width: 80, attributes: { "class": "sptablecell" } },
            { field: "EventDate", title: "Event Date", width: 60, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } },
            { field: "MessageNumber", title: "Message #", width: 80, format: "{0:N0}", attributes: { "class": "sptablecell" } },
            { field: "MessageSubject", title: "Subject", width: 80, attributes: { "class": "sptablecell" } },
            { field: "ResponseRate", title: "Response Rate%", width: 100, format: "{0:p2}" },
            { field: "MessageSentDate", title: "Send Date", width: 60, format: "{0:MM/dd/yyyy}", attributes: { "class": "sptablecell" } }
            
        ]
    }
    return kendoGridData;
}

function get_gridDataSource(searchText, selectForExcel) {

    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/AceMainView/",
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
                    CampaignName: { type: 'string' },
                    EventDate: { type: 'date' },
                    MessageNumber: { type: 'number' },
                    MessageSubject: { type: 'string' },
                    ResponseRate: { type: "number" },
                    MessageSentDate: { type: 'date' }
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

function ng_acemainCtrl($scope, $http) {
    angular.element(document).ready(function () {

        var kendoGridData = get_kendoGridData("", false);
        $("#AceDetailsGrid").kendoGrid(kendoGridData);
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#AceDetailsGrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText, false);
            grid.dataSource.transport.options.read.data = { searchText: searchText, selectForExcel: false };
            grid.dataSource.page(1);
        });

        /* Tooltip */
        $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

        //Hide any Pines Notify 
        showNoti_.hide();

    });
};