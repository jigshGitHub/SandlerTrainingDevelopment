// Get lookup data
var fundData = jsonDataCaller.syncCall("/crm/api/FundCodes?$orderby=FUNDCODE", null);
//alert(JSON.stringify(fundData));
fundData.unshift({ FUNDID: 0, FUNDCODE: "", FUNDDESC: "", CODEDESCRIP: "Select Fund ...", fundType: "", ACTIVE: 0 });

var exportType = jsonDataCaller.syncCall("/crm/api/fecExportTypes", null);
//alert(JSON.stringify(exportType));

var formType = jsonDataCaller.syncCall("/crm/api/fecFormTypes", null);

var rptCode = jsonDataCaller.syncCall("/crm/api/fecReportCodes", null);

// View Model
var fecExportVM;
var fecExport_viewModel = function () {
    var self = this;
    self.EXPORTTYPE = ko.observable("");
    self.REPORTCODE = ko.observable("");
    self.FORMTYPE = ko.observable("");
    self.FUNDCODE1 = ko.observable("");
    self.FUNDCODE2 = ko.observable("");
    self.FUNDCODE3 = ko.observable("");
    self.BEGINDTEc = ko.observable();
    self.BEGINDTE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.BEGINDTEc());
    });
    self.ENDDTEc = ko.observable();
    self.ENDDTE = ko.computed(function () {
        return dateUtil_.toNoTimeZone(self.ENDDTEc());
    });
    self.CUMTOT = ko.observable(0);
    self.LOBBYIST = ko.observable(false);
    self.ROLLUP = ko.observable(false);
    self.REPORTED = ko.observable(false);

    self.canexport = ko.computed(function() {
        if (self.FORMTYPE() != "" && self.BEGINDTE() != null && self.ENDDTE() != null && self.FUNDCODE1() != "" && (self.EXPORTTYPE() != "" || self.FORMTYPE() == "FORM6" || self.FORMTYPE() == "FORM3L"))
            return true;
        else
            return false;
    });

    self.exportnow = function () {
        //alert(ko.toJSON(self));
        var json = ko.toJSON(self);
        var url = "/FEC/ExportNow?" + $.param({ "json": json });
        window.location.href = url; 
    };

    self.rptcodeChange = function (e) {
        var dataItem = this.dataItem(e.item.index());
        var today = new Date();
        var year = today.getFullYear();
        switch (dataItem.rptcode) {
            case "Q1": {
                self.BEGINDTEc("1/1/" + year.toString());
                self.ENDDTEc("3/31/" + year.toString());
                break;
            }
            case "Q2": {
                self.BEGINDTEc("4/1/" + year.toString());
                self.ENDDTEc("6/30/" + year.toString());
                break;
            }
            case "Q3": {
                self.BEGINDTEc("7/1/" + year.toString());
                self.ENDDTEc("9/30/" + year.toString());
                break;
            }
            case "YE": {
                self.BEGINDTEc("10/1/" + (year - 1).toString());
                self.ENDDTEc("12/31/" + (year - 1).toString());
                break;
            }
            case "M2": {
                self.BEGINDTEc("1/1/" + year.toString());
                self.ENDDTEc("1/31/" + year.toString());
                break;
            }
            case "M3": {
                self.BEGINDTEc("2/1/" + year.toString());
                if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
                    self.ENDDTEc("2/29/" + year.toString());
                else
                    self.ENDDTEc("2/28/" + year.toString());
                break;
            }
            case "M4": {
                self.BEGINDTEc("3/1/" + year.toString());
                self.ENDDTEc("3/31/" + year.toString());
                break;
            }
            case "M5": {
                self.BEGINDTEc("4/1/" + year.toString());
                self.ENDDTEc("4/30/" + year.toString());
                break;
            }
            case "M6": {
                self.BEGINDTEc("5/1/" + year.toString());
                self.ENDDTEc("5/31/" + year.toString());
                break;
            }
            case "M7": {
                self.BEGINDTEc("6/1/" + year.toString());
                self.ENDDTEc("6/30/" + year.toString());
                break;
            }
            case "M8": {
                self.BEGINDTEc("7/1/" + year.toString());
                self.ENDDTEc("7/31/" + year.toString());
                break;
            }
            case "M9": {
                self.BEGINDTEc("8/1/" + year.toString());
                self.ENDDTEc("8/31/" + year.toString());
                break;
            }
            case "M10": {
                self.BEGINDTEc("9/1/" + year.toString());
                self.ENDDTEc("9/30/" + year.toString());
                break;
            }
            case "M11": {
                self.BEGINDTEc("10/1/" + year.toString());
                self.ENDDTEc("10/31/" + year.toString());
                break;
            }
            case "M12": {
                self.BEGINDTEc("11/1/" + year.toString());
                self.ENDDTEc("11/30/" + year.toString());
                break;
            }
            case "MY": {
                self.BEGINDTEc("1/1/" + year.toString());
                self.ENDDTEc("6/30/" + year.toString());
                break;
            }
            case "MYE": {
                self.BEGINDTEc("12/1/" + (year - 1).toString());
                self.ENDDTEc("12/31/" + (year - 1).toString());
                break;
            }
            default: {
                self.BEGINDTEc(null);
                self.ENDDTEc(null);
                break;
            }
        }
    };
};

//ko extenders - money
var cleanInput = function (value) {
    return parseFloat(value.replace(/[^0-9.-]/, ''));
}

var formatInput = function (value) {
    value = value ? value : 0;
    toks = value.toFixed(2).replace('-', '').split('.');
    var display = $.map(toks[0].split('').reverse(), function (elm, i) {
        return [(i % 3 == 0 && i > 0 ? ',' : ''), elm];
    }).reverse().join('') + '.' + toks[1];

    return value < 0 ? '(' + display + ')' : display;
}

ko.bindingHandlers.money = {
    init: function (elm, valueAccessor) {
        $(elm).change(function () {
            valueAccessor()(cleanInput(elm.value));
        }).addClass('money');
    },
    update: function (elm, valueAccessor, allBindingsAccessor) {
        var value = ko.utils.unwrapObservable(valueAccessor())
        $elm = $(elm),
        method = $elm.is(":input") ? "val" : "html";

        if (value)
        {
            $elm[method](formatInput(value)).toggleClass('negative', value < 0);
        }
    }
};


function ng_FECExportCtrl($scope, $http) {

    angular.element(document).ready(function () {
        // Bind Model
        fecExportVM = new fecExport_viewModel();
        element = document.getElementById("FECExport");
        ko.applyBindings(fecExportVM, element);
    });
};