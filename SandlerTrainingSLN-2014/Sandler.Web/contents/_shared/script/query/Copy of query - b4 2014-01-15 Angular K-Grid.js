
/*  //////////////////////////////////////////
     (Query Template)
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\JB\\\ */

var qOperators = {

    string: [
        { symbol: "[[ eLIKE ]]", label: "Equal to" },
        { symbol: "[[ LIKE% ]]", label: "Starts with", fixChar: '*', fixCharPos: 'e' },
        { symbol: "[[ %LIKE ]]", label: "Ends with", fixChar: '*', fixCharPos: 's' },
        { symbol: "[[ %LIKE% ]]", label: "Contains", fixChar: '*', fixCharPos: 'b' },
        { symbol: "[[ NULL ]]", label: "is empty", fixValue: '(Empty)' },
        { symbol: "[[ !NULL ]]", label: "is NOT empty", fixValue: '(Not Empty)' },
        { symbol: "[[ IN ]]", label: "in list of" },
        { symbol: "[[ !IN ]]", label: "NOT in list" }
    ],

    numeric: [
        { symbol: "[[: ]]", label: "Equal to" },
        { symbol: "[[ >= ]]", label: "Greater than/Equals to", fixChar: '+', fixCharPos: 'e' },
        { symbol: "[[ <= ]]", label: "Less than/Equal to", fixChar: '- ', fixCharPos: 's' },
        { symbol: "[[ != ]]", label: "NOT Equal to", fixChar: '<> ', fixCharPos: 's' },
        { symbol: "[[ nBTW ]]", label: "Between", fixChar: ' - ', fixCharPos: 'm' }
    ],

    currency: [
        { symbol: "[[:$ ]]", label: "Equal to" },
        { symbol: "[[ >=$ ]]", label: "Greater than/Equals to", fixChar: '+', fixCharPos: 'e' },
        { symbol: "[[ <=$ ]]", label: "Less than/Equal to", fixChar: '- ', fixCharPos: 's' },
        { symbol: "[[ !=$ ]]", label: "NOT Equal to", fixChar: '<>', fixCharPos: 's' },
        { symbol: "[[ cBTW ]]", label: "Between", fixChar: ' - ', fixCharPos: 'm' }
    ],

    date: [
        { symbol: "[[ dYET ]]", label: "(Specify)" },
        { symbol: "[[ On ]]", label: "On" },
        { symbol: "[[ On/After ]]", label: "On/After", fixChar: ' ~', fixCharPos: 'e' },
        { symbol: "[[ On/Before ]]", label: "On/Before", fixChar: '~ ', fixCharPos: 's' },
        { symbol: "[[ dBTW ]]", label: "Between", fixChar: ' ~ ', fixCharPos: 'm' },
        { symbol: "[[ FX-today ]]", label: "Today", fixValue: '(Today)' },
        { symbol: "[[ FX-wk ]]", label: "This Week", fixValue: '(This Week)' },
        { symbol: "[[ FX-lwk ]]", label: "Last Week", fixValue: '(Last Week)' },
        { symbol: "[[ FX-mo ]]", label: "This Month", fixValue: '(This Month)' },
        { symbol: "[[ FX-lmo ]]", label: "Last Month", fixValue: '(Last Month)' },
        { symbol: "[[ FX-yr ]]", label: "This Year", fixValue: '(This Year)' },
        { symbol: "[[ FX-lyr ]]", label: "Last Year", fixValue: '(Last Year)' },
        { symbol: "[[ FX-l7d ]]", label: "Last 7 Days", fixValue: '(Last 7 Days)' },
        { symbol: "[[ FX-l30d ]]", label: "Last 30 Days", fixValue: '(Last 30 Days)' },
        { symbol: "[[ FX-l3m ]]", label: "Last 3 Months", fixValue: '(Last 3 Months)' },
        { symbol: "[[ FX-l1y ]]", label: "Last 1 Year", fixValue: '(Last 1 Year)' }
    ]
};

/* ///// [[[ qItem_viewModel ]]]  /////////////////////////*/
function qItem_viewModel(data, parent) {

    var self = this;
    self.parent = parent;
    self.id = data.id;
    self.fieldType = data.fieldType;
    self.fieldCaption = data.fieldCaption;
    self.fieldCaptionDetails = data.fieldCaptionDetails;

    self.defaultOperatorIndex = data.default_operatorIdx;
    self.operator = {
        dataSource: {
            data: (self.fieldType == 'n' ? qOperators.numeric : (self.fieldType == 'c' ? qOperators.currency : (self.fieldType == 'd' ? qOperators.date : qOperators.string)))
        },
        dataTextField: "label",
        dataValueField: "symbol",
        index: self.defaultOperatorIndex
    };

    self.opValue = self.operator.dataSource.data[self.defaultOperatorIndex].symbol;

    self.valuef = function () {
        
        var v = '';
        /* No choice has been made yet */
        if (self.opValue.toString().indexOf('YET') >= 0) {
            return '';
        }
        /* Operator itself is a value */
        var v = '';
        if (self.opValue.toString().indexOf('NULL') >= 0
            || self.opValue.toString().indexOf('FX-') >= 0) {
            $.each(self.operator.dataSource.data, function (idx, item) {
                if (item.symbol == self.opValue) {
                    if (item.fixValue != '')
                        v = item.fixValue;
                    return;
                }
            });
            if (v != '')
                return v;
        }
        /* Formatted Value #1 */
        var v1 = '';
        if (self.value1!=null && self.value1!='') {
            if (self.fieldType == 'c')
                v1 = accounting.formatMoney(self.value1);
            else if (self.fieldType == 'd') {
                v1 = dateUtil_.toNoTimeZone(self.value1);
                /*var a_date = new Date(self.value1);
                v1 = a_date.toLocaleDateString();*/
            }
            else
                v1 = self.value1;
        }
        /* Formatted Value #1 */
        var v2 = '';
        if (self.value2!=null && self.value2!='') {
            if (self.fieldType == 'c')
                v2 = accounting.formatMoney(self.value2);
            else if (self.fieldType == 'd') {
                v2 = dateUtil_.toNoTimeZone(self.value2);
                /*var a_date = new Date(self.value2);
                v2 = a_date.toLocaleDateString();*/
            }
            else
                v2 = self.value2;
        }

        /* No value given yet */
        if (v1 == '')
        return '';

        /* Between */
        if (self.opValue.toString().indexOf('BTW') >= 0) {

            if (v1 != '' && v2 != '') {
                /* Placing a 'Between' character if applicable */
                $.each(self.operator.dataSource.data, function (idx, item) {
                    if (item.symbol == self.opValue) {
                        if (item.fixChar != '')
                            v = v1 + item.fixChar + v2;
                        return;
                }
                });
                if (v != '')
                    return v;
            }
            else /* Must have both values */
                return '';
        }

        /* Only Value1 */
        /* Placing a Pre(orSuf)fix character if applicable */
        if (v1 != '') {
            $.each(self.operator.dataSource.data, function (idx, item) {
                if (item.symbol == self.opValue) {
                    if (item.fixChar != '')
                        v = (item.fixCharPos == 's' || item.fixCharPos == 'b' ? item.fixChar : '') + v1 + (item.fixCharPos == 'e' || item.fixCharPos == 'b' ? item.fixChar : '');
                    return;
                }
            });
        }

        return v;
    };

    self.selected = function () { return (self.value1 == 'aaa'); };
    self.typeLabel = function () { return (self.valuef() != '' ? 'label label-primary' : 'label label-default light'); };
    self.typeIcon = (self.fieldType == 'd' ? 'fa fa-calendar' : (self.fieldType == 'n' ? 'fa fa-sort-numeric-asc' : (self.fieldType == 'c' ? 'fa fa-dollar' : 'fa fa-font')));

    self.reset = function () {
        self.opValue = self.operator.dataSource.data[self.defaultOperatorIndex].symbol;
        self.value1 = null;
        self.value2 = null;
    };
}

/* ///// [[[ qPanel_viewModel ]]]  ////////////////////////*/
function qPanel_viewModel(data, parent) {
    var self = this;
    self.parent = parent;
    self.idx = parent.qPanels.length;
    self.name = data.name;
    self.caption = data.caption;
    self.qItems = [];
    angular.forEach(data.qItems, function (data) {
        this.push(new qItem_viewModel(data, self));
    }, self.qItems);

    self.isCollapsed = (self.idx > 0);

    self.toggle = function () {

        self.isCollapsed = !self.isCollapsed;
        /* // Collapse Other Panels
        if (!self.isCollapsed) {
            angular.forEach(parent.qPanels, function (data) {
                if (data.name != self.name && !data.isCollapsed)
                    data.isCollapsed = true;
            });
        }*/
    };        
};

/* ///// [[[ qDef_viewModel ]]]  //////////////////////////*/
function qDef_viewModel(data) {

    var self = this;
    self.name = data.name;
    self.caption = data.caption;
    
    self.qPanels = [];
    angular.forEach(data.qPanels, function (data) {
        this.push(new qPanel_viewModel(data, self));
    }, self.qPanels);
    
    self.searchText = '';

    //self.gridData = q_gridDataSource(url, fields, searchText, null);

    self.quickTextSearch = function () {

    };

    self.selections = function () {
        var activeQs = [];
        angular.forEach(self.qPanels, function (panel) {

            angular.forEach(panel.qItems, function (item) {
                var valuef_ = item.valuef();
                if (valuef_ != '')
                    this.push({ id: item.id, filter: item.valuef_ });
            }, activeQs);

        });
        return activeQs;
    };

    self.query = function () {
        alert(self.searchText);
        return;

        console.log(self.selections());
        $('#dv_qContent').block({ message: null });

        /*
        dao_.send("/crm/api/Mony/calcAlloc/@Model.pageData1", null,
            function () {
                $("#mm_Mony").unblock();
                self.Refresh();
                monypendVM.Refresh();
            }
        );
        */

    };

    /* #### DOES NOT WORK.  NEED TO WORK ON ############################ */
    self.panelSelector = {
        dataSource: {
            data: [{ label: "selection1", symbol: "symbol1" }, { label: "selection2", symbol: "symbol2" }]
        },
        dataTextField: "label",
        dataValueField: "symbol",
        optionLabel: "Select A Thing"
    };


    /*
    self.operator = {
        dataSource: {
            data: (self.fieldType == 'n' ? qOperators.numeric : (self.fieldType == 'c' ? qOperators.currency : (self.fieldType == 'd' ? qOperators.date : qOperators.string)))
        },
        dataTextField: "label",
        dataValueField: "symbol",
        index: self.defaultOperatorIndex
    };
    */

    /*
        // Expand the very first panel
        $("div[id^='pnFilterBody_']:first").addClass('in');
        
    */
};

/* ///// [[[ q_gridDataSource - (Search Result) Kendo Grid Data Source ]]] ///*/
function q_gridDataSource(url, fields, searchText, searchData) {
    /* 
    ------------------
     Parameters (eg.)
    ------------------
        url = "crm/people/searchPeople" 
        fields = {
                    PID: { type: "number" },
                    FNAME: { type: "string" },
                    LGIFT: { type: "number" },
                    LGIFTDTE: { type: "date" }
                }
    */
    var dataSource = {
        type: "json",
        transport: {
            read: {
                type: 'POST',
                url: url,
                dataType: "json",
                data: { searchText: searchText, searchData: searchData }
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: fields
            }
        },
        pageSize: 10,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

/* ///// [[[ q_kendoGridData - (Search Result) Kendo Grid Data ]]] ////////*/
function q_kendoGridData(url, fields, gridColumns, searchText, searchData) {
    /* 
    ------------------
     Parameters (eg.)
    ------------------
        gridColumns = 
            [
                    { command: { text: "view", click: showDetails }, title: " ", width: "87px" },
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
                    }
            ];
    */
    var dataSource = q_gridDataSource(url, fields, searchText, searchData)
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
        columns: gridColumns
    }
    return kendoGridData;
}
