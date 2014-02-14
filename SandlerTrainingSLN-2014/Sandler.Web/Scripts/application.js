var applicationname = "";
var myhost = window.location.protocol + "//" + window.location.host
var absoluteapp = myhost + applicationname;
var baseUrl = myhost + applicationname;
var imagedir = "/Content/Images";
function namespace(namespaceString) {
    var parts = namespaceString.split('.'),
        parent = window,
        currentPart = '';

    for (var i = 0, length = parts.length; i < length; i++) {
        currentPart = parts[i];
        parent[currentPart] = parent[currentPart] || {};
        parent = parent[currentPart];
    }

    return parent;
}

var cascade = namespace("cascade");
var viewModels = namespace("cascade.viewModels");
cascade.viewModels.getActiveViewModel = function () {
    return $(document).data("cascade.viewModels.activeViewmodel");
}

cascade.viewModels.setActiveViewModel = function (viewModel) {
    $(document).data("cascade.viewModels.activeViewmodel", viewModel);
}

function getFileName(document) {
    var fileName = document.split('_');
    return fileName[3];
}

// My Workspaces (Data Source) /////////////////////////////////////////////////////////////////////
var ds_authWorkspaces1 = {
    transport: {
        read: {
            url: "/workspace/myWorkspaces",
            dataType: "json",

            // additional parameters sent to the remote service
            data: {
            }
        }
    },
    schema: {
        // the data which the data source will be bound to is in the "results" field
        data: "items"
    }
};

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

    openPage_w_jsonParam: function (path, param, hostDiv) {
    var itemSelector = '#' + hostDiv;
    $(itemSelector).children().remove();
    $.ajax({
        url: path,
        data: param,
        type: 'GET',
        dataType: 'html',
        success: function (result) {
            $(itemSelector).html(result);
        }
    });
}
}

// Query Definition in JSON
var jsonDataCaller = {
    syncCall: function(url, data) {
        return $.parseJSON($.ajax({
            type: "GET",
            dataType: "json",
            url: url,
            data: data,
            async: false
        }).responseText);
    }
}

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

//For Notification Framework - START ---/////

var NOTIFICMSG = {
    SAVING: "Saving...",
    SAVED: "Successfully Saved!!",
    MATCHING: "Checking if there is a match...",
    ERROR_WHILE_SAVING: "Error while saving!!",
    PROCESSING: "Processing. Please wait.."
};

/* [[ Notifications ]] */
var showNoti_ = {
    error: function (msg, closePrevMsg) {
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
    info: function (msg, closePrevMsg) {
        if (closePrevMsg)
            $.pnotify_remove_all();

        $.pnotify({
            type: 'info',
            title: 'Information',
            text: msg,
            opacity: 0.9,
            animate_speed: 'fast',
            delay: 2000,
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
            text: "<br/><div class='progress progress-striped active'><div class='bar' style='width: 100%;'></div></div>",
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
            hide: false
        });
    },
    confirm: function (title, callBackFunction) {
        //clear any prev window
        $.pnotify_remove_all();
        var notice = $.pnotify({
            title: title,
            text: "<br/><div><form class='pf-form pform_custom' action='' method='post'><div class='pf-element pf-buttons pf-centered'><input class='pf-button btn btn-primary' type='submit' name='submit' value='Yes' />&nbsp;<input class='pf-button btn' type='reset' name='reset' onclick='return $.pnotify_remove_all();' value='No' /></div>",
            icon: false,
            width: 'auto',
            hide: false,
            closer: false,
            sticker: false,
            insert_brs: false
        });
        notice.find('form.pf-form').submit(function () {
            $.pnotify_remove_all();
            callBackFunction();
            return false;
        });
    }
};

//For Notification Framework - END ---/////