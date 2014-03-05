var applicationname = "";
var myhost = window.location.protocol + "//" + window.location.host
var absoluteapp = myhost + applicationname;
var baseUrl = myhost + applicationname;
var imagedir = "/Content/Images";
var sandler = {
    namespace: function (name) {

        // ** single var pattern
        var parts = name.split(".");
        var ns = this;

        // ** iterator pattern
        for (var i = 0, len = parts.length; i < len; i++) {
            // ** || idiom
            ns[parts[i]] = ns[parts[i]] || {};
            ns = ns[parts[i]];
        }

        return ns;
    }

};

sandler.namespace("appStart").module= (function () {
    var getProductTypes = function () {
        return $(document).data("sandler.appStart.productTypes");
    };

    var setProductTypes = function (productTypes) {
        $(document).data("sandler.appStart.productTypes", productTypes);
    };

    var getIndustryTypes = function () {
        return $(document).data("sandler.appStart.industryTypes");
    };

    var setIndustryTypes = function (industryTypes) {
        $(document).data("sandler.appStart.industryTypes", industryTypes);
    };

    var getYesNoOptions= function () {
        return $(document).data("sandler.appStart.yesNoOptions");
    };

    var setYesNoOptions = function (yesNoOptions) {
        $(document).data("sandler.appStart.yesNoOptions", yesNoOptions);
    };

    var getAppointmentSources = function () {
        return $(document).data("sandler.appStart.appointmentSources");
    };

    var setAppointmentSources = function (appointmentSources) {
        $(document).data("sandler.appStart.appointmentSources", appointmentSources);
    };

    var getCourses = function () {
        return $(document).data("sandler.appStart.courses");
    };

    var setCourses = function (courses) {
        $(document).data("sandler.appStart.courses", courses);
    };

    var getOpportunityWhyLosts = function () {
        return $(document).data("sandler.appStart.opportunityWhyLosts");
    };

    var setOpportunityWhyLosts = function (opportunityWhyLosts) {
        $(document).data("sandler.appStart.opportunityWhyLosts", opportunityWhyLosts);
    };

    var getOpportunityStatus = function () {
        return $(document).data("sandler.appStart.opportunityStatus");
    };

    var setOpportunityStatus = function (opportunityStatus) {
        $(document).data("sandler.appStart.opportunityStatus", opportunityStatus);
    };

    var getOpportunityTypes = function () {
        return $(document).data("sandler.appStart.opportunityTypes");
    };

    var setOpportunityTypes = function (opportunityTypes) {
        $(document).data("sandler.appStart.opportunityTypes", opportunityTypes);
    };

    var getOpportunitySources = function () {
        return $(document).data("sandler.appStart.opportunitySources");
    };

    var setOpportunitySources = function (opportunitySources) {
        $(document).data("sandler.appStart.opportunitySources", opportunitySources);
    };
    var getUserCompanies = function () {
        return $(document).data("sandler.appStart.userCompanies");
    };

    var setUserCompanies = function (companies) {
        $(document).data("sandler.appStart.userCompanies", companies);
    };

    var getUserContacts = function () {
        var contacts = $(document).data("sandler.appStart.userContacts");
        if (contacts)
            return contacts;
        //console.log('first time getting user contacts');
        var data = jsonDataCaller.syncCall("/api/ContactView?&page=0&pageSize=0&companyId=0&searchText=&selectForExcel=false", null)
        contacts = new Array();
        $.each(data.results, function (i, contactRecord) {
            contacts.push(new contact(contactRecord.LastName, contactRecord.FirstName, contactRecord.FullName, contactRecord.ContactsId, contactRecord.CompanyId));
        });
        $(document).data("sandler.appStart.userContacts", contacts);
        return contacts;
    };

    var getUserContactsByCompany = function (companyId) {
        //console.log('companyId');
        //console.log(companyId);
        var companyContacts = new Array();
        $.each(getUserContacts(), function (i, contactRecord) {
            if(contactRecord.companyId == companyId)
                companyContacts.push(contactRecord);
        });
        //console.log('companyContacts');
        //console.log(companyContacts);
        return companyContacts;
    };
    
    var setUser = function (user) {
        if (getUser() == '' | getUser() == undefined) {
            //console.log('setting user');
            $(document).data("sandler.appStart.currentUser", user);
        }
        else {
            console.log('user already set');
        }
    }

    var getUser = function (user) {
        return $(document).data("sandler.appStart.currentUser");
    }

    var company = function (companyName, companyId) {
        this.name = companyName;
        this.id = companyId;
    };

    var contact = function (lastName, firstName, fullName, contactsId, companyId) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.fullName = fullName;
        this.contactsId = contactsId;
        this.companyId = companyId;
    };

    var initialize = function () {
        var industries = jsonDataCaller.syncCall("/api/Industries/", null);
        setIndustryTypes(industries);
        var yesNoOptions = jsonDataCaller.syncCall("/api/YesNoOptions/", null);
        setYesNoOptions(yesNoOptions);
        var Products = jsonDataCaller.syncCall("/api/Products/", null);
        setProductTypes(Products);
        var appointmentsSources = jsonDataCaller.syncCall("/api/AppointmentsSources/", null);
        setAppointmentSources(appointmentsSources);
        var courses = jsonDataCaller.syncCall("/api/Courses/", null);
        setCourses(courses);
        var opportunityStatus = jsonDataCaller.syncCall("/api/OpportunityStatus/", null);
        setOpportunityStatus(opportunityStatus);
        var opportunityTypes = jsonDataCaller.syncCall("/api/OpportunityTypes/", null);
        setOpportunityTypes(opportunityTypes);
        var opportunityWhyLosts = jsonDataCaller.syncCall("/api/OpportunityWhyLosts/", null);
        setOpportunityWhyLosts(opportunityWhyLosts);
        var opportunitySources = jsonDataCaller.syncCall("/api/OpportunitySources/", null);
        setOpportunitySources(opportunitySources);
        var data = jsonDataCaller.syncCall("/api/CompanyView?searchText=&page=0&pageSize=0&selectForExcel=false", null)
        //console.log('getting user companies');
        var companies = new Array();
        $.each(data.results, function (i,companyRecord) {
            companies.push(new company(companyRecord.COMPANYNAME, companyRecord.COMPANIESID));
        });
        setUserCompanies(companies);
    };

    return {
        getProductTypes:getProductTypes,
        getIndustryTypes:getIndustryTypes,
        getAppointmentSources:getAppointmentSources,
        getYesNoOptions:getYesNoOptions,
        getCourses: getCourses,
        getOpportunityStatus: getOpportunityStatus,
        getOpportunityTypes: getOpportunityTypes,
        getOpportunityWhyLosts: getOpportunityWhyLosts,
        getOpportunitySources: getOpportunitySources,
        initialize: initialize,
        setUser: setUser,
        getUser: getUser,
        getUserCompanies: getUserCompanies,
        getUserContacts: getUserContacts,
        getUserContactsByCompany: getUserContactsByCompany,
        getProductName: function (productId) {
            var option = getProductTypes().filter(function (o) {
                return o.Id == productId;
            });
            return (option[0]) ? option[0].ProductTypeName : '';
        },
        getCompanyName: function (_id) {
            var option = getUserCompanies().filter(function (o) {
                return o.id == _id;
            });
            return (option[0]) ? option[0].name : '';
        },
        getYesNo: function (_id) {
            var option = getYesNoOptions().filter(function (o) {
                return o.Value == _id;
            });
            return (option[0]) ? option[0].Description : '';
        },
        getIndustryName: function (_id) {
            var option = getIndustryTypes().filter(function (o) {
                return o.IndId == _id;
            });
            return (option[0]) ? option[0].IndustryTypeName : '';
        },
        getAppointmentSourceName: function (_id) {
            var option = getAppointmentSources().filter(function (o) {
                return o.ApptSourceId == _id;
            });
            return (option[0]) ? option[0].ApptSourceName : '';
        },
        getCourseName: function (_id) {
            var option = getCourses().filter(function (o) {
                return o.CourseId == _id;
            });
            return (option[0]) ? option[0].CourseName : '';
        },
        getOpportunityStatusName: function (_id) {
            var option = getOpportunityStatus().filter(function (o) {
                return o.ID == _id;
            });
            return (option[0]) ? option[0].Name : '';
        },
        getOpportunityTypesName: function (_id) {
            var option = getOpportunityTypes().filter(function (o) {
                return o.ID == _id;
            });
            return (option[0]) ? option[0].Name : '';
        },
        getOpportunityWhyLostsName: function (_id) {
            var option = getOpportunityWhyLosts().filter(function (o) {
                return o.ID == _id;
            });
            return (option[0]) ? option[0].Name:'';
        },
        getOpportunitySourcesName: function (_id) {
            var option = getOpportunitySources().filter(function (o) {
                return o.ID == _id;
            });
            return (option[0]) ? option[0].Name : '';
        }
    };
})();

$(function () {
    var startModule = sandler.appStart.module;
    startModule.initialize();
});
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
    syncCall: function (url, data) {
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

