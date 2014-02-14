
    
//app_.controller('ng_complianceSettingsCtrl', ['$scope', '$http',
function ng_complianceSettingsCtrl($scope, $http) {

    angular.element(document).ready(function () {

        $("#tab_Exception").click(function () {
            aRenderer.openPage('/crm/Settings/ExceptionCode', 'tabContent_pSettings');
        });
        $("#tab_Chart").click(function () {
            aRenderer.openPage('/crm/Settings/ChartAccounts', 'tabContent_pSettings');
        });
        $("#tab_FEC").click(function () {
            aRenderer.openPage('/crm/Settings/FECdescriptions', 'tabContent_pSettings');
        });

        //Default - Exception Code
        aRenderer.openPage('/crm/Settings/ExceptionCode', 'tabContent_pSettings');
    });
};
        //}]);

