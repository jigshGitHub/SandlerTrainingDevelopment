/* [[[ Assessement Index ]]] - BT */

//http://stackoverflow.com/questions/17876213/typeerror-cannot-read-property-childnodes-of-undefined-in-angularjs-directive


var answerOptions = [{ Text: 'Unsure', Value: '1' }, { Text: 'Slightly Agree', Value: '2' }, { Text: 'Agree', Value: '3' }, { Text: 'Strongly Agree', Value: '4' }, { Text: 'Fully Compliant', Value: '5' }, { Text: 'Not applicable', Value: 'N/A' }];
function assessmentResponse (_id, _text, _toolTipText, _srNo, _response, _responseId, _userId, _recommendation) {
    var self = this;
    self.id = ko.observable(_id);
    self.response = ko.observable(_response);
    self.responses = ko.observableArray(answerOptions);
    self.text = ko.observable(_text);
    self.toolTipText = _toolTipText;
    self.serialNumber = ko.observable(_srNo);
    self.responseId = ko.observable(_responseId);
    self.userId = _userId;
    self.recommendation = _recommendation;
    self.response.subscribe(function (responseSelected) {
        //log(responseSelected);
        if (responseSelected != '' && responseSelected != undefined) {
            self.updateResponse(JSON.stringify({
                ResponseId: self.responseId(),
                Response: responseSelected,
                UserId: self.userId
            }));
        }
    }, self);

    self.updateResponse = function (assessmentResponse) {
        $.ajax({
            url: baseUrl + '/api/Assessment/Post',
            type: "POST",
            data: assessmentResponse,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (response) {
            },
            error: function (response, errorText) {
                return false;
            }
        });
    }
    return self;
}
function questionModule(_id, _name, _scoringLegend) {
    var self = this;
    self.id = ko.observable(_id);
    self.name = ko.observable(_name);
    self.scoringLegend = ko.observable(_scoringLegend);

    return self;
}

function pageViewModel (userId, moduleId, onlyDeficient) {
    var self = this;
    self.onlyDeficient = onlyDeficient;
    self.displayModuleMessage = ko.observable(self.onlyDeficient);
    self.moduleMessage = ko.observable('');
    self.userId = userId;
    self.modules = ko.observableArray([]);
    self.totalQuestionCount = ko.observable();

    self.questionsDisplayCount = 10;
    self.questionsDisplayStartIndex = ko.observable(0);
    self.questionsDisplayEndIndex = ko.observable(self.questionsDisplayCount);
    self.questionsCollection = ko.observableArray([]);
    self.completeCount = ko.computed(function () {
        var count = 0;
        ko.utils.arrayForEach(self.questionsCollection(), function (answer) {
            if (answer.response())
                count++;
        });
        return count;
    }, self);
    self.completeCountLabel = ko.computed(function () {
        return 'Complete ' + self.completeCount() + ' / ' + self.totalQuestionCount();
    }, self);
    self.selectedQuestionModule = ko.computed(function () {
        var module;
        $.each(self.modules(), function (i, item) {
            if (item.id() == moduleId) {
                module = item;
                return;
            }
        });
        return module;
    }, self);
    self.questions = ko.computed(function () {
        return self.questionsCollection.slice(self.questionsDisplayStartIndex(), self.questionsDisplayEndIndex());
    }, self);

    self.nextClick = function () {
        self.questionsDisplayStartIndex(self.questionsDisplayStartIndex() + self.questionsDisplayCount);
        self.questionsDisplayEndIndex(self.questionsDisplayEndIndex() + self.questionsDisplayCount);
    };

    self.nextVisible = ko.computed(function () {
        return (self.questionsDisplayEndIndex() <= self.totalQuestionCount());
    }, self);

    self.previousClick = function () {
        self.questionsDisplayStartIndex(self.questionsDisplayStartIndex() - self.questionsDisplayCount);
        self.questionsDisplayEndIndex(self.questionsDisplayEndIndex() - self.questionsDisplayCount);
    };

    self.previousVisible = ko.computed(function () {
        return (self.questionsDisplayStartIndex() > 0 && self.questionsDisplayStartIndex() <= self.totalQuestionCount());
    }, self);

    //self.selectedModule = ko.computed(function () { return self.modules[0]; }, self);

    self.initialize = function () {
        self.loadModules();
        self.loadQuestions();
    }

    self.loadModules = function () {

        showProgress("Getting Module details...Please wait.");
        $.ajax({
            url: baseUrl + '/api/QuestionModule/Get',
            type: 'GET',
            contentType: 'application/json',
            async: false,
            dataType: 'json',
            success: function (data) {
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        //log(item)
                        self.modules.push(new questionModule(item.Id, item.Name, item.ScoringLegend));
                    });
                    hideProgress();
                }
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    }
    self.loadQuestions = function () {
        //log(self.selectedQuestionModule());
        showProgress("Getting Questions...Please wait.");
        var url = baseUrl + '/api/Assessment/';
        //log(self.onlyDeficient);
        if (self.onlyDeficient == 'true') {
            url = url + 'GetDeficients';
            self.moduleMessage('The system has identified the following areas of weakness based upon your responses.');
        }
        else
            url = url + 'Get';

        $.ajax({
            url: url,
            type: 'GET',
            contentType: 'application/json',
            data: { moduleId: self.selectedQuestionModule().id(), userId: userId },
            dataType: 'json',
            success: function (data) {
                self.totalQuestionCount(data.length);
                //log(data);
                if (data.length > 0) {
                    $.each(data, function (i, item) {
                        self.questionsCollection.push(new assessmentResponse(item.QuestionId, item.Question, item.QuestionTooltip, item.SerialNumber, item.Response, item.ResponseId, userId, item.Recommendation));
                    });
                }
                hideProgress();
            },
            error: function (xhr, status, somthing) {
                log(status);
            }
        });
    };

    self.visibleNormalAssessment = ko.computed(function () {
        var showNormal = (self.onlyDeficient == 'true') ? false : true;
        console.log(self.onlyDeficient);
        return showNormal;
    }, self);

    self.visibleDeficientAssessment = ko.computed(function () {
        return (self.visibleNormalAssessment()) ? false : true;
    }, self);

    return self;
}

function ng_assessmentIndexCtrl($scope, $http) {

            angular.element(document).ready(function () {
                
                //alert("1");
                var vm = pageViewModel($('#userId').val(), $('#moduleId').val(), $('#onlyDeficient').val());
                //alert("2");

                vm.initialize();

                //alert("3");
                ko.applyBindings(vm, $('#workspaceContainer')[0]);

                //alert("4");
                $('#workspaceContainer').tooltip({
                    position: {
                        my: "center top",
                        //at: "center top",
                        using: function (position, feedback) {
                            $(this).css(position);
                            $("<div>")
                              .addClass("arrow")
                              .addClass(feedback.vertical)
                              .addClass(feedback.horizontal)
                              .appendTo(this);
                        }
                    }
                });

                //alert("5");

                loadScorecard = function () {
                    $('#workspaceContainer').children().remove();
                    var path = baseUrl + "/Scorecard/Home/index";
                    $.get(path, function (data) {
                        $('#workspaceContainer').html(data);
                    });
                }




            });

        };

//console.log('I was run.');
