
function scheduler_edit(e) {
        e.preventDefault();
        //@*get the date selected if the user - we will pass it only if it is add operation*@
        var selDte = kendo.toString(new Date(e.event.start), "d");
        //Now first update the Lable as per selected Date
        taskF.TaskLabel("To do List for : " + selDte);
        //Now bind the Kendo Grid
        var kendoGridData = get_kendoGridData(selDte);
        $("#MyTasksSearchgrid").kendoGrid(kendoGridData);
  }

 //Schedular Data Source
 function get_DataSource() {

     var dataSource =
           {
            type: "json",
            transport: {
                read: {
                    url: "api/OurTasksView/",
                    dataType: "json"
                }
            },
            schema: {
                data: "results",
                model: {
                    id: "UniqueID",
                    fields: {
                        title: { from: "Topic", defaultValue: "No Title", type: "string" },
                        start: { type: "date", from: "TaskDate", format: "{0:MM/dd/yy hh:mm}" },
                        end: { type: "date", from: "NextDay", format: "{0:MM/dd/yy hh:mm}" }
                    }
                }
            }

        };
        return dataSource;
    }

//Schdular Defination
 function get_SchedularData() {
     var dataSource = get_DataSource()

        var SchedularData = {
            dataSource: dataSource,
            date: new Date(),
            height: 600,
            edit: scheduler_edit,
            editable: {
                destroy: false,
                resize: false
            },
            views: [
                { type: "month" }
            ]

        }
        return SchedularData;
 }
  
function ng_ourtasksCtrl($scope, $http) {
    angular.element(document).ready(function () {
        //Let us fill up the Schedular Data first
        var SchedularData = get_SchedularData();
        $("#ourscheduler").kendoScheduler(SchedularData);
    });
};