/* [[[ Response Analysis ]]] - BT */

    var respAnalysis;

    //@* Tracking whether there is unsaved change(s). *@
    ko.dirtyFlag_pe = function (root, isInitiallyDirty) {

        var result = function () { },
            _initialState = ko.observable(ko.toJSON(root)),
            _isInitiallyDirty = ko.observable(isInitiallyDirty);

        result.isDirty = ko.computed(function () {
            return _isInitiallyDirty() || _initialState() !== ko.toJSON(root);
        });

        result.reset = function () {
            _initialState(ko.toJSON(root));
            _isInitiallyDirty(false);
        };

        return result;
    };

    //@* View Model*@
    function respAnalysis_viewModel() {
        var self = this;
        //For Programs
        self.PROGRAM = ko.observable();
        var projectPrograms = jsonDataCaller.syncCall("/crm/api/ProjectPrograms", null);
        self.programData = ko.observableArray(projectPrograms);
        //For Packages
        var projectPackages = jsonDataCaller.syncCall("/crm/api/GetPackagesForProgram", { id: 0 });
        self.packageData = ko.observableArray([]);
        ko.utils.arrayForEach(projectPackages, function (element, index) {
            self.packageData.push(element.PKGEDESC);
        });
        //For selected values - Packages
        self.selectedPkgItems = ko.observableArray(["(Ignore)"]);
        // Whenever the Program changes, reset the Package selection
        self.PROGRAM.subscribe(function () {
            projectPackages = jsonDataCaller.syncCall("/crm/api/GetPackagesForProgram", { id: self.PROGRAM() });
            //clear the array and set as before
            self.packageData([]);
            self.selectedPkgItems([]);
            self.selectedPkgItems.push("(Ignore)");
            ko.utils.arrayForEach(projectPackages, function (element, index) {
                self.packageData.push(element.PKGEDESC);
            });
        });
        //For Mail Date Section
        self.MAILDTE = ko.observable(false);
        self.STARTDTEc = ko.observable('');
        self.ENDDTEc = ko.observable('');
        self.STARTDTE = ko.computed(function () {
            return dateUtil_.toNoTimeZone(self.STARTDTEc());
        });
        self.ENDDTE = ko.computed(function () {
            return dateUtil_.toNoTimeZone(self.ENDDTEc());
        });
        self.MAILDTE.subscribe(function () {
            //If Mail date checkbox is NOT selected then clear the Start and End Date Selection 
            if (!self.MAILDTE()) {
                self.STARTDTEc(null);
                self.ENDDTEc(null);
            }
        });
        //Right side Options
        self.SHOWSUBTOTBYPCKG = ko.observable(true);
        self.SHOWSUBTOTBYGRP = ko.observable(false);
        self.SHOWSUBTOTBYLIST = ko.observable(false);
        self.SHOWDETAILS = ko.observable(true);
        //For Dirty Flag setting - Has to be at the End so self has everything which needs to be tracked
        self.dirtyFlag = new ko.dirtyFlag_pe(self);
        self.isDirty = ko.computed(function () {
            return self.dirtyFlag.isDirty()
        }, this);
        self.dirtyFlag.reset();
        
        self.RunReport = function () {
            ValidateAndProcess(self);
        };
    }

    function ValidateAndProcess(vwmdlData) {

        //@*Client side validation*@
        if (!vwmdlData.PROGRAM() || vwmdlData.PROGRAM() == "0") {
            showNoti_.error('Program is Required!!', false);
            $('#respAna_program').focus();
            return;
        }
        //@*For Mail Date selection - Start Date*@
        if (vwmdlData.MAILDTE() && vwmdlData.STARTDTE() == null) {
            showNoti_.error('Start Date is Required!!', false);
            $('#mail_startDte').focus();
            return;
        }
        //@*For Mail Date selection - End Date*@
        if (vwmdlData.MAILDTE() && vwmdlData.ENDDTE() == null) {
            showNoti_.error('End Date is Required!!', false);
            $('#mail_endDte').focus();
            return;
        }
        if (!vwmdlData.SHOWSUBTOTBYPCKG() && !vwmdlData.SHOWSUBTOTBYGRP() && !vwmdlData.SHOWSUBTOTBYLIST() && !vwmdlData.SHOWDETAILS()) {
            showNoti_.error('Select at lease one option form the Output section.!!', false);
            return;
        }
        //@*All ok so let us process the Report Request*@
        $.post("/Report/ProcessReport",
            {   SHOWSUBTOTBYPCKG: vwmdlData.SHOWSUBTOTBYPCKG(),
                SHOWSUBTOTBYGRP: vwmdlData.SHOWSUBTOTBYGRP(),
                SHOWSUBTOTBYLIST: vwmdlData.SHOWSUBTOTBYLIST(),
                SHOWDETAILS: vwmdlData.SHOWDETAILS(),
                PROGRAM: vwmdlData.PROGRAM(),
                MAILDTE: vwmdlData.MAILDTE,
                SELECTEDPKGITEMS: ko.toJSON(vwmdlData.selectedPkgItems().toString()),
                STARTDTE: vwmdlData.STARTDTE(),
                ENDDTE: vwmdlData.ENDDTE(),
                PROGID: vwmdlData.PROGRAM()
            },
            function (data) {
                if (data.success) {
                    var url = "/Report/ShowReport?p_key=" + data.key;
                    reportWindow = window.open(url, "ResponseAnalysisReport", "menubar=1,resizable=1,width=1060,height=650");
                    //@*Move the window little bit*@
                    reportWindow.moveTo(100, 100);
                }
                else {
                    //@*Message if anything is wrong*@
                    showNoti_.error(data.message, true);
                }
            });
}
    

        function ng_respAnalysisCtrl($scope, $http) {

            angular.element(document).ready(function () {
                
                respAnalysis = new respAnalysis_viewModel();
                ko.applyBindings(respAnalysis, document.getElementById("respAnalysis_body"));

            });

        };

//console.log('I was run - Resp Analysis.');
