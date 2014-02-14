$(document).ready(function () {

    // [Init] Handle Collapse/Expand Icon properly //
    $("div[id^='pnFilterBody_']").each(function () {
        var iconId = '#pnFilterIcon_' + $(this).attr("qItemNo");
        $(this).on('shown', function () {
            $(iconId).removeClass("icon-chevron-down").addClass("icon-chevron-up");
        });
        $(this).on('hidden', function () {
            $(iconId).removeClass("icon-chevron-up").addClass("icon-chevron-down");
        });
    });
    // Expand the very first panel 
    $("div[id^='pnFilterBody_']").first().addClass("in");

    // [Event] Filtering Buttons are clicked 
    $('#filteringPanel').on('click', '.accordion-inner .qButton', function (event) {
        event.stopPropagation(); // prevent default bootstrap behavior
        if ($(this).hasClass('active')) {
            $(this).removeClass('btn-danger');
            $(this).removeClass('active');
            $(this).children('i').removeClass('icon-white');
            $(this).children('span.qDetail').addClass('hide');
        }
        else {
            $(this).addClass('active');
            $(this).addClass('btn-danger');
            $(this).children('i').addClass('icon-white');
            $(this).children('span.qDetail').removeClass('hide');
        }
        var iPanel_Id = "#iPanel_" + $(this).attr('fId');
        $(iPanel_Id).toggle('showOrHide');
    });

    qOperator.init();

});



// Query Operators 
var qOperators = {

    string: [
        { symbol: "[[ eLIKE ]]", label: "Equal to" },
        { symbol: "[[ LIKE% ]]", label: "Starts with" },
        { symbol: "[[ %LIKE ]]", label: "Ends with" },
        { symbol: "[[ %LIKE% ]]", label: "Contains" },
        { symbol: "[[ NULL ]]", label: "is empty" },
        { symbol: "[[ !NULL ]]", label: "is NOT empty" },
        { symbol: "[[ IN ]]", label: "in list of" },
        { symbol: "[[ !IN ]]", label: "NOT in list" }
    ],

    numeric: [
        { symbol: "[[: ]]", label: "Equal to" },
        { symbol: "[[ >= ]]", label: "Greater than/Equals to" },
        { symbol: "[[ <= ]]", label: "Less than/Equal to" },
        { symbol: "[[ != ]]", label: "NOT Equal to" },
        { symbol: "[[ nBTW ]]", label: "Between" }
    ],

    date: [
        { symbol: "[[ dYET ]]", label: "(Specify)", details: "" },
        { symbol: "[[ On ]]", label: "On", details: "" },
        { symbol: "[[ On/After ]]", label: "On/After", details: "" },
        { symbol: "[[ On/Before ]]", label: "On/Before", details: "" },
        { symbol: "[[ dBTW ]]", label: "Between", details: "" }
    ]
};

// [ Event ] Query Operator:Selected
function on_qOpSelect(e) {
    var dataItem = this.dataItem(e.item.index());
    alert(e.id);
};

// [ Proc ] Query Operator.init
var qOperator = {
    init: function () {

        // [Init] Operators - String 
        $("input[id^='qOp_s_']").each(function () {
            var idx = parseInt($(this).attr("defaultidx"))
            $(this).kendoDropDownList({
                dataTextField: "label",
                dataValueField: "symbol",
                dataSource: qOperators.string,
                index: idx,
                select: on_qOpSelect
            });
        });

        // [Init] Input - Date 
        $(".qType_d input[id^='qInput_']").each(function () {
            $(this).kendoDatePicker();
        });

        // [Init] Operators - Numeric 
        $("input[id^='qOp_n_']").each(function () {
            var idx = parseInt($(this).attr("defaultidx"))
            $(this).kendoDropDownList({
                dataTextField: "label",
                dataValueField: "symbol",
                dataSource: qOperators.numeric,
                index: idx,
                select: on_qOpSelect
            });
        });

        // [Init] Operators - Date 
        $("input[id^='qOp_d_']").each(function () {
            var idx = parseInt($(this).attr("defaultidx"))
            $(this).kendoDropDownList({
                dataTextField: "label",
                dataValueField: "symbol",
                dataSource: qOperators.date,
                index: idx,
                select: on_qOpSelect
            });
        });

    }
};

// [ Proc ] Show/Hide input(s)
var qInput = {
    refresh: function () {

    }
}