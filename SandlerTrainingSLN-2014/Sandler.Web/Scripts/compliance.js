function getFormatedDate(data) {
    if (data != null && data != '' && data != undefined) {
        return $.datepicker.formatDate('mm/dd/yy', new Date(data));
    }
    else
        return '';
}

function complianceVM(userId, userAgency) {
    var self = this;
    self.account = ko.observable('');
    self.agency = ko.observable(userAgency);
    self.lastName = ko.observable('');
    self.firstName = ko.observable('');
    self.dob = ko.observable('');
    self.address = ko.observable('');
    self.city = ko.observable('');
    self.state = ko.observable('');
    self.zip = ko.observable('');
    self.homePhone = ko.observable('');
    self.workPhone = ko.observable('');
    self.mobilePhone = ko.observable('');
    self.lastFourSSN = ko.observable('');
    self.debtorIdentityVerified_YesNo = ko.observable('');
    self.contactMethodId = ko.observable('');
    self.contactTimeId = ko.observable('');
    self.creditorName = ko.observable('');
    self.debtProductId = ko.observable('');
    self.debtPurchaseBalance = ko.observable('');
    self.debtCurrentBalance = ko.observable('');
    self.disputeDebt_YesNo = ko.observable('');
    self.disputeDebtAmount_YesNo = ko.observable('');
    self.disputeDebtDueDate_YesNo = ko.observable('');
    //Complaint section
    self.complaintID = ko.observable('');
    var todaysDate = new Date();
    todaysDate.setDate(todaysDate.getDate());
    self.complaintDate = ko.observable($.datepicker.formatDate('mm/dd/yy', todaysDate));
    self.complaintReceivedByMethodId = ko.observable('');
    self.complaintIssueId = ko.observable('');
    self.complaintNotes = ko.observable('');
    self.complaintUploadDocument = ko.observable('');
    self.complaintSubmitedToAgency_YesNo = ko.observable('');
    self.complaintSubmitedToAgencyDate = ko.observable('');
    self.moreInfoReqdFromDebtor_YesNo = ko.observable('');
    self.moreInfoRequestedDate = ko.observable('');
    self.moreInfoRequested = ko.observable('');
    self.moreInfoReceivedFromDebtor_YesNo = ko.observable('');
    self.moreInfoReceivedDate = ko.observable('');
    self.moreInfoReceived = ko.observable('');
    //Debt Owner Process
    self.complaintSubmittedToOwner_YesNo = ko.observable('');
    self.complaintSubmittedDate = ko.observable('');
    self.timeToSubmitDays = ko.observable('');
    self.debtOwnerUploadDocument = ko.observable('');
    self.moreInfoFromAgency_YesNo = ko.observable('');
    self.moreInfoFromAgencyRequestedDate = ko.observable('');
    self.moreInfoFromAgencyRequested = ko.observable('');
    self.moreInfoFromAgencyReceived_YesNo = ko.observable('');
    self.moreInfoFromAgencyReceived = ko.observable('');
    self.moreInfoFromAgencyReceivedDate = ko.observable('');
    self.ownerResponseId = ko.observable('');
    self.ownerResponseDate = ko.observable('');
    self.ownerResponseDays = ko.observable('');
    self.agencyResponseToDebtorDate = ko.observable('');
    self.totalResponseTimeDays = ko.observable('');
    self.debtorAgree_YesNo = ko.observable('');
    self.needFurtherAction_YesNo = ko.observable('');
    self.finalActionStepId = ko.observable('');
    self.createdBy = ko.observable(userId);
    self.updatedBy = ko.observable(userId);

    self.complaintinfoDocumentChecked = ko.observable(false);
    self.debtOwnerProcessDocumentChecked = ko.observable(false);
    self.complaintDocument = ko.observable('');
    self.complaintDocUrl = ko.observable('');
    self.debtOwnerProcessDocument = ko.observable('');
    self.debtOwnerProcessDocUrl = ko.observable('');

    self.complaintSubmitedToAgency_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.complaintSubmitedToAgencyDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.moreInfoRequestedDate('');
        }
    }, self);
    self.moreInfoReqdFromDebtor_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.moreInfoRequestedDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.moreInfoRequestedDate('');
        }
    }, self);

    self.moreInfoReceivedFromDebtor_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.moreInfoReceivedDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.moreInfoReceivedDate('');
        }
    }, self);

    self.complaintSubmittedToOwner_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.complaintSubmittedDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.complaintSubmittedDate('');
        }
    }, self);

    self.moreInfoFromAgency_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.moreInfoFromAgencyRequestedDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.moreInfoFromAgencyRequestedDate('');
        }
    }, self);

    self.moreInfoFromAgencyReceived_YesNo.subscribe(function (value) {
        if (value == 'true') {
            var todaysDate = new Date();
            todaysDate.setDate(todaysDate.getDate());
            self.moreInfoFromAgencyReceivedDate($.datepicker.formatDate('mm/dd/yy', todaysDate));
        }
        else {
            self.moreInfoFromAgencyReceivedDate('');
        }
    }, self);

    self.save = function (userRole) {
        var json = JSON.stringify({
            AgencyId: self.agency(),
            AccountNumber: self.account(),
            LastName: self.lastName(),
            FirstName: self.firstName(),
            Address: self.address(),
            City: self.city(),
            State: self.state(),
            Zip: self.zip(),
            HomePhone: self.homePhone(),
            WorkPhone: self.workPhone(),
            MobilePhone: self.mobilePhone(),
            LastFourSSN: self.lastFourSSN(),
            DebtorIdentityVerifiedYN: self.debtorIdentityVerified_YesNo(),
            DebtorContactMethodId: self.contactMethodId(),
            DebtorContactTimeId: self.contactTimeId(),
            CreditorName: self.creditorName(),
            DebtorProductId: self.debtProductId(),
            DebtPurchaseBalance: Number(self.debtPurchaseBalance().replace(/[^0-9\.]+/g, "")),
            DebtCurrentBalance: Number(self.debtCurrentBalance().replace(/[^0-9\.]+/g, "")),
            DisputeDebtYN: self.disputeDebt_YesNo(),
            DisputeDebtAmountYN: self.disputeDebtAmount_YesNo(),
            DisputeDebtDueDateYN: self.disputeDebtDueDate_YesNo(),
            ComplaintId: self.complaintID(),
            ComplaintDate: self.complaintDate(),
            ReceivedByMethodId: self.complaintReceivedByMethodId(),
            IssuesId: self.complaintIssueId(),
            ComplaintNotes: self.complaintNotes(),
            ComplaintSubmittedToAgencyYN: self.complaintSubmitedToAgency_YesNo(),
            ComplaintSubmittedToAgencyDate: self.complaintSubmitedToAgencyDate(),
            MoreInfoReqdFromDebtorYN: self.moreInfoReqdFromDebtor_YesNo(),
            MoreInfoRequestedDate: self.moreInfoRequestedDate(),
            MoreInfoRequested: self.moreInfoRequested(),
            MoreInfoReceivedFromDebtorYN: self.moreInfoReceivedFromDebtor_YesNo(),
            MoreInfoReceivedDate: self.moreInfoReceivedDate(),
            MoreInfoReceived: self.moreInfoReceived(),
            ComplaintSubmittedToOwnerYN: self.complaintSubmittedToOwner_YesNo(),
            ComplaintSubmittedDate: self.complaintSubmittedDate(),
            TimeToSubmitDays: self.timeToSubmitDays(),
            MoreInfoFromAgencyYN: self.moreInfoFromAgency_YesNo(),
            MoreInfoFromAgencyRequestedDate: self.moreInfoFromAgencyRequestedDate(),
            MoreInfoFromAgencyRequested: self.moreInfoFromAgencyRequested(),
            MoreInfoFromAgencyReceived: self.moreInfoFromAgencyReceived(),
            MoreInfoFromAgencyReceivedYN: self.moreInfoFromAgencyReceived_YesNo(),
            MoreInfoFromAgencyReceivedDate: self.moreInfoFromAgencyReceivedDate(),
            OwnerResponseId: self.ownerResponseId(),
            OwnerResponseDate: self.ownerResponseDate(),
            OwnerResponseDays: self.ownerResponseDays(),
            AgencyResponseToDebtorDate: self.agencyResponseToDebtorDate(),
            TotalResponseTimeDays: self.totalResponseTimeDays(),
            DebtorAgreeYN: self.debtorAgree_YesNo(),
            NeedFurtherActionYN: self.needFurtherAction_YesNo(),
            FinalActionStepId: self.finalActionStepId(),
            CreatedBy: self.createdBy(),
            ComplaintStatusId: evaluateStatusId(userRole),
            UpdatedBy:self.updatedBy()
        });

        function evaluateStatusId(userRole) {
            if (userRole == 'CollectionAgency') {
            }
            else if (userRole == 'DebtOwner') {
            }
        }
        function setComplaint(data) {
            self.populateCompliance(data.Tbl_Account.Tbl_Agency.Name, data.Tbl_Account.AccountNumber, data.Tbl_Account.FirstName, data.Tbl_Account.LastName, '', data.Tbl_Account.Address, data.Tbl_Account.City, data.Tbl_Account.State, data.Tbl_Account.Zip, data.Tbl_Account.LastFourSSN, data.Tbl_Account.MobilePhone, data.Tbl_Account.HomePhone, data.Tbl_Account.WorkPhone, data.DebtorIdentityVerifiedYN, data.DebtorContactMethodId, data.DebtorContactTimeId, data.Tbl_Account.DebtCurrentBalance, data.Tbl_Account.DebtPurchaseBalance, data.Tbl_Account.CreditorName, data.DebtorProductId, data.DisputeDebtYN, data.DisputeDebtAmountYN, data.DisputeDebtDueDateYN, data.ComplaintId, data.ComplaintDate, data.ReceivedByMethodId, data.IssuesId, data.ComplaintNotes, data.ComplaintSubmittedToAgencyYN, data.ComplaintSubmittedToAgencyDate, data.MoreInfoReqdFromDebtorYN, data.MoreInfoRequestedDate, data.MoreInfoRequested, data.MoreInfoReceivedFromDebtorYN, data.MoreInfoReceivedDate, data.MoreInfoReceived, data.ComplaintSubmittedToOwnerYN, data.ComplaintSubmittedDate, data.TimeToSubmitDays, data.MoreInfoFromAgencyYN, data.MoreInfoFromAgencyRequestedDate, data.MoreInfoFromAgencyRequested, data.MoreInfoFromAgencyReceived, data.MoreInfoFromAgencyReceivedYN, data.MoreInfoFromAgencyReceivedDate, data.OwnerResponseId, data.OwnerResponseDate, data.OwnerResponseDays, data.AgencyResponseToDebtorDate, data.TotalResponseTimeDays, data.DebtorAgreeYN, data.NeedFurtherActionYN, data.FinalActionStepId, data.CreatedBy, data.ComplaintDocument, data.DebtOwnerProcessDocument);
        };

        $.ajax({
            url: baseUrl + '/api/Compliance/',
            type: "POST",
            data: json,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (response) {
                console.log('save complaint');
                console.log(response);
                setComplaint(response);
            },
            error: function (response, errorText) {
                return false;
            }
        });
    }

    self.populateCompliance = function (agency,account, firstName, lastName, dob, address, city, state, zip, ssn, phoneCell, phoneHome, phoneWork, debtorIdentityVerified_YesNo, debtorContactMethodId, debtorContactTimeId, debtCurrentBalance, debtPurchaseBalance, creditorName, debtProductId, disputeDebt_YesNo, disputeDebtAmount_YesNo, disputeDebtDueDate_YesNo, complaintID, complaintDate, complaintMethodId, complaintIssueId, complaintNotes, complaintSubmitedToAgency_YesNo, complaintSubmitedToAgencyDate, moreInfoReqdFromDebtor_YesNo, moreInfoRequestedDate, moreInfoRequested, moreInfoReceivedFromDebtor_YesNo, moreInfoReceivedDate, moreInfoReceived, complaintSubmittedToOwner_YesNo, complaintSubmittedDate, timeToSubmitDays, moreInfoFromAgency_YesNo, moreInfoFromAgencyRequestedDate, moreInfoFromAgencyRequested, moreInfoFromAgencyReceived, moreInfoFromAgencyReceivedYN, moreInfoFromAgencyReceivedDate, ownerResponseId, ownerResponseDate, ownerResponseDays, agencyResponseToDebtorDate, totalResponseTimeDays, debtorAgree_YesNo, needFurtherAction_YesNo, finalActionStepId, createdBy, complaintDoc, debtOwnerProcessDoc) {
        self.agency(agency); 
        self.account(account);
        self.firstName(firstName);
        self.lastName(lastName);
        self.dob(dob);
        self.address(address);
        self.city(city);
        self.state(state);
        self.zip(zip);
        self.lastFourSSN(ssn);
        self.mobilePhone(phoneCell);
        self.homePhone(phoneHome);
        self.workPhone(phoneWork);
        self.debtorIdentityVerified_YesNo((debtorIdentityVerified_YesNo) ? 'true' : 'false');
        self.contactMethodId(debtorContactMethodId);
        self.contactTimeId(debtorContactTimeId);
        self.creditorName(creditorName);
        self.debtProductId(debtProductId);
        self.debtPurchaseBalance(((debtPurchaseBalance == '') ? '' : formatCurrency(debtPurchaseBalance)));
        self.debtCurrentBalance(((debtCurrentBalance == '') ? '' : formatCurrency(debtCurrentBalance)));
        self.disputeDebt_YesNo((disputeDebt_YesNo) ? 'true' : 'false');
        self.disputeDebtAmount_YesNo((disputeDebtAmount_YesNo) ? 'true' : 'false');
        self.disputeDebtDueDate_YesNo((disputeDebtDueDate_YesNo) ? 'true' : 'false');
        self.complaintID(complaintID);
        self.complaintDate(getFormatedDate(complaintDate));
        self.complaintReceivedByMethodId(complaintMethodId);
        self.complaintIssueId(complaintIssueId);
        self.complaintNotes(complaintNotes);
        self.complaintSubmitedToAgency_YesNo((complaintSubmitedToAgency_YesNo) ? 'true' : 'false');
        self.complaintSubmitedToAgencyDate(getFormatedDate(complaintSubmitedToAgencyDate));
        self.moreInfoReqdFromDebtor_YesNo((moreInfoReqdFromDebtor_YesNo) ? 'true' : 'false');
        self.moreInfoRequestedDate(getFormatedDate(moreInfoRequestedDate));
        self.moreInfoRequested(moreInfoRequested);
        self.moreInfoReceivedFromDebtor_YesNo((moreInfoReceivedFromDebtor_YesNo) ? 'true' : 'false');
        self.moreInfoReceivedDate(getFormatedDate(moreInfoReceivedDate));
        self.moreInfoReceived(moreInfoReceived);
        self.complaintSubmittedToOwner_YesNo((complaintSubmittedToOwner_YesNo) ? 'true' : 'false');
        self.complaintSubmittedDate(getFormatedDate(complaintSubmittedDate));
        self.timeToSubmitDays(timeToSubmitDays);
        self.moreInfoFromAgency_YesNo((moreInfoFromAgency_YesNo) ? 'true' : 'false');
        self.moreInfoFromAgencyRequestedDate(getFormatedDate(moreInfoFromAgencyRequestedDate));
        self.moreInfoFromAgencyRequested(moreInfoFromAgencyRequested);
        self.moreInfoFromAgencyReceived(moreInfoFromAgencyReceived);
        self.moreInfoFromAgencyReceived_YesNo((moreInfoFromAgencyReceivedYN) ? 'true' : 'false');
        self.moreInfoFromAgencyReceivedDate(getFormatedDate(moreInfoFromAgencyReceivedDate));
        self.ownerResponseId(ownerResponseId);
        self.ownerResponseDate(getFormatedDate(ownerResponseDate));
        self.ownerResponseDays(ownerResponseDays);
        self.agencyResponseToDebtorDate(getFormatedDate(agencyResponseToDebtorDate));
        self.totalResponseTimeDays(totalResponseTimeDays);
        self.debtorAgree_YesNo(debtorAgree_YesNo);
        self.needFurtherAction_YesNo(needFurtherAction_YesNo);
        self.finalActionStepId(finalActionStepId);
        //self.createdBy(createdBy)

        if (complaintDoc != null && complaintDoc != '' && complaintDoc != undefined) {
            self.complaintDocument(complaintDoc.split('_')[1]);
            self.complaintDocUrl(baseUrl + '/Compliance/Home/DownloadDoc?fileName=' + complaintDoc);
        }
        if (debtOwnerProcessDoc != null && debtOwnerProcessDoc != '' && debtOwnerProcessDoc != undefined) {
            self.debtOwnerProcessDocument(debtOwnerProcessDoc.split('_')[1]);
            self.debtOwnerProcessDocUrl(baseUrl + '/Compliance/Home/DownloadDoc?fileName=' + debtOwnerProcessDoc);
        }
    }    
}

function pimsDebtor(account, firstName, lastName, dob, address1, address2, city, state, zip, ssn, phoneCell, phoneHome, phoneWork, debtCurrentBalance, debtorPurchaseBalance, creditorName, accountOriginal) {
    var self = this;
    self.account = ko.observable(account);
    self.firstName = ko.observable(firstName);
    self.lastName = ko.observable(lastName);
    self.dob = ko.observable(dob);
    self.address1 = ko.observable(address1);
    self.address2 = ko.observable(address2);
    self.city = ko.observable(city);
    self.state = ko.observable(state);
    self.zip = ko.observable(zip);
    self.ssn = ko.observable(ssn);
    self.phoneCell = ko.observable(phoneCell);
    self.phoneHome = ko.observable(phoneHome);
    self.phoneWork = ko.observable(phoneWork);
    self.debtCurrentBalance = ko.observable(debtCurrentBalance);
    self.debtorPurchaseBalance = ko.observable(debtorPurchaseBalance);
    self.creditorName = ko.observable(creditorName);
    self.accountOriginal = ko.observable(accountOriginal);
}