function showDetails(e) {
    e.preventDefault();
    var dataItem = $("#contactsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    // console.log(dataItem);
    var path = "navi?url=" + baseUrl + "/CRM/Contacts/Manage?id=" + dataItem.ContactsId;
    showModal_.html(path, null, '70%');
}

function archiveContact(e) {
    e.preventDefault();
    var dataItem = $("#contactsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //Let us block the Div while we wait for User response
    $('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Archive this Contact - " + dataItem.FullName + "?",
          function () {
              showNoti_.progress(NOTIFICMSG.ARCHIVING, false);
              //Proceed with the Archive 
              $.ajax({
                  url: "api/Contact/Archive",
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
                      showNoti_.error("There is some issue in Archiving the Contact. Please try again later.", true);
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
    $("#contactsSearchgrid tbody tr .deletesa").each(function () {
        var currentDataItem = $("#contactsSearchgrid").data("kendoGrid").dataItem($(this).closest("tr"));
        if ($("#SandlerRole").val() != "FranchiseeOwner") {
            $(this).remove();
        }
    })
}

function ng_contactsCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);

        var kendoGridData = get_kendoGridData("");
        var contactsSearchgrid = $("#contactsSearchgrid").kendoGrid(kendoGridData);

        $('#companiesSelection').kendoDropDownList(get_kendoCompaniesData());
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var searchText = $("#searchBox").attr('value');
            var grid = $("#contactsSearchgrid").data("kendoGrid");
            var dataSource = get_gridDataSource(searchText);
            grid.dataSource.transport.options.read.data = { searchText: searchText, selectForExcel: false };
            grid.dataSource.page(1);
        });

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
                dataBound: onDataBound,
                columnMenu: true,
                scrollable: true,
                navigatable: true,
                selectable: true,
                columns: [
                    {
                        command: [
                                    { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                                     { template: "&nbsp;<button title='Archive Contact' class='btn btn-danger btn-sm deletesa' onclick='archiveContact(event)'><span class='glyphicon glyphicon-remove'></span></button>" }
                        ],
                        title: " ", width: "35px"
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