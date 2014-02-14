﻿
/*  //////////////////////////////////////////
     (Query Definition) ..crm_peopleSearch..
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\JB\\\ */

q_crm_peopleSearch_url = "/crm/api/PeopleQ/Search";  // POST

q_crm_peopleSearch_fields =
    {
        PID: { type: "number" },
        FNAME: { type: "string" },
        MNAME: { type: "string" },
        LNAME: { type: "string" },
        LGIFT: { type: "number" },
        LGIFTDTE: { type: "date" },
        FGIFT: { type: "number" },
        FGIFTDTE: { type: "date" },
        HPC: { type: "number" },
        HPCDTE: { type: "date" },
        NOGIFTS: { type: "number" },
        CUMTOT: { type: "number" },
        CTDAMT: { type: "number" }
    };

/* ///// [[[ (func)q_crm_peopleSearch_showDetails - Action for Show Detail Button ]]]  /////////////////////////*/
function q_crm_peopleSearch_showDetails(e) {
    e.preventDefault();
    var dataItem = $("#q_searchGrid_crm_peopleSearch").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));

    var path = "/navi?url=/crm/People/Open/" + dataItem.PID;    /* Edit Window */
    showModal_.html(path, null, '100%');
};

/* ///// [[[ (data)q_crm_peopleSearch_gridColumns - Kendo Grid Column Metadata ]]]  ////////////////////////////*/
q_crm_peopleSearch_gridColumns =
    [
                    {
                        command: [
                               { template: "<button class='btn btn-success btn-sm editsa' onclick='q_crm_peopleSearch_showDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" },
                        ],
                        title: " ", width: "50px"
                    },
                    {
                        field: "PID",
                        filterable: false,
                        title: "ID",
                        width: 90
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
                        title: "Last ",
                        width: 120
                    },
                    {
                        field: "LGIFT",
                        title: "Last$",
                        width: 100,
                        format: "{0:c2}"
                    },
                    {
                        field: "LGIFTDTE",
                        title: "Last$ Date",
                        width: 100,
                        format: "{0:MM/dd/yy}"
                    },
                    {
                        field: "FGIFT",
                        title: "First$",
                        width: 100,
                        format: "{0:c2}"
                    },
                    {
                        field: "FGIFTDTE",
                        title: "First$ Date",
                        width: 100,
                        format: "{0:MM/dd/yy}"
                    },
                    {
                        field: "HPC",
                        title: "Highest$",
                        width: 100,
                        format: "{0:c2}"
                    },
                    {
                        field: "HPCDTE",
                        title: "Highest$ Date",
                        width: 100,
                        format: "{0:MM/dd/yy}"
                    },
                    {
                        field: "NOGIFTS",
                        title: "#Gifts",
                        width: 70,
                        format: "{0:n0}",
                    },
                    {
                        field: "CUMTOT",
                        title: "Total $",
                        width: 100,
                        format: "{0:c2}"
                    },
                    {
                        field: "CTD_AMT",
                        title: "CTD Total",
                        width: 100,
                        format: "{0:c2}"
                    }
    ];


//angular.module('ngAppCMDI', ['kendo.directives'])

/* ///// [[[ (func)q_textSearch_btn_crm_peopleSearch_trigger - Action for Quick Text Search ]]]  ////////////////////////////*/
function q_textSearch_btn_crm_peopleSearch_trigger(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#q_textSearch_btn_crm_peopleSearch").click();
    }
};

/* ///// [[[ (func)q_crm_peopleSearch_docReady - Event Action when DOM is ready (Only if partially rendered) ]]]  ///////////*/
function q_crm_peopleSearch_docReady() {

    /* Tooltip */
    $('[data-toggle=tooltip]').tooltip({ placement: 'bottom' });

    /* Search Result Grid */
    var kendoGridData = q_kendoGridData(q_crm_peopleSearch_url, q_crm_peopleSearch_fields, q_crm_peopleSearch_gridColumns, "", null);
    $("#q_searchGrid_crm_peopleSearch").kendoGrid(kendoGridData);
   
    /* When Quick Text Search Button is clicked */
    $("#q_textSearch_btn_crm_peopleSearch").click(function () {

        var searchText = $("#q_textSearch_crm_peopleSearch").attr('value');
        var grid = $("#q_searchGrid_crm_peopleSearch").data("kendoGrid");
        //var dataSource = q_gridDataSource(q_crm_peopleSearch_url, q_crm_peopleSearch_fields, searchText, null);
        grid.dataSource.transport.options.read.data = { searchText: searchText };
        grid.dataSource.page(1);

    });

    /* When "Reset" button is clicked */
    $("#q_resetBtn_crm_peopleSearch").click(function () {
        /* Quick Text Search */
        $("#q_textSearch_crm_peopleSearch").val('');
    });

};

/* ///// [[[ (controller)ngQ_crm_peopleSearch_Controller - People Search ]]]  ///////////*/
app_.controller('ngQ_crm_peopleSearch_Controller', ['$scope', '$http',
        function ($scope, $http) {

            $http.get('/query/api/def?name=crm/peopleSearch').success(function (data) {
                $scope.qDef = new qDef_viewModel(data);
            });

            $scope.panelSelector = {
                dataSource: {
                    data: [{ label: "Profile", symbol: 1 },
                           { label: "Contact", symbol: 2 },
                           { label: "Gift Summary", symbol: 3 }]
                },
                dataTextField: "label",
                dataValueField: "symbol",
                optionLabel: "Select a Group"
            };

            // $scope.$on('$viewContentLoaded', q_crm_peopleSearch_docReady); DOESN'T TRIGGER.  Instead,
            angular.element(document).ready(function () {
                q_crm_peopleSearch_docReady();
            });

        }]);

