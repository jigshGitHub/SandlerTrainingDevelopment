function EnterOnlyNumeric() {
    if (event.keyCode < 48 || event.keyCode > 57)
        event.returnValue = false;

}

//Javascript to add to your aspx page
function ValidateModuleList(source, args) {
    //alert("hello");
    var chkListModules = document.getElementById('MainContent_chkListGroup');
    var chkListinputs = chkListModules.getElementsByTagName("input");
    for (var i = 0; i < chkListinputs.length; i++) {
        if (chkListinputs[i].checked) {
            args.IsValid = true;
            return;
        }
    }
    //Now check if user has entered anything in the Email Address textbox
    var EmailAdrs = document.getElementById('MainContent_txtEmailAdrs');
    //alert(EmailAdrs.value);
    if (EmailAdrs.value != "") {
        args.IsValid = true;
        return;
    }
    //Or else we need to show the message
    args.IsValid = false;
}
 
//Javascript to add to your aspx page
function rdbValidations(source, args)
{
    //alert("hello");
    var rdbOptions = document.getElementById('MainContent_rdbOptions');
    var rdbinputs = rdbOptions.getElementsByTagName("input");
    for (var i = 0; i < rdbinputs.length; i++) {
        if (rdbinputs[i].checked)
        {
            args.IsValid = true;
            return;
        }
    }
    args.IsValid = false;
}