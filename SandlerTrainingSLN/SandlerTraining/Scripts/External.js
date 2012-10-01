function EnterOnlyNumeric() {
    if (event.keyCode < 48 || event.keyCode > 57)
        event.returnValue = false;

}

//Javascript to add to your aspx page
function ValidateModuleList(source, args) {
    //alert("hello");
    var chkListModules = document.getElementById('MainContent_chkListGroup');
    if (chkListModules != null) {
        var chkListinputs = chkListModules.getElementsByTagName("input");
        for (var i = 0; i < chkListinputs.length; i++) {
            if (chkListinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //For UserEmailGroup
    var sel = document.getElementById('MainContent_lstUserEmailGroup');
    if (sel != null)
    {
        //alert("we are here");
        var optsLength = sel.options.length;
        //alert(optsLength);
        //alert(sel.options[0].checked);
        //alert(sel.options[0].selected);
        for (var i = 0; i < optsLength; i++)
        {
            //alert(i);
            if (sel.options[i].selected)
            {
                args.IsValid = true;
                return;
            }
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

//Javascript to add to your aspx page
function ValidateUserGroupList(source, args) {
    //alert("hello");
    
    //For Coach List
    var chkListCoach = document.getElementById('MainContent_chkListCoach');
    if (chkListCoach != null) {
        var chkListCoachinputs = chkListCoach.getElementsByTagName("input");
        for (var i = 0; i < chkListCoachinputs.length; i++) {
            if (chkListCoachinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //for Fr Owner List
    var chkListFrOwner = document.getElementById('MainContent_chkListFrOwner');
    if (chkListFrOwner != null) {
        var chkListFrOwnerinputs = chkListFrOwner.getElementsByTagName("input");
        for (var i = 0; i < chkListFrOwnerinputs.length; i++) {
            if (chkListFrOwnerinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //For Fr Users List
    var chkListFrUsers = document.getElementById('MainContent_chkListFrUsers');
    if (chkListFrUsers != null) {
        var chkListFrUsersinputs = chkListFrUsers.getElementsByTagName("input");
        for (var i = 0; i < chkListFrUsersinputs.length; i++) {
            if (chkListFrUsersinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //for Fr Contacts List
    var chkListFrContacts = document.getElementById('MainContent_chkListFrContacts');
    if (chkListFrContacts != null) {
        var chkListFrContactsinputs = chkListFrContacts.getElementsByTagName("input");
        for (var i = 0; i < chkListFrContactsinputs.length; i++) {
            if (chkListFrContactsinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //Or else we need to show the message
    args.IsValid = false;
}


//Javascript to add to your aspx page
function ValidateUserGroupListCorp(source, args) {
    //alert("hello");

    //For Coach List Corp
    var chkListCoachCorp = document.getElementById('MainContent_chkListCoachCorp');
    if (chkListCoachCorp != null)
    {
        var chkListCoachCorpinputs = chkListCoachCorp.getElementsByTagName("input");
        for (var i = 0; i < chkListCoachCorpinputs.length; i++) {
            if (chkListCoachCorpinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //for Fr Owner List Corp
    var chkListFrOwnerCorp = document.getElementById('MainContent_chkListFrOwnerCorp');
    if (chkListFrOwnerCorp != null)
    {
        var chkListFrOwnerCorpinputs = chkListFrOwnerCorp.getElementsByTagName("input");
        for (var i = 0; i < chkListFrOwnerCorpinputs.length; i++) {
            if (chkListFrOwnerCorpinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //For Fr Users List
    var chkListFrUsersCorp = document.getElementById('MainContent_chkListFrUsersCorp');
    if (chkListFrUsersCorp != null)
    {
        var chkListFrUsersCorpinputs = chkListFrUsersCorp.getElementsByTagName("input");
        for (var i = 0; i < chkListFrUsersCorpinputs.length; i++) {
            if (chkListFrUsersCorpinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //for Fr Contacts List
    var chkListFrContactsCorp = document.getElementById('MainContent_chkListFrContactsCorp');
    if (chkListFrContactsCorp != null) {
        var chkListFrContactsCorpinputs = chkListFrContactsCorp.getElementsByTagName("input");
        for (var i = 0; i < chkListFrContactsCorpinputs.length; i++) {
            if (chkListFrContactsCorpinputs[i].checked) {
                args.IsValid = true;
                return;
            }
        }
    }
    //Or else we need to show the message
    args.IsValid = false;
}

