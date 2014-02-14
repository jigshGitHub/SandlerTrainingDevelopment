/* [[[ Voter Mapping  ]]] - BT */
   
   function BeginTrial() {
       //We need to start the Trial
       window.open("#/crm/Political/BeginVMTrial","_self");//Here _self will replace the current content page
   }

   function ng_voterMappingCtrl($scope, $http) {

            angular.element(document).ready(function () {
                
                //$('#modelessPanel').toggle("slide");
                $("#States").kendoDropDownList();

                //Display Youtube video as per Browser
                var ua = window.navigator.userAgent;
                
                var msie = ua.indexOf("MSIE ");
                //alert(msie);

                if (msie > 0) {
                   $('#nonieDiv').hide();
                }
                else {
                   $('#ieDiv').hide();
                }
                //Launch VM Page
                $(function () {
                    $('#LaunchForm').submit(function () {

                        if ($('#States').val() == "0") {
                            showNoti_.error('Please select State to proceed!!', false);
                            $('#States').focus();
                            return false;
                        }

                        $.ajax({
                            url: this.action,
                            type: this.method,
                            data: { States: $('#States').val() },
                            success: function (result) {
                                //window.location.href = result;
                                //Once we get VM URL - Open new window
                                //Parameters: URL, windowName, windowSize
                                window.open(result, '');
                                //window.open(result, '', "width=600,height=600,scrollbars=yes"); 
                                //var win = window.open(result, '_blank', '');
                                //win.focus();
                            }
                        });
                        return false;
                    });
                });

            });

        };

