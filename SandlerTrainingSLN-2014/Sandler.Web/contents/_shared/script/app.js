/* [[ Constants ]] /////////////////////////////////////////////////////////////////*/
var NOTIFICMSG = {
    SAVING: "Saving...",
    SENDING: "Sending...",
    SAVED: "Successfully Saved!!",
    SENT: "Successfully Sent!!",
    MATCHING: "Checking if there is a match...",
    ERROR_WHILE_SAVING: "Error while saving!!",
    ERROR_WHILE_SENDING: "Error while sending!!",
    PROCESSING: "Processing. Please wait..",
    DELETING: "Deleting...",
    DELETED: "Successfully Deleted!!",
    ERROR_WHILE_DELETING: "Error while deleting!!",
    RESETTINGRPM: "Resetting RPM Password..",
    CREATINGRPM: "Creating new RPM account.."
};

/* [[ Angular - Application Module ]] /////////////////////////////////////////////////////*/
var app_ = angular.module('ngAppCMDI', ['ngRoute', 'kendo.directives']);
var appData_ = { Id_i: 0 };

/* [[ Shared Local Data ]] ////////////////////////////////////////////////////////////////*/
// Prefix Options
var prefixList = ["Mr.", "Ms.", "Mrs.", "Dr."]
// Suffix Options
var suffixList = ["Sr.", "Jr.", "III", "IV", "V"]
// State Abbreviation List
var stateAbbList = ["AA", "AE", "AK", "AL", "AP", "AR", "AS", "AZ", "CA", "CO", "CT", "DC", "DE", "FF", "FL", "FM", "GA", "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MH", "MI", "MN", "MO", "MP", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "PW", "RI", "SC", "SD", "TN", "TX", "UM", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"]


/*/ [[ Ajax Call (Page/Data) ]] //////////////////////////////////////////////////////*/
var aRenderer = {

    openPage: function (path, hostDiv) {
        var itemSelector = '#' + hostDiv;
        $(itemSelector).children().remove();
        $.ajax({
            url: path,
            type: 'GET',
            dataType: 'html',
            success: function (result) {
                $(itemSelector).html(result);
            }
        });
    },

    openPage_w_jsonParam: function (path, param, hostDiv, type, callbackFuncOnSuccess) {
        var itemSelector = '#' + hostDiv;
        $(itemSelector).children().remove();
        if (!type)
            type = "GET";
        $.ajax({
            url: path,
            data: param,
            type: type,
            contentType: 'application/json',
            dataType: 'html',
            success: function (result) {
                $(itemSelector).html(result);
                if (callbackFuncOnSuccess)
                    callbackFuncOnSuccess(result);
            },
            error: function (result) {
            }
        });
    }
}
var jsonDataCaller = {
    syncCall: function (url, data, type) {
        if (!type)
            type = 'GET';
        return $.parseJSON($.ajax({
            type: type,
            contentType: 'application/json',
            dataType: "json",
            url: url,
            data: data,
            async: false
        }).responseText);
    }
}

// Misc. /////////////////////////////////////////////////////////////////////////////////
//
var tmpTimer_ = new Date();
var misc_ = {
    guid : function() {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + "-"
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + "-4"
                + ((((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)).substring(0, 3)
                + "-"
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + "-"
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
                + (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
        ;
    },
    printTimer: function (reset) {
        if (reset==true) {
            tmpTimer_ = new Date();
            console.log('Started at '+tmpTimer_);
            return 0;
        }
        else {
            var currTime = new Date();
            var diff = currTime.getMilliseconds() - tmpTimer_.getMilliseconds();
            console.log('Ended at '+currTime + " (" + diff + 'ms)');
            tmpTimer_ = currTime;
            return diff;
        }
    }
}

// Email Validation 
function is_validEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test($email)) 
        return false;
    else
        return true;
}

function get_fullUrl(url) {
    if (url == null)
        return "";
    else if (url.toLowerCase().match("^http"))
        return url;
    else
        return "http://" + url;
};

function get_facebookUrl(str) {
    if (str == null)
        return "";
    else if (str.toLowerCase().match("^http"))
        return str;
    else
        return "http://www.facebook.com/" + str;
};

function get_twitterUrl(str) {
    if (str == null)
        return "";
    else if (str.toLowerCase().match("^http"))
        return str;
    else
        return "http://twitter.com/" + str;
};

function does_it_supports_html5_storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

/* [[ Navigator Page ]] ///////////////////////////////////////////////////////////////////////////// */
var navi_ = {
    pageExists: function () {
        return (!(typeof naviPage_ === 'undefined') && naviPage_ != null);
    },
    totalPages: function () {
        return (navi_.pageExists() ? naviPage_.count() : 0);
    },
    changeCurrentPageTitle: function (title) {
        naviPage_.title_ofCurrentPage(title);
    },
    inModal: function(elementId) {
        return (navi_.pageExists() && $('#' + elementId).parent().parent().parent().hasClass('fancybox-inner'));
    },
    singlePageInModal: function(elementId) {
        return (navi_.pageExists() && navi_.totalPages() == 1 && $('#' + elementId).parent().parent().parent().hasClass('fancybox-inner'));
    },
    closeModal: function() {
        $.fancybox.close();
    },
    addNewPage: function (data) {
        naviPage_.addPage(data); 
    },
    replacePage: function (data) {
        naviPage_.replacePage(data);
    },
    currentPage: function () {
        return (navi_.pageExists() ? naviPage_.currentPage() : null);
    },
    closeCurrentPage: function (data) {
        naviPage_.closeCurrentPage(data);
    }
}

/* [[ Notifications ]] /////////////////////////////////////////////////////////////////////*/
var showNoti_ = {
    error : function(msg, closePrevMsg) {
        if (closePrevMsg)
            $.pnotify_remove_all();

        $.pnotify({
            type: 'error',
            title: 'Error',
            text: msg,
            opacity: 0.9,
            animate_speed: 'fast',
            delay: 2000,
            history: false,
            before_open: function (pnotify) {
                if (closePrevMsg)
                    pnotify.pnotify_queue_remove();
            }
        });
    },
    info : function (msg, closePrevMsg) {
        if (closePrevMsg)
            $.pnotify_remove_all();

        $.pnotify({
            type: 'info',
            title: 'Information',
            text: msg,
            opacity: 0.9,
            animate_speed: 'fast',
            delay: 1500,
            history: false
        });
    },
    progress: function (title, closePrevMsg) {
        if (closePrevMsg)
            $.pnotify_remove_all();

        // Make a loader.
        var loader = $.pnotify({
            type: 'info',
            title: title,
            text: "<br/><div class='progress progress-striped active'><div class='progress-bar progress-bar-info' style='width: 100%;'></div></div>",
            hide: false,
            closer: false,
            sticker: false,
            history: false,
            hide: false,
            animate_speed: 'fast',
            before_open: function (pnotify) {
                // Do Nothing
            }
        });
    },
    hide: function () {
        $.pnotify_remove_all();
    },
    stickyInfo: function (msg, closePrevMsg) {
        if (closePrevMsg)
            $.pnotify_remove_all();

        $.pnotify({
            type: 'info',
            title: 'Information',
            text: msg,
            history: false,
            hide: false
        });
    },
    confirm: function (title, callBackFunction_submit, callBackFunction_bind) {
        //clear any prev window
        $.pnotify_remove_all();
        var notice = $.pnotify({
            title: title,
            text: "<br/><div><form class='pf-form pform_custom' action='' method='post'><div class='pf-element pf-buttons pf-centered'><input class='pf-button btn btn-primary' type='submit' name='submit' value='Yes' />&nbsp;<input class='pf-button btn' type='reset' name='reset' value='No' /></div>",
            icon: false,
            width: 'auto',
            hide: false,
            closer: false,
            sticker: false,
            history: false,
            insert_brs: false
        });
        notice.find('form.pf-form').submit(function () {
            $.pnotify_remove_all();
            callBackFunction_submit();
            return false;
        });
        notice.find('form.pf-form').bind("reset", function () {
            //alert("inside app");
            $.pnotify_remove_all();
            if (callBackFunction_bind != null)
                callBackFunction_bind();
            return false;
        });
    }
};

/* [[ Modal Window ]] ///////////////////////////////////////////////////////////////////////////// */
var showModal_ = {
    html: function (url, data, width, showCloseBtn, afterClose) {

        var autoSize = true;
        if (!width || width=='auto')
            width = 'auto';
        else
            autoSize = false;
        if (showCloseBtn == null)
            showCloseBtn = true;
        var margin = [15, 15, 15, 15];
        var ajax;
        if (data) {
            ajax = {
                dataType: "html",
                type: "POST",
                data: data
            }
        }
        $.fancybox([{ href: url }],
            {
                type: 'ajax',
                ajax: ajax,
                autoSize: autoSize,
                width: width,
                height: '95%', // 'auto',
                padding: 0,
                margin: margin,
                closeBtn: showCloseBtn,
                closeClick: false, // prevents closing when clicking INSIDE fancybox
                afterClose: afterClose,
                helpers: {
                    title: null,
                    overlay: { closeClick: false } // prevents closing when clicking OUTSIDE fancybox
                }
            });
    },
    iframe: function (url) {
        $.fancybox([{ href: url }],
            {
                type: 'iframe',
                iframe: {
                    scrolling: 'auto',
                    preload: false
                },
                autoSize: true,
                closeClick: false, // prevents closing when clicking INSIDE fancybox
                helpers: {
                    title: null,
                    overlay: { closeClick: false } // prevents closing when clicking OUTSIDE fancybox
                }
            });
    }
};

/* [[ format ]] ////////////////////////////////////////////////////////////////*/
var sformat_ = {
    callto: function (data) {
        return (data && data != "" ? "callto:" + data : "");
    },
    mailto: function (data) {
        return (data && data != "" ? "mailto:" + data : "");
    },
    padChar: function (number, size, pChar) {
        var s = number + "";
        while (s.length < size) s = pChar + s;
        return s;
    }
};


/* [[ Data Manipulation ]] ////////////////////////////////////////////////////////////////*/
var dao_ = {
    save: function (url, data, callbackFuncOnSuccess, callbackFuncOnError) {
        showNoti_.progress(NOTIFICMSG.SAVING, true);

        setTimeout(function () {

            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (result) {
                    if (result.success)  // ????? && result.results[0].PID > 0
                        showNoti_.info(NOTIFICMSG.SAVED, true);
                    else
                        showNoti_.error(NOTIFICMSG.ERROR_WHILE_SAVING, true);
                    callbackFuncOnSuccess(result);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    showNoti_.error(NOTIFICMSG.ERROR_WHILE_SAVING, true);
                    callbackFuncOnError();
                }
            });

        },1000);
    },
    send: function (url, data, callbackFuncOnSuccess, callbackFuncOnError) {
        showNoti_.progress(NOTIFICMSG.SENDING, true);

        setTimeout(function () {

            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (result) {
                    if (result.success)
                        showNoti_.info(NOTIFICMSG.SENT, true);
                    else
                        showNoti_.error(NOTIFICMSG.ERROR_WHILE_SENDING, true);
                    callbackFuncOnSuccess(result);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    showNoti_.error(NOTIFICMSG.ERROR_WHILE_SENDING, true);
                    callbackFuncOnError();
                }
            });

        }, 1000);
    },
    delete: function (url, data, callbackFuncOnSuccess, callbackFuncOnError) {
        showNoti_.progress(NOTIFICMSG.DELETING, true);

        setTimeout(function () {

            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                contentType: 'application/json',
                success: function (result) {
                    if (result.success)
                        showNoti_.info(NOTIFICMSG.DELETED, true);
                    else
                        showNoti_.error(NOTIFICMSG.ERROR_WHILE_DELETING, true);
                    callbackFuncOnSuccess(result);
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    showNoti_.error(NOTIFICMSG.ERROR_WHILE_DELETING, true);
                    callbackFuncOnError();
                }
            });
        }, 1000);
    }
};

/* [[ String Utilities ]] ////////////////////////////////////////////////////////////////*/
var stringUtil_ = {
    firstString: function (s) {
        s = s.trim();
        if (s.indexOf(" ") > 0)
            return s.substring(0, s.indexOf(" "));
        else
            return s;
    },
    secondNRest: function (s) {
        s = s.trim();
        if (s.indexOf(" ") > 0 && s.length>s.indexOf(" ")+1)
            return s.substring(s.indexOf(" ")+1, s.length);
        else
            return s;
    }
}

/* [[ Date Utilities ]] //////////////////////////////////////////////////////////////////*/
var dateUtil_ = {
    toIsoStringFormat: function (d) {
        return d.getFullYear() + "-" + sformat_.padChar(d.getMonth()+1,2,'0') + "-" + sformat_.padChar(d.getDate(),2,'0') + "T" + d.toTimeString().substring(0, 8);
    },
    toNoTimeZone: function (d) {
        try {
            if (Object.prototype.toString.call(d) === '[object Date]') {
                return dateUtil_.toIsoStringFormat(d).replace('Z','');
            }
            else if (typeof d == 'string' && d != '') { // Assumes it's a string date
                var dcopy = kendo.parseDate(d);
                return dateUtil_.toIsoStringFormat(dcopy).replace('Z','');
            }
            else
                return d;
        }
        catch (e) {
            console.log(e.message);
            return d;
        }
    }
}

/* ///////////////////////////////////////////////////////////////////*/
//Show Progress
function showProgress(msg) {
    //Show the progress message to the user
    $("#innerMessage").html(msg);
    $("#loading").show();
};

//Hide Progress
function hideProgress() {
    //Processing is done so remove the progress message
    $("#innerMessage").html("&nbsp;");
    $("#loading").hide();
};

//Show Progress for Modal
function showProgressModal(msg) {
    //Show the progress message to the user
    $("#ModelinnerMessage").html(msg);
    $("#Modalloading").show();
};

//Hide Progress for Modal
function hideProgressModal() {
    //Processing is done so remove the progress message
    $("#ModelinnerMessage").html("&nbsp;");
    $("#Modalloading").hide();
};


// Integration related ///////////////////////////////////////////////////////////////

// Return a value of Google Place Search Result Property
function get_GoogleGeoAttribute(arrayOfAddrComponents, type, shortName) {
    var item = jQuery.grep(arrayOfAddrComponents, function (element, index) {
        return element.types[0] == type;
    });
    if (shortName)
        return item[0].short_name;
    else
        return item[0].long_name;
};

//This is used for Track Number so user can not enter other than Numeric number
function EnterOnlyNumeric() {
    if (event.keyCode < 48 || event.keyCode > 57)
        event.returnValue = false;

};

/* [REQUIRED to work around the automatic UTC conversion by ko.toJSON] 
        Given a local DateTime, 
        Returns a DateTime, applied offset hours that will be added/subtracted by UTC conversion. */
function getTimezoneOffset_(enteredDate) {
    //Let us get the TimeZone offset
    var d = new Date()
    var n = d.getTimezoneOffset();
    //Now apply to the user entered date if not Null
    if (enteredDate != null && enteredDate != "") enteredDate.add(-n).minutes();
    //return
    return enteredDate;
}

// 