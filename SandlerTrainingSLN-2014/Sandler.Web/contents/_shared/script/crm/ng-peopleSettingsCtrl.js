/* [[[ Tasks Select ]]] - BT */
    
        function ng_peopleSettingsCtrl ($scope, $http) {

            angular.element(document).ready(function () {
                $("#tab_flag").click(function () {
                    aRenderer.openPage('/crm/Settings/Flag', 'tabContent_pSettings');
                });
                $("#tab_keyword").click(function () {
                    aRenderer.openPage('/crm/Settings/Keyword', 'tabContent_pSettings');
                });
                $("#tab_club").click(function () {
                    aRenderer.openPage('/crm/Settings/Club', 'tabContent_pSettings');
                });
                $("#tab_clubStatus").click(function () {
                    aRenderer.openPage('/crm/Settings/ClubStatus', 'tabContent_pSettings');
                });
                $("#tab_cFlag").click(function () {
                    aRenderer.openPage('/crm/Settings/ContactFlag', 'tabContent_pSettings');
                });

                /* Default - Flag */
                aRenderer.openPage('/crm/Settings/Flag', 'tabContent_pSettings');
            });

        };

