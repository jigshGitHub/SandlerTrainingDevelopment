
 function DrawFundGraph() {

        //Line Chart Donor Dollar
        var seriesDataDollar = [{
            field: "_donationDOLLAR",
            color: "#FF8C00",
            name: "$ Dollar",
            type: "area"
        }];
        var seriesDataCount = [{
            field: "_donationCOUNT",
            color: "#1E90FF",
            name: "# Count",
            type: "area"
        }];

        var categoryField = "_date1";

        //var URL = "@Url.Action("getInitiativeFundGraph", "Settings")";

        var URL = "api/InitiativeFundGraph";
        
        $.ajax({
            url: URL,
            type: "GET",
            cache: false,
            //data: {
            //    whatPeriod: whatPeriod,
            //    PkgeID: '183',
            //    random: Math.floor(Math.random() * 101)
            //},
            async: false,
            success: function (chartData) {


                //alert(chartData.count);

                if (chartData.count > 1) {
                    $("#initiativecharts").show();
                    $("#initiativecharts_noData").hide();
                    createLineChart($("#line_chart_fDonorDollar"), chartData.list, seriesDataDollar, categoryField, "");
                    createLineChart($("#line_chart_fDonorCount"), chartData.list, seriesDataCount, categoryField, "");
                }
                else {
                    $("#initiativecharts").hide();
                    $("#initiativecharts_noData").show();
                }

            }
        });

    }

 function DrawInteractionGraph() {
    //var _data = {
            
    //    pPkgeID: '183',
    //    ActivityGroupId: -1,
    //    random: Math.floor(Math.random() * 101)
    //};

    var seriesData = [{
        field: "_uniqActivityCount",
        color: "#FF8C00",
        name: "# Unique People",
        type: "line"
    },
    {
        field: "_signUpCount",
        color: "#1E90FF",
        name: "# Sign Up",
        type: "line"
    }];
    var categoryField = "_date";

    //var __URL = "@Url.Action("getInitiativeInteractGraph", "Settings")";

    var __URL = "api/InitiativeInteractGraph";

    $.ajax({
        url: __URL,
        type: "GET",
        cache: false,
        //data: _data,
        async: false,
        success: function (Data) {

            if (Data.pcount <= 0 && Data.lcount <= 0) {
                $("#interactn_charts").hide();
                $("#interactn_charts_noData").show();
            }
            else {
                $("#interactn_charts").show();
                $("#interactn_charts_noData").hide();

                if (Data.pcount > 0) {
                    $("#interactn_Pie").show();
                    $("#interactn_noPie").hide();

                    createPieChart($('#piechart_interactn'), Data.plist);
                }
                if (Data.lcount > 0) {

                    $("#interactn_Line").show();
                    $("#interactn_noLine").hide();
                    createLineChart($("#interactn_Line"), Data.lList, seriesData, categoryField, "# Activities (Sign-Up and Unique)");
                }
            }
        }
    });
}

 function createLineChart(id, chartData, seriesData, field, title) {

        id.kendoChart({
            theme: $(document).data("kendoSkin") || "Metro",
            chartArea: {
                background: "transparent"
            },
            dataSource: chartData,
            title: {
                visible: true,
                text: title
            },
            legend: {
                visible: true,
                position: "bottom"
            },
            seriesDefaults: {

                type: "line",
                missingValues: "interpolate"        
            },

            series: seriesData,

            categoryAxis: {
                field: field,
                type: "Date",
                majorGridLines: {
                    visible: false
                },

                visible: false,
                baseUnit: "days"
            },

            valueAxis: {
                labels: {
                    //format: "N0"
                },
                line: {
                    visible: false
                },
                minorGridLines: {
                    visible: false
                }
            },
            tooltip: {
                visible: true,
                opacity: 0.7
            }
        });
    }


 function onSeriesClick(e) {
     //for drill down feature of pie chart
 }


 function createPieChart(id, pieData) {

    id.kendoChart({

        chartArea: {
            background: "transparent"
        },
        dataSource: pieData,
        title: {
            visible: true,
            text: "# Activities by ACTIVITY TYPE",
            position: "top"
        },
        legend: {
            position: "bottom",
            labels: {
                template: "#= text #"
            }
        },
        seriesDefaults: {
            type: "pie",
            labels: {
                visible: false//false,

            }
        },
        series: [{
            type: "pie",
            startAngle: 150,
            field: "_activityYvalue",
            categoryField: "_activityXlabel",// "label",
            padding: 0
        },
        ],
        tooltip: {
            visible: true,

            template: "#= category # - #= kendo.format('{0:P}', percentage)#",
            opacity: 0.7
        },
        seriesClick: onSeriesClick
    });
}

 function ng_mydashboardCtrl($scope, $http) {
    angular.element(document).ready(function () {

        DrawInteractionGraph();

        DrawFundGraph();

    });

};