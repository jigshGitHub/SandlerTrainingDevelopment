
    
//app_.controller('ng_moneySettingsCtrl', ['$scope', '$http',
function ng_moneySettingsCtrl($scope, $http) {

    angular.element(document).ready(function () {

        $("#tab_program").click(function () {
            aRenderer.openPage('/crm/Settings/Program', 'tabContent_pSettings');
        });
        $("#tab_initiative").click(function () {
            aRenderer.openPage('/crm/Settings/Initiative', 'tabContent_pSettings');
        });
        $("#tab_source").click(function () {
            aRenderer.openPage('/crm/Settings/Source', 'tabContent_pSettings');
        });
        //Default - Program 
        aRenderer.openPage('/crm/Settings/Program', 'tabContent_pSettings');
    });

};
        //}]);

