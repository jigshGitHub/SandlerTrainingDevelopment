﻿

function CheckFileName() {
    /*Let us have the fileName*/
    var fileName = document.getElementById("fileName").value;

    if (fileName == "") {
        showNoti_.error("Browse to upload a valid file with xls / xlsx extension", true);
        return false;
    }
    else if (fileName.split(".")[1].toUpperCase() == "XLS" || fileName.split(".")[1].toUpperCase() == "XLSX") {
        /*we have file so submit*/
        document.ImpForm.submit();
        isAttachDone = true;
        showNoti_.progress(NOTIFICMSG.PROCESSING, false);
        return true;
    }
    else {
        showNoti_.error("System could not read extension for the File : " + fileName + ". Choose a valid file with xls/xlsx extensions. Please make sure you do not have additional . in the filename.", true);
        return false;
    }
}

function UploadFile_Complete() {

    /*Only show if file is attached*/
    if (isAttachDone == true) {

        /*Reset the preview form so the file won't get uploaded again*/
        document.getElementById("ImpForm").reset();

        /*Grab the content of the textarea we named jsonResult. This should be loaded into the hidden iFrame*/
        var newFile = $.parseJSON($("#UploadTarget").contents().find("#jsonResult")[0].innerHTML);

        /*If there was an error, display it to the user*/
        if (newFile.IsValid == false) {
            showNoti_.error(newFile.Message, true);
            showNoti_.hide();
            isAttachDone = false;
            return;
        }

        /*Let us show file data*/
        var previewDiv = document.getElementById("previewgrid");
        previewDiv.style.visibility = "visible";
        previewDiv.style.overflow = "scroll";
        previewDiv.innerHTML = newFile.grid;
        /*Store fileName in the Hidden field*/
        var hiddenfn = document.getElementById("uploadedfilename")
        hiddenfn.value = newFile.uploadedfilename;
        /*Step2 details : first display the step and then inside div or form*/
        aRenderer.openPage("/crm/Import/GetStep2Details?importcategory=" + $("#importcategory").val(), "impTypediv");
        $("#step2").show();

        $("#impTypediv").show();

        /*Step3 details : first display the step and then inside div or form*/
        /*Import type selection is set to 1 as default so we are passing 1 here*/
        //$("#mapgrid").load('@Url.Action("GetColumnMap", "Import")', { uploadedfilename: hiddenfn.value, tabname: "People", impTypeSel: 1 });          
        aRenderer.openPage_w_jsonParam("/crm/Import/GetColumnMap", { uploadedfilename: hiddenfn.value, tabname: "People", impTypeSel: 1 }, "mapgrid");

        $("#step3").show();

        //$("#MappingForm").show();
        /*Also display Validate step*/
        $("#step4").show();

        $("#importdiv").show();

        /*Now reset the indicator after data is displayed*/
        isAttachDone = false;
        /*hide other Steps if they are open and enable buttons - they may be disabled in previoius run*/
        $("#step5").hide();
        $("#step6").hide();
        $("#validateData").removeAttr('disabled');
        $("#importData").removeAttr('disabled');
        $("#ddlImpTypes").removeAttr('disabled');

        showNoti_.hide();
    }

}

function Validate()
{
    $("#validateData").unbind("click").bind("click", function () {        
        $('#import').block({ message: null });
        showNoti_.progress(NOTIFICMSG.PROCESSING, false);       
        /*Now Make the Ajax Call*/
        $.ajax({
            type: "POST",
            //url: '@Url.Action("ValidateData", "Import")',
            url: "/crm/Import/ValidateData",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify({
                /*Import type data*/
                impTypeFieldSel: $("#ddlImpTypes").val(),
                impTypeFieldSelText: $("#ddlImpTypes option:selected").text(),
                defaultBatchDate: $('#defaultBatchDate').val(),
                interactionDate: $('#interactionDate').val(),
                dmFundFieldSel: $("#ddlfund").val(),
                dmFundFieldSelText: $("#ddlfund option:selected").text(),
                defaultBatch: $("#defaultBatch").val(),
                noOfGifts: $("#noOfGifts").val(),
                totalAmount: $("#totalAmount").val(),
                source: $("#source").val(),
                IsOverwriteOk: $("#IsOverwriteOk").val(),
                lkChannelFieldSel: $("#ddlChannel").val(),
                lkChannelFieldSelText: $("#ddlIntfund option:selected").text(),
                lkPeopleCodeFieldSel: $("#ddlPeopleCode").val(),
                lkPeopleCodeFieldSelText: $("#ddlPeopleCode option:selected").text(),
                intfundTypeFieldSel: $("#ddlIntfund").val(),
                intfundTypeFieldSelText: $("#ddlIntfund option:selected").text(),
                lkEventCodeFieldSel: $("#ddlEventCode").data("kendoAutoComplete").value() == null ? 0 : $("#ddlEventCode").data("kendoAutoComplete").value().split(' - ')[0],
                lkEventCodeFieldSelText: $("#ddlEventCode").data("kendoAutoComplete").value(),
                /*Mapping Data*/
                mappingData: $("#MappingForm").serialize(),
                /*Uploaded File Name*/
                uploadedFileName: $("#uploadedfilename").val()
            }),
            success: function (result) {
                if (result.tempTableName != "" && result.impTypeSelection != null) {
                    aRenderer.openPage_w_jsonParam("/crm/Import/GetStep5Details", { tmptbl: result.tempTableName, ImpType: result.impTypeSelection, success: result.success }, "importdiv");
                    /*Show the Import Data - Step 5*/
                    //$("#importdiv").load('@Url.Action("GetStep5Details", "Import")', {
                    //    tmptbl: result.tempTableName,
                    //    ImpType: result.impTypeSelection,
                    //    success: result.success
                    //});
                    $("#step5").show();
                    $("#importdiv").show();
                    $('#import').unblock();
                }
                /*Show Message if any Error*/
                if (result.success == false) {
                    showNoti_.hide();
                    showNoti_.error(result.msg, true);
                    $("#MappingForm").show();
                    $('#import').unblock();
                }
                /*Show Message how many validated if No Error*/
                if (result.success == true) {
                    showNoti_.hide();
                    showNoti_.info(result.recordCount + " records are validated.");
                    $('#import').unblock();

                }
            },
            error: function (result) {
                showNoti_.hide();
                $("#step5").hide();
                $("#importdiv").hide();
                showNoti_.error("There is some problem in performing the Import(Validation step) operation. Please try again later.", true);
                $('#import').unblock();
            }
        });
    }); //end button click
}

/*We set this to know we do not have file attached*/
var isAttachDone = false;

//app_.controller('ng_ImportCtrl', ['$scope', '$http',
function ng_ImportCtrl($scope, $http) {

    angular.element(document).ready(function () {

        /*For Accordion*/
        $("#importaccordion").accordion({
            collapsible: true, heightStyle: "content"
        });
        /*Hide other steps for now*/
        $("#step2").hide();
        $("#step3").hide();
        $("#step4").hide();
        $("#step5").hide();
        $("#step6").hide();

        Validate();
    });

};
//]);

console.log('ng-importctrl');