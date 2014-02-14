/* [[[ Assessement Index ]]] - BT */
function userViewModel(userId) {
    var self = this;
    self.userId = userId;
    self.userName = ko.observable('')
    self.firstName = ko.observable('');
    self.lastName = ko.observable('');
    self.email = ko.observable('');
    self.role = ko.observable('');
    self.agencySelected = ko.observable('');
    self.roleKeyTitle = ko.observable('');
    self.lawFirmSelected = ko.observable('');
    self.creditIssuerSelected = ko.observable('');
    self.debtOwnerSelected = ko.observable('');
    self.agencies = ko.computed(function () {
        var localAgencies = [];
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'Agencies' },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data.length);
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        //log(item.Text);
                        localAgencies.push(item);
                    });
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
        return localAgencies;
    }, self);

    self.lawFirms = ko.computed(function () {
        var localLawFirms = [];
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'LawFirm' },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data.length);
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        //log(item.Text);
                        localLawFirms.push(item);
                    });
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
        return localLawFirms;
    }, self);

    self.creditIssuers = ko.computed(function () {
        var localCreditIssuers = [];
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'CreditIssuers' },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data.length);
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        //log(item.Text);
                        localCreditIssuers.push(item);
                    });
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
        return localCreditIssuers;
    }, self);

    self.debtOwners = ko.computed(function () {
        var localDebtOwners = [];
        $.ajax({
            url: baseUrl + '/api/Lookup/',
            type: 'GET',
            contentType: 'application/json',
            data: { id: 'DebtOwner' },
            dataType: 'json',
            async: false,
            success: function (data) {
                //log(data.length);
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        //log(item.Text);
                        localDebtOwners.push(item);
                    });
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
        return localDebtOwners;
    }, self);

    self.fill = function (id, name, fname, lname, email, role, roleKeyVal) {
        self.userId = id;
        self.userName(name)
        self.firstName(fname);
        self.lastName(lname);
        self.email(email);
        self.role(role);
        if (role != undefined) {
            if (role == 'CollectionAgency')
                self.agencySelected(roleKeyVal);
            else if (role == 'CollectionLawfirm')
                self.lawFirmSelected(roleKeyVal);
            else if (role == 'CreditIssuer')
                self.creditIssuerSelected(roleKeyVal);
            else
                self.debtOwnerSelected(roleKeyVal);
        }
    }

    self.showMessage = ko.observable(false);
    self.message = ko.observable('');

    self.saveVisible = ko.observable(false);
    self.createNewVisible = ko.observable(true);
    self.makeAgenciesVisible = ko.observable(false);
    self.makeLawFirmVivible = ko.observable(false);
    self.makeCreditIssuersVisible = ko.observable(false);
    self.makeDebtOwnersVisible = ko.observable(false);

    self.roles = ko.computed(function () {
        var applicationRoles = [];
        $.ajax({
            url: baseUrl + '/Account/GetApplicationRoles/',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: false,
            success: function (data) {
                //log(data);
                //applicationRoles.push({ text: 'Select Role', value: '' });
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        console.log(item);
                        applicationRoles.push({ text: item, value: item });
                    });
                }
            },
            error: function (response, errorText) {
                log(errorText);
            }
        });
        return applicationRoles;
    }, self);
    self.showEditContainer = ko.observable(false);
    self.role.subscribe(function (roleSelected) {
        self.makeAgenciesVisible(false);
        self.makeLawFirmVivible(false);
        self.makeCreditIssuersVisible(false);
        self.makeDebtOwnersVisible(false);
        if (roleSelected == 'CollectionAgency') {
            self.roleKeyTitle('Collection Agency');
            self.makeAgenciesVisible(true);
        }
        else if (roleSelected == 'CollectionLawfirm') {
            self.roleKeyTitle('Collection Lawfirm');
            self.makeLawFirmVivible(true);
        }
        else if (roleSelected == 'CreditIssuer') {
            self.roleKeyTitle('Credit Issuer');
            self.makeCreditIssuersVisible(true);
        }
        else if (roleSelected == 'DebtOwner') {
            self.roleKeyTitle('Debt Owner');
            self.makeDebtOwnersVisible(true);
        }
        else {
            self.roleKeyTitle('');
            self.makeAgenciesVisible(false);
        }
    }.bind(self));

    self.save = function () {
        var roleEntityValue;
        //alert(self.firstName() + '' + self.lastName() + '' + self.email())
        if (self.firstName() == '' || self.firstName() == undefined || self.lastName() == '' || self.lastName() == undefined || self.email() == '' || self.email() == undefined) {
            //alert('First Name, Last Name and Email is required');
            showNoti_.error('First Name, Last Name and Email is required!!', false);
            return false;
        }
        if (self.makeAgenciesVisible()) {
            if (self.role() == 'CollectionAgency' && self.agencySelected() == '' || self.agencySelected() == undefined) {
                //alert('Collection Agency value is required');
                showNoti_.error('Collection Agency value is required!!', false);
                return false;
            }
            roleEntityValue = self.agencySelected()
        }
        else if (self.makeLawFirmVivible()) {
            if (self.role() == 'CollectionLawfirm' && (self.lawFirmSelected() == '' || self.lawFirmSelected() == undefined)) {
                //alert('Collection LawFirm value is required');
                showNoti_.error('Collection LawFirm value is required!!', false);
                return false;
            }
            roleEntityValue = self.lawFirmSelected()
        }
        else if (self.makeCreditIssuersVisible()) {
            if (self.role() == 'CreditIssuer' && (self.creditIssuerSelected() == '' || self.creditIssuerSelected() == undefined)) {
                //alert('Credit Issuer value is required');
                showNoti_.error('Credit Issuer value is required!!', false);
                return false;
            }
            roleEntityValue = self.creditIssuerSelected()
        }
        else if (self.makeDebtOwnersVisible()) {
            if (self.role() == 'DebtOwner' && (self.debtOwnerSelected() == '' || self.debtOwnerSelected() == undefined)) {
                //alert('Debt Owner value is required');
                showNoti_.error('Debt Owner value is required!!', false);
                return false;
            }
            roleEntityValue = self.debtOwnerSelected()
        }
        var json = JSON.stringify({
            userId: self.userId, firstName: self.firstName(), lastName: self.lastName(), email: self.email(), role: self.role(), roleEntityValue: roleEntityValue
        });
        $.ajax({
            url: baseUrl + '/Account/UpdateUser/',
            type: "POST",
            data: json,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            async: true,
            success: function (response) {
                log(response);
                //if (self.userId == '') {
                //    location.reload();
                //}
                self.showMessage(true);
                self.message('User account data has been added or updated');
                var grid = $("#usersGrid").data("kendoGrid");
                //console.log(grid);
                grid.dataSource.page(1);
                grid.dataSource.read();
            },
            error: function (response, errorText) {
                log(errorText);
            }
        });
    }
    self.clear = function () {
        self.fill('', '', '', '', '', undefined, undefined);
        self.makeAgenciesVisible(false);
        self.makeCreditIssuersVisible(false);
        self.makeDebtOwnersVisible(false);
        self.makeLawFirmVivible(false);
        self.roleKeyTitle('');
        self.agencySelected('');
        self.creditIssuerSelected('');
        self.lawFirmSelected('');
        self.debtOwnerSelected('');
    }
    self.saveCancel = function () {
        self.clear();
        self.saveVisible(false);
        //self.createNewVisible(true);
        $('#editContainer').modal('hide');
    }
}
ko.bindingHandlers.fadeVisible = {
    init: function (element, valueAccessor) {
        var value = valueAccessor();
    },
    update: function (element, valueAccessor) {
        var value = valueAccessor();
        ko.utils.unwrapObservable(value) ? $(element).fadeIn(3000, function () {
            $(element).fadeOut(5000);
            value(false)
        }) : $(element).fadeOut();
    }
};

function ng_manageUsersCtrl($scope, $http) {
    angular.element(document).ready(function () {

        var dataSource = new kendo.data.DataSource({
            transport: {
                read: {
                    url: baseUrl + '/Account/GetAllUsers',
                    dataType: "json"
                }
            },
            batch: true,
            pageSize: 10,
            schema: {
                model: {
                    id: "UserId",
                    fields: {
                        FirstName: { type: "string", validation: { required: true } },
                        LastName: { type: "string", validation: { required: true } },
                        Email: { validation: { required: true } },
                        UserName: { type: "string", validation: { required: true }, editable: false },
                        Role: { type: "string" },
                        RoleKeyValue: { type: "string" }
                    }
                }
            }
        });

        $("#usersGrid").kendoGrid({
            dataSource: dataSource,
            pageable: true,
            height: 430,
            toolbar: kendo.template($("#template").html()),
            columns: [
                { field: "FirstName", title: "First Name", width: "100px" },
                { field: "LastName", title: "Last Name", width: "100px" },
                { field: "Email", title: "Email", width: "100px" },
                { field: "UserName", title: "User Name", width: "100px" },
                //{ field: "Role", title: "Role", values: applicationRoles, width: "100px" },
                {
                    command: [
                        //{ id: "edit", name: "edit", template: "<a class='k-button k-grid-edit editsa' title='View/Edit' style='min-width:16px;'><span class='k-icon k-edit'></span></a>" },
                        { template: "<button title='View/Edit' class='btn btn-success btn-sm editsa'><span class='glyphicon glyphicon-search'></span></button>" }
                        
                    ], title: " ", width: "30px"
                }],
        });
        var uvm = new userViewModel('');
        ko.applyBindings(uvm, $('#editContainer')[0]);
            //@*Edit record*@
            $('#usersGrid').on('click', '.editsa', function (e) {
                //e.preventDefault();
                //var dataItem = $("#usersGrid").data("kendoGrid").dataItem($(this).closest("tr"));
                ////@*Now let us clear what we have on this page*@
                //console.log(dataItem);
                //$('#editContainer').modal();
                //uvm.showEditContainer(true);
                //uvm.fill(dataItem.UserId, dataItem.UserName, dataItem.FirstName, dataItem.LastName, dataItem.Email, dataItem.Role, dataItem.RoleKeyValue);
                //uvm.saveVisible(true);

                e.preventDefault();
                var item = $("#usersGrid").data("kendoGrid").dataItem($(this).closest("tr"));
                var randomnumber = Math.floor(Math.random() * 101);
                uvm.showEditContainer(true);
                uvm.fill(item.UserId, item.UserName, item.FirstName, item.LastName, item.Email, item.Role, item.RoleKeyValue);
                modalOptions = { backdrop: 'static', show: true };
                var modalHeader = 'User - Edit';
                $('#modal-headerLabel').text(modalHeader);
                $('#user_detail').modal(modalOptions);

            });

        $('#usersGrid').on('click', '.k-grid-add', function (e) {
            //e.preventDefault();
            //console.log('Adding new record');
            //$('#editContainer').modal();
            //uvm.showEditContainer(true);
            //uvm.fill('', '', '', '', '', '', '');
            //uvm.saveVisible(true);

            e.preventDefault();
            uvm.showEditContainer(true);
            uvm.fill('', '', '', '', '', '', '');
            modalOptions = { backdrop: 'static', show: true };
            var modalHeader = 'User - Add';
            $('#modal-headerLabel').text(modalHeader);
            $('#user_detail').modal(modalOptions);
            
        });
        
    });

};