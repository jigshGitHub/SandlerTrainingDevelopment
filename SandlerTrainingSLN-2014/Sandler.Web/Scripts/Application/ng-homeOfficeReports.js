var reportF;

function showAllRecordDetails(e) {
    e.preventDefault();
    var dataItem = $("#homeOfficeReportgrid").data("kendoGrid").dataItem($(e.currentTarget).closest("tr"));
    var path = "navi?url=/CRM/HomeOffice/Edit?id=" + dataItem.ID;
    showModal_.html(path, null, '95%');

}

function triggerSearch(e) {
    var unicode = e.keyCode ? e.keyCode : e.charCode;
    if (unicode == 13) {
        $("#btnSearch").click();
    }
}
function getReportDisplayName(shortName) {
    if (shortName == "frbyawlevel")
        return "My Full Name";
}



function GetDataSource(reportType, recordType) {
    if (reportType == "frbyawlevel") {
        return get_frbyawlevelkendoGridData(reportType, recordType);
    }
    if (reportType == "frbybusarea") {
        return get_frbybusareakendoGridData(reportType, recordType);
    }
    if (reportType == "frbycertlevel") {
        return get_frbycertlevelkendoGridData(reportType, recordType);
    }
    if (reportType == "frbycoach") {
        return get_frbycoachkendoGridData(reportType, recordType);
    }
    if (reportType == "frbycontdetails") {
        return get_frbycontdetailskendoGridData(reportType, recordType);
    }
    if (reportType == "ctra") {
        return get_ctrakendoGridData(reportType, recordType);
    }
    if (reportType == "frbycountry") {
        return get_frbycountrykendoGridData(reportType, recordType);
    }
    if (reportType == "frbytrngdate") {
        return get_frbytrngdatekendoGridData(reportType, recordType);
    }
    if (reportType == "msfc") {
        return get_msfckendoGridData(reportType, recordType);
    }
    if (reportType == "prpl") {
        return get_prplkendoGridData(reportType, recordType);
    }
    if (reportType == "frbyregion") {
        return get_frbyregionkendoGridData(reportType, recordType);
    }
    if (reportType == "sere") {
        return get_serekendoGridData(reportType, recordType);
    }
    if (reportType == "frbystate") {
        return get_frbystatekendoGridData(reportType, recordType);
    }
    if (reportType == "frbyusingcrm") {
        return get_frbyusingcrmkendoGridData(reportType, recordType);
    }
    if (reportType == "zcbt") {
        return get_zcbtkendoGridData(reportType, recordType);
    }
    if (reportType == "mfrd") {
        return get_mfrdkendoGridData(reportType, recordType);
    }
    if (reportType == "msfr") {
        return get_msfrkendoGridData(reportType, recordType);
    }
    if (reportType == "msrbykeyopnldr") {
        return get_msrbykeyopnldrkendoGridData(reportType, recordType);
    }
    if (reportType == "msrbyadvboard") {
        return get_msrbyadvboardkendoGridData(reportType, recordType);
    }
    if (reportType == "msrbymktgcom") {
        return get_msrbymktgcomkendoGridData(reportType, recordType);
    }
    if (reportType == "dhsa") {
        return get_dhsakendoGridData(reportType, recordType);
    }
    if (reportType == "frmd") {
        return get_frmdkendoGridData(reportType, recordType);
    }
    if (reportType == "glaa") {
        return get_glaakendoGridData(reportType, recordType);
    }

}

function get_frbyawlevelkendoGridData(reportType, recordType) {
    var dataSource = get_frbyawlevelgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "AwardLevelText", title: "Award Level", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbyawlevelgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    AwardLevelText: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbybusareakendoGridData(reportType, recordType) {
    var dataSource = get_frbybusareagridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "BusinessFocusArea", title: "Business Focus Area", width: "80px" },
           { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbybusareagridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    BusinessFocusArea: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbycertlevelkendoGridData(reportType, recordType) {
    var dataSource = get_frbycertlevelgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "CertificationLevel", title: "Certification Level", width: "80px" },
           { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbycertlevelgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    CertificationLevel: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbycoachkendoGridData(reportType, recordType) {
    var dataSource = get_frbycoachgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "Coach", title: "Coach", width: "80px" },
           { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbycoachgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Coach: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbycontdetailskendoGridData(reportType, recordType) {
    var dataSource = get_frbycontdetailsgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "FranchiseName", title: "Franchise Name", width: "80px" },
           { field: "InitialContractDate", title: "Initial Contract Date", width: "80px" },
            { field: "RenewalDate", title: "Renewal Date", width: "60px" },
            { field: "ContractFormDate", title: "Contract Form Date", width: "60px" },
            { field: "LastName", title: "Last Name", width: "60px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "PrimaryOfficeEmail", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbycontdetailsgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    FranchiseName: { type: 'string' },
                    InitialContractDate: { type: 'string' },
                    RenewalDate: { type: 'string' },
                    ContractFormDate: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_ctrakendoGridData(reportType, recordType) {
    var dataSource = get_ctragridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "ContractorAllowed", title: "Contractor Allowed", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_ctragridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    ContractorAllowed: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbycountrykendoGridData(reportType, recordType) {
    var dataSource = get_frbycountrygridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "Country", title: "Country", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbycountrygridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Country: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbytrngdatekendoGridData(reportType, recordType) {
    var dataSource = get_frbytrngdategridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "InitialTrainingDate", title: "Initial Training Date", width: "80px", format: "{0:MM/dd/yy}" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbytrngdategridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    InitialTrainingDate: { type: 'date' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_msfckendoGridData(reportType, recordType) {
    var dataSource = get_msfcgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "MustSubmit", title: "Must Submit", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_msfcgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    MustSubmit: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_prplkendoGridData(reportType, recordType) {
    var dataSource = get_prplgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "ProductLevel", title: "Product Level", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_prplgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    ProductLevel: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbyregionkendoGridData(reportType, recordType) {
    var dataSource = get_frbyregiongridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "Region", title: "Region", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbyregiongridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Region: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

/////-------//////////
function get_serekendoGridData(reportType, recordType) {
    var dataSource = get_seregridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "EMailRequired", title: "EMail Required", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_seregridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    EMailRequired: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbystatekendoGridData(reportType, recordType) {
    var dataSource = get_frbystategridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "State", title: "Region", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbystategridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    State: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frbyusingcrmkendoGridData(reportType, recordType) {
    var dataSource = get_frbyusingcrmgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "UsingCRM", title: "Using CRM", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frbyusingcrmgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    UsingCRM: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_zcbtkendoGridData(reportType, recordType) {
    var dataSource = get_zcbtgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "Territory", title: "Territory", width: "80px" },
            { field: "State", title: "State", width: "80px" },
            { field: "BusinessFocusArea", title: "Business Focus Area", width: "80px" },
            { field: "ClosestMetroArea", title: "Closest Metro Area", width: "80px" },
            { field: "ZipCode", title: "Zip Code", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_zcbtgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Territory: { type: 'string' },
                    State: { type: 'string' },
                    BusinessFocusArea: { type: 'string' },
                    ClosestMetroArea: { type: 'string' },
                    ZipCode: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_mfrdkendoGridData(reportType, recordType) {
    var dataSource = get_mfrdgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "MasterFranchise", title: "Master Franchise", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "LocalPrint", title: "Local Print", width: "60px" },
            { field: "BuyFromSSI", title: "Buy From SSI", width: "60px" },
            { field: "FixedPricePurchase", title: "Fixed Price Purchase", width: "60px" },
            { field: "ProductCost", title: "Product Cost", width: "60px" },
            { field: "PercentBehind", title: "Percent Behind", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_mfrdgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    MasterFranchise: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    LocalPrint: { type: 'string' },
                    BuyFromSSI: { type: 'string' },
                    FixedPricePurchase: { type: 'string' },
                    ProductCost: { type: 'string' },
                    PercentBehind: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_msfrkendoGridData(reportType, recordType) {
    var dataSource = get_msfrgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "MasterFranchise", title: "Master Franchise", width: "80px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_msfrgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    MasterFranchise: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_msrbykeyopnldrkendoGridData(reportType, recordType) {
    var dataSource = get_msrbykeyopnldrgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_msrbykeyopnldrgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_msrbyadvboardkendoGridData(reportType, recordType) {
    var dataSource = get_msrbyadvboardgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
              { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_msrbyadvboardgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_msrbymktgcomkendoGridData(reportType, recordType) {
    var dataSource = get_msrbymktgcomgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
              { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_msrbymktgcomgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_dhsakendoGridData(reportType, recordType) {
    var dataSource = get_dhsagridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "DHSAwardDate", title: "DHS Award Date", width: "80px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_dhsagridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    DHSAwardDate: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_frmdkendoGridData(reportType, recordType) {
    var dataSource = get_frmdgridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_frmdgridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function get_glaakendoGridData(reportType, recordType) {
    var dataSource = get_glaagridDataSource(reportType, recordType)
    var kendoGridData = {
        dataSource: dataSource,
        height: 480,
        filterable: false,
        sortable: true,
        pageable: {
            refresh: true,
            pageSizes: true
        },
        resizable: true,
        columnMenu: true,
        dataBound: onDataBound,
        scrollable: true,
        navigatable: true,
        selectable: true,
        columns: [
            {
                command: [
                            { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa' onclick='showAllRecordDetails(event)'><span class='glyphicon glyphicon-search'></span></button>" }
                ],
                title: " ", width: "35px"
            },
            { field: "Agreement", title: "Agreement", width: "80px" },
            { field: "LastName", title: "Last Name", width: "80px" },
            { field: "FirstName", title: "First Name", width: "60px" },
            { field: "FranchiseName", title: "Franchise Name", width: "60px" },
            { field: "PrimaryOfficeEmail", title: "Primary Office Email", width: "60px" },
            { field: "ContactNumber", title: "Contact Number", width: "60px" },
            { field: "LastUpdated", title: "Last Updated", width: "60px" },
            { field: "ID", hidden: "true" }

        ]
    }
    return kendoGridData;
}
function get_glaagridDataSource(reportType, recordType) {
    var dataSource = {
        type: "json",
        transport: {
            read: {
                url: "api/HomeOfficeReports/",
                dataType: "json",
                data: { reportType: reportType, recordType: recordType },
                cache: false //This is required othewise grid does not refresh after Edit operation in IE
            }
        },
        schema: {
            data: "results",
            total: "__count",
            model: {
                fields: {
                    Agreement: { type: 'string' },
                    LastName: { type: 'string' },
                    FirstName: { type: 'string' },
                    FranchiseName: { type: 'string' },
                    PrimaryOfficeEmail: { type: 'string' },
                    ContactNumber: { type: 'string' },
                    LastUpdated: { type: 'string' },
                    ID: { type: 'string' }
                }
            }
        },
        pageSize: 50,
        serverPaging: true,
        serverFiltering: true,
        serverSorting: true
    };
    return dataSource;
}

function reportTypeChange() {
    //$('#homeOfficeReportgrid').children().remove();
    /* var CHANGE = 'change',
        $grid = $("#homeOfficeReportgrid");
     if ($grid.length > 0 && $grid.data().kendoGrid) {
         var thisKendoGrid = $grid.data().kendoGrid;
         if (thisKendoGrid.dataSource && CHANGE, thisKendoGrid._refreshHandler) {
             thisKendoGrid.dataSource.unbind(CHANGE, thisKendoGrid._refreshHandler);
             $grid.removeData('kendoGrid');
             $grid.empty();
         }
     }*/
};

function reportF_viewModel() {

    var self = this;

    self.IsReportHasData = ko.observable(false);

}

function onDataBound(arg) {
    /*Show or hide download button*/
    
    if (this.dataSource.total() > 0) {
        reportF.IsReportHasData(true);
    }

    else {

        reportF.IsReportHasData(false);
    }
    
}


function ng_homeOfficeReportsCtrl($scope, $http) {
    angular.element(document).ready(function () {

        showNoti_.progress(NOTIFICMSG.PROCESSING, false);
       var data = [
                    { text: "Select a report..", value: "" },
                        { text: "Franchisee Report By - Award Level", value: "frbyawlevel" },
                       { text: "Franchisee Report By - Business Area", value: "frbybusarea" },
                       { text: "Franchisee Report By - Certification Level", value: "frbycertlevel" },
                       { text: "Franchisee Report By - Coach", value: "frbycoach" },
                       { text: "Franchisee Report By - Contract Details", value: "frbycontdetails" },
                       { text: "Franchisee Report By - Contractors Allowed?", value: "ctra" },
                       { text: "Franchisee Report By - Country/Province", value: "frbycountry" },
                       { text: "Franchisee Report By - Initial Training Date", value: "frbytrngdate" },
                       { text: "Franchisee Report By - Must Submit Financials", value: "msfc" },
                       { text: "Franchisee Report By - Product Purchase Levels", value: "prpl" },
                       { text: "Franchisee Report By - Region", value: "frbyregion" },
                       { text: "Franchisee Report By - Sandler Email Required?", value: "sere" },
                       { text: "Franchisee Report By - State", value: "frbystate" },
                       { text: "Franchisee Report By - Using Sandler CRM", value: "frbyusingcrm" },
                       { text: "Franchisee Report By - Territory", value: "zcbt" },

                       { text: "Master Franchisee Details", value: "mfrd" },
                       { text: "Master/Sub Franchisees", value: "msfr" },
                       { text: "Key Opinion Leaders", value: "msrbykeyopnldr" },
                       { text: "Advisory Board", value: "msrbyadvboard" },
                        { text: "Marketing Committee", value: "msrbymktgcom" },
                        { text: "David H. Sandler Award", value: "dhsa" },
                        { text: "Franchisee Member Details", value: "frmd" },
                        { text: "Global Account Agreement", value: "glaa" }

                      
        ];
       $("#reportTypeSelection").kendoDropDownList({
            dataTextField: "text",
            dataValueField: "value",
            dataSource: data,
            height: 100,
            change: reportTypeChange
        })
        
        showNoti_.hide();

        //When Search Button is clicked 
        $("#btnSearch").click(function () {
            var reportType = $("#reportTypeSelection").attr('value');
            //var reportLabel = $("#reportLabel").val();
           
            //if (reportType == "") {
            //    alert(reportType);
            //    kendo.bind($("#reportLabel").attr('value'), "Select a report");
            //    return;
            //}
            var CHANGE = 'change',
                $grid = $("#homeOfficeReportgrid");
            if ($grid.length > 0 && $grid.data().kendoGrid) {
                var thisKendoGrid = $grid.data().kendoGrid;
                if (thisKendoGrid.dataSource && CHANGE, thisKendoGrid._refreshHandler) {
                    thisKendoGrid.dataSource.unbind(CHANGE, thisKendoGrid._refreshHandler);
                    $grid.removeData('kendoGrid');
                    $grid.empty();
                }
            }
            
            kendo.bind($("#reportLabel"), getReportDisplayName(reportType));
            var kendoGridData = GetDataSource(reportType,"")    
            $("#homeOfficeReportgrid").kendoGrid(kendoGridData);
                
        });

        //Now bind the Client side model for Add New Follow-up Item
        reportF = new reportF_viewModel();
        ko.applyBindings(reportF, document.getElementById("homeOfficeReportsMain"));


   
     
    });

};