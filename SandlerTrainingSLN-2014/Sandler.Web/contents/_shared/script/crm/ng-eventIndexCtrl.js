/* [[[ Event Index ]]] - BT */

        function ng_eventIndexCtrl($scope, $http) {

            angular.element(document).ready(function () {
                 //Default - List View*@
                 aRenderer.openPage("/crm/Event/EventL", "dvEventContent");

                $('ul.nav.nav-pills li a').click(function () {
                    $(this).parent().addClass('active').siblings().removeClass('active');

                    if ($(this).text() == "Calendar")
                        aRenderer.openPage("/crm/Event/EventC", "dvEventContent");
                    else
                        aRenderer.openPage("/crm/Event/EventL", "dvEventContent");
                });

            });

        };

//console.log('I was run.');
