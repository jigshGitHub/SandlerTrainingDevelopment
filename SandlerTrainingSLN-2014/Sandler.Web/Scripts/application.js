﻿//var applicationname = "";
//var applicationname = "/SandlerTrainingNew";
var applicationname = "";

var myhost = window.location.protocol + "//" + window.location.host
var absoluteapp = myhost + applicationname;
var baseUrl = myhost + applicationname;
//alert(baseUrl);
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

    //For Sandler Roles
    var getSandlerRoles = function () {
        return $(document).data("sandler.appStart.sandlerRoles");
    };

    var setSandlerRoles = function (sandlerRoles) {
        $(document).data("sandler.appStart.sandlerRoles", sandlerRoles);
    };
    //Done

    //For Master Frs
    var getMasterFranchisees = function () {
        return $(document).data("sandler.appStart.masterfranchisees");
    };

    var setMasterFranchisees = function (masterfranchisees) {
        $(document).data("sandler.appStart.masterfranchisees", masterfranchisees);
    };
    //done
    
    //For Sandler Coach + Region 
    var getSandlerCoachRegions = function () {
        return $(document).data("sandler.appStart.sandlerCoachRegions");
    };

    var setSandlerCoachRegions = function (sandlerCoachRegions) {
        $(document).data("sandler.appStart.sandlerCoachRegions", sandlerCoachRegions);
    };
    //Done

    //For Coach
    var getCoaches = function () {
        return $(document).data("sandler.appStart.setcoaches");
    };

    var setCoaches = function (setcoaches) {
        $(document).data("sandler.appStart.setcoaches", setcoaches);
    };
        
    //For Cost Plus Amount
    var getCostPlusAmt = function () {
        return $(document).data("sandler.appStart.costplusamt");
    };
    var setCostPlusAmt = function (costplusamt) {
        $(document).data("sandler.appStart.costplusamt", costplusamt);
    };

    //Behind Amount
    var getBehindAmount = function () {
        return $(document).data("sandler.appStart.behindamts");
    };

    var setBehindAmount = function (behindamts) {
        $(document).data("sandler.appStart.behindamts", behindamts);
    };

    //Award Level
    var getAwardLevel = function () {
        return $(document).data("sandler.appStart.awardlevels");
    };
    var setAwardLevel = function (awardlevels) {
        $(document).data("sandler.appStart.awardlevels", awardlevels);
    };
    //Certified Level
    var getCertifiedLevel = function () {
        return $(document).data("sandler.appStart.certifiedlevels");
    };
    var setCertifiedLevel = function (certifiedlevels) {
        $(document).data("sandler.appStart.certifiedlevels", certifiedlevels);
    };
    //Purchase Level
    var getPurchaseLevel = function () {
        return $(document).data("sandler.appStart.purchaselevels");
    };

    var setPurchaseLevel = function (purchaselevels) {
        $(document).data("sandler.appStart.purchaselevels", purchaselevels);
    };
    //Primary Business
    var getPrimaryBusiness = function () {
        return $(document).data("sandler.appStart.primarybusiness");
    };

    var setPrimaryBusiness = function (primarybusiness) {
        $(document).data("sandler.appStart.primarybusiness", primarybusiness);
    };
    //Countries
    var getCountries = function () {
        return $(document).data("sandler.appStart.countries");
    };

    var setCountries = function (countries) {
        $(document).data("sandler.appStart.countries", countries);
    };

    //States
    var getStates = function () {
        return $(document).data("sandler.appStart.states");
    };

    var setStates = function (states) {
        $(document).data("sandler.appStart.states", states);
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
        var companies = $(document).data("sandler.appStart.userCompanies");
        if (companies)
            return companies;

        var data = jsonDataCaller.syncCall(baseUrl + "/api/CompanyView?searchText=&page=0&pageSize=0&selectForExcel=false&franchiseeId=" + getUserFranchisee(), null)
        //console.log('getting user companies');
        companies = new Array();
        $.each(data.results, function (i, companyRecord) {
            companies.push(new company(companyRecord.COMPANYNAME, companyRecord.COMPANIESID));
        });
        setUserCompanies(companies);
        return companies;
    };

    var setUserCompanies = function (companies) {
        $(document).data("sandler.appStart.userCompanies", companies);
    };

    var setUserFranchisees = function (franchisees) {
        $(document).data("sandler.appStart.userFranchisees", franchisees);
    }

    var getUserFranchisees = function () {
        return $(document).data("sandler.appStart.userFranchisees");
    }

    var setUserFranchisee = function (franchisee) {
        $(document).data("sandler.appStart.userFranchisee", franchisee);
    }

    var getUserFranchisee = function () {
        return $(document).data("sandler.appStart.userFranchisee");
    }

    var getUserContacts = function () {
        var contacts = $(document).data("sandler.appStart.userContacts");
        if (contacts)
            return contacts;
        //console.log('first time getting user contacts');
        var data = jsonDataCaller.syncCall(baseUrl + "/api/ContactView?&page=0&pageSize=0&companyId=0&searchText=&selectForExcel=false", null)
        contacts = new Array();
        $.each(data.results, function (i, contactRecord) {
            contacts.push(new contact(contactRecord.LastName, contactRecord.FirstName, contactRecord.FullName, contactRecord.ContactsId, contactRecord.CompanyId,contactRecord.Email, contactRecord.Phone));
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

    var coachregion = function (CoachRegionName, regionId) {
        this.Name = CoachRegionName;
        this.Id = regionId;
    };

    var contact = function (lastName, firstName, fullName, contactsId, companyId, email, phone) {
        this.lastName = lastName;
        this.firstName = firstName;
        this.fullName = fullName;
        this.contactsId = contactsId;
        this.companyId = companyId;
        this.email = email;
        this.phone = phone;
    };

    var appInitialized = function (value) {
        if (value) {
            $(document).data("sandler.appStart.appInitialized", value);
            return;
        }
        else
            return $(document).data("sandler.appStart.appInitialized");
    }
    var initialize = function () {
        //console.log('appInitialized()=' + appInitialized());
        if (appInitialized() == undefined) {
            //console.log('appStart.initialize');
            var industries = jsonDataCaller.syncCall(baseUrl + "/api/Industries/", null);
            setIndustryTypes(industries);
            var yesNoOptions = jsonDataCaller.syncCall(baseUrl + "/api/YesNoOptions/", null);
            setYesNoOptions(yesNoOptions);
            var Products = jsonDataCaller.syncCall(baseUrl + "/api/Products/", null);
            setProductTypes(Products);
            var appointmentsSources = jsonDataCaller.syncCall(baseUrl + "/api/AppointmentsSources/", null);
            setAppointmentSources(appointmentsSources);
            var courses = jsonDataCaller.syncCall(baseUrl + "/api/Courses/", null);
            setCourses(courses);
            var opportunityStatus = jsonDataCaller.syncCall(baseUrl + "/api/OpportunityStatus/", null);
            setOpportunityStatus(opportunityStatus);
            var opportunityTypes = jsonDataCaller.syncCall(baseUrl + "/api/OpportunityTypes/", null);
            setOpportunityTypes(opportunityTypes);
            var opportunityWhyLosts = jsonDataCaller.syncCall(baseUrl + "/api/OpportunityWhyLosts/", null);
            setOpportunityWhyLosts(opportunityWhyLosts);
            var opportunitySources = jsonDataCaller.syncCall(baseUrl + "/api/OpportunitySources/", null);
            setOpportunitySources(opportunitySources);

            //For Master Franchisees
            var masterfranchisees = jsonDataCaller.syncCall(baseUrl + "/api/MasterFranchisees/", null);
            setMasterFranchisees(masterfranchisees);
            //For Master Franchisees
            var behindamts = jsonDataCaller.syncCall(baseUrl + "/api/BehindAmount/", null);
            setBehindAmount(behindamts);
            //For Award Level
            var awardlevels = jsonDataCaller.syncCall(baseUrl + "/api/AwardLevel/", null);
            setAwardLevel(awardlevels);
            //For Certified Level
            var certifiedlevels = jsonDataCaller.syncCall(baseUrl + "/api/CertifiedLevel/", null);
            setCertifiedLevel(certifiedlevels);
            //For Purchase Level
            var purchaselevels = jsonDataCaller.syncCall(baseUrl + "/api/PurchaseLevel/", null);
            setPurchaseLevel(purchaselevels);
            //For Primary Business
            var primarybusiness = jsonDataCaller.syncCall(baseUrl + "/api/PrimaryBusiness/", null);
            setPrimaryBusiness(primarybusiness);
            //Country
            var countries = jsonDataCaller.syncCall(baseUrl + "/api/Countries/", null);
            setCountries(countries);
            //States
            var states = jsonDataCaller.syncCall(baseUrl + "/api/States/", null);
            setStates(states);

            //Cost Plus Amount
            var costplusamt = jsonDataCaller.syncCall(baseUrl + "/api/CostPlusAmount/", null);
            setCostPlusAmt(costplusamt);
            //For Sandler Roles
            var sandlerroles = jsonDataCaller.syncCall(baseUrl + "/api/SandlerRoles/", null);
            setSandlerRoles(sandlerroles);
            //For Coaches
            var coaches = jsonDataCaller.syncCall(baseUrl + "/api/Coaches/", null);
            setCoaches(coaches);
            var sandlercoachregions = new Array();
            $.each(coaches, function (i, coachregionRecord) {
                sandlercoachregions.push(new coachregion(coachregionRecord.FirstName + ' ' + coachregionRecord.LastName + " - Region " + coachregionRecord.RegionID, coachregionRecord.RegionID));

            });
            setSandlerCoachRegions(sandlercoachregions);

            var franchisees = jsonDataCaller.syncCall(baseUrl + "/api/FranchiseeView/?searchText=&page=0&pageSize=0&selectForExcel=false", null);
            setUserFranchisees(franchisees.results);

            appInitialized(true)
        }
        //else {
        //    console.log('allready appStart.initialize');
        //}
    };

    return {
        getProductTypes:getProductTypes,
        getIndustryTypes: getIndustryTypes,
        getSandlerRoles: getSandlerRoles,
        getCoaches: getCoaches,
        getStates:getStates,
        getCountries: getCountries,
        getPrimaryBusiness: getPrimaryBusiness,
        getCertifiedLevel: getCertifiedLevel,
        getPurchaseLevel:getPurchaseLevel,
        getAwardLevel: getAwardLevel,
        getBehindAmount: getBehindAmount,
        getCostPlusAmt: getCostPlusAmt,
        getMasterFranchisees: getMasterFranchisees,
        getSandlerCoachRegions: getSandlerCoachRegions,
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
        getUserFranchisees: getUserFranchisees,
        setUserFranchisee: setUserFranchisee,
        getUserFranchisee:getUserFranchisee,
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
    //console.log("1");
    startModule.initialize();
    //console.log("2");
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

function get_linkedinUrl(str) {
    if (str == null)
        return "";
    else if (str.toLowerCase().match("^http"))
        return str;
    else
        return "http://www.linkedin.com/vsearch/p?type=people&keywords=" + str;

};