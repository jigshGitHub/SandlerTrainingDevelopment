// Key pressed at Searchbox -> Search Button Click *@
function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearchReceipt").click();
    }
}


// Kendo Data Source *@
function get_exptxngridDataSource(searchText) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "crm/Expenditure/SearchReceipts",
                dataType: "json",
                //data: { txntype: "@Model.pageData1", searchText: searchText }
                data: { txntype: $("#txntype").val(), searchText: searchText }
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    TXNID: { type: "number" },
                    VENDORID: { type: "number" },
                    VENDORTYPE: { type: "string" },
                    ORGNAME: { type: "string" },
                    PREFIX: { type: "string" },
                    FNAME: { type: "string" },
                    MNAME: { type: "string" },
                    LNAME: { type: "string" },
                    SUFFIX: { type: "string" },
                    STREET: { type: "string" },
                    ADDR1: { type: "string" },
                    CITY: { type: "string" },
                    STATE: { type: "string" },
                    ZIP: { type: "string" },
                    TXNDTE: { type: "date" },
                    AMT: { type: "number" },
                    FUNDCODE: { type: "string" },
                    TRANSTYPE: { type: "string" },
                    DESCRIPTION: { type: "string" },
                    BANKACCT: { type: "string" },
                    MEMO: { type: "boolean" },
                    MEMOTXT: { type: "string" },
                    CHECKNO: { type: "string" },
                    FEC_DESCRIPTION: { type: "string" }
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


// Kendo Grid Data *@
function get_exptxnkendoGridData(searchText) {
    var dataSource = get_exptxngridDataSource(searchText)
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
                className: "k-grid-add addsa",
                imageClass: "k-icon ob-only-icon k-add"
            }
        ],
        columns: [
                {
                    command: [
                           
                    { template: "<button class='btn btn-success btn-sm ' onclick='showexptxnDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                    { template: "&nbsp;<button class='btn btn-danger btn-sm deletesa' onclick='deleteTxn(event)'><span class='glyphicon glyphicon-remove'></span></button>"}
                    ],
                    title: " ", width: "90px"
                },
                { field: 'TXNID', filterable: false, title: 'Transaction ID', width: 150 },
                { field: 'VENDORID', title: 'Vendor ID', width: 100 },
                { field: 'VENDORTYPE', title: 'Vendor Type', width: 120 },
                { field: 'ORGNAME', title: 'Vendor Name', width: 120 },
                { field: 'PREFIX', title: 'Prefix', width: 80 },
                { field: 'FNAME', title: 'First Name', width: 120 },
                { field: 'MNAME', title: 'Middle Name', width: 120 },
                { field: 'LNAME', title: 'Last Name', width: 120 },
                { field: 'SUFFIX', title: 'Suffix', width: 80 },
                { field: 'STREET', title: 'Street', width: 150 },
                { field: 'ADDR1', title: 'Address', width: 150 },
                { field: 'CITY', title: 'city', width: 100 },
                { field: 'STATE', title: 'State', width: 80 },
                { field: 'ZIP', title: 'Zip', width: 80 },
                { field: 'TXNDTE', title: 'Trans Date', width: 100, format: "{0:MM/dd/yy}" },
                { field: 'AMT', title: 'Amount', width: 100, format: "{0:n0}" },
                { field: 'FUNDCODE', title: 'FundCode', width: 100 },
                { field: 'TRANSTYPE', title: 'Trans Type', width: 200 },
                { field: 'DESCRIPTION', title: 'Description', width: 200 },
                { field: 'BANKACCT', title: 'Bank Acct', width: 100 },
                { field: 'MEMO', title: 'Memo', width: 100 },
                { field: 'MEMOTXT', title: 'Memo Text', width: 120 },
                { field: 'CHECKNO', title: 'Check No.', width: 100 },
                { field: 'FEC_DESCRIPTION', title: 'FEC Description', width: 200 }
        ]
    }
    return kendoGridData;
}


// View
function showexptxnDetails(e) {
    e.preventDefault();
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    var dataItem = $("#receiptsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));

    $('#dvModalBody_pSearch').children().remove();
    // Edit Window *@
    //var path = "navi?url=/crm/Expenditure/ReceiptsOpen/" + dataItem.TXNID;
    var path = "navi?url=/crm/Expenditure/ReceiptsEdit?txntype=@Model.pageData1%26id=" + dataItem.TXNID
    showModal_.html(path, null, '95%');

}
//Delete
function deleteTxn(e) {
    e.preventDefault();
    var dataItem = $("#receiptsSearchgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    //var dataItem = this.dataItem($(e.currentTarget).closest("tr"));

    //$('#content').block({ message: null });
    showNoti_.confirm("Are you sure to Delete this Transaction?",
              function () {
                  showNoti_.progress(NOTIFICMSG.DELETING, false);
                  //Proceed with the Delete as user said Yes - No will be handled automatically
                  $.ajax({
                      url: "crm/api/Transaction/Delete",
                      type: 'POST',
                      data: ko.toJSON(dataItem),
                      contentType: 'application/json',
                      success: function (result) {
                          if (!result.success) {
                              showNoti_.error(result.message, true);
                              //$("#content").unblock();
                          }
                          else {
                              showNoti_.hide();
                              $("#btnSearch").click();
                              //$("#content").unblock();
                          }
                      },
                      error: function (xhr, ajaxOptions, thrownError) {
                          showNoti_.error("There is some issue in Deleting the Transaction.", true);
                          //$("#content").unblock();
                      }
                  });
              },
          function () {
              //user said no
              showNoti_.hide();
              //$("#content").unblock();
          });//confirm ends here

}


// Document Ready *@ 
//app_.controller('ng_ExpenditureCtrl', ['$scope', '$http',
function ng_ExpenditureCtrl($scope, $http) {

         angular.element(document).ready(function () {

             var kendoGridData = get_exptxnkendoGridData("");
             $("#receiptsSearchgrid").kendoGrid(kendoGridData);

             // When Search Button is clicked *@
             $("#btnSearchReceipt").click(function () {
                 var searchText = $("#searchBoxReceipt").attr('value');
                 var grid = $("#receiptsSearchgrid").data("kendoGrid");
                 var dataSource = get_exptxngridDataSource(searchText);
                 //grid.dataSource.transport.options.read.data = { txntype: '@Model.pageData1', searchText: searchText };
                 grid.dataSource.transport.options.read.data = { txntype: $("#txntype").val(), searchText: searchText };
                
                 grid.dataSource.page(1);
                 //grid.dataSource.read();*@
             });

            

             //Add New Receipts*@
             $('#receiptsSearchgrid').on('click', '.addsa', function (e) {
                 e.preventDefault();
                 var path = "navi?url=/crm/Expenditure/ReceiptsAdd?txntype=" + $("#txntype").val() + "%26entityid=0"; // Add Window *@
                 showModal_.html(path, null, '95%');
             });


         });

};
//]);