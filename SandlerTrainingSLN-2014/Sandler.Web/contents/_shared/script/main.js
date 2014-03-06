/*  //////////////////////////////////////////
     (Default Home Page) 
    \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\JB\\\ */


/* ///// [[[ (func)menuOpen - Action for Menu Clicked ]]]  /////////////////////////*/
function menuOpen(windowMode, url, hostDiv, headerTitle) {

    // Track "Menu ClicK" and "Page View" ga('send', 'pageview', { page: url, 'title': headerTitle }); //
    //ga('send', 'event', window.location.host, 'Click(Menu)', headerTitle, appData_.Id_i, { page: url });

    /* windowMode
        (n)ew Browser Window
        (p)anel window
        (i)Frame in panel window
        (m)odal Window
      mo(d)al Window w/ iFrame
    */
    //alert(windowMode);
    //alert(url);

    if (windowMode == 'n') {
        window.open(url);
    }
    else if (windowMode == 'm') 
        showModal_.html(url, null, '97%');
    else if (windowMode == 'i' || windowMode == 'd') {  /* (i)Frame in panel window or Mo(d)al window */

        if (windowMode == 'd') {
            showModal_.iframe(url);
        }
        else {
            var iframeATTR = {
                id: 'iframePanel',
                src: url,
                frameborder: '0',
                scrolling: 'no',
                allowTransparency: 'true',
                width: '100%',
                height: '860'   /* 860 or 100% : This is perfect for IE 9 but shows scroll bar for Chrome and FF. FF and IE needs height in digits. Chrome is ok with 100% */
            };

            var iframeHtml = $('<iframe>').attr(iframeATTR)

            var contentSelector = '#' + hostDiv;
            $(contentSelector).css('height', '100%');
            $(contentSelector).html(iframeHtml);
        }
    }
    else {  /* (p)anel window */
        /*Content Page will be handled by RouteProvider*/
        //aRenderer.openPage(url, hostDiv);
    }
};

/* ///// [[[ (ViewModel) Menu Item ]]]  ////////////////////////////////////////////*/
function menuItem_viewModel(data, parent) {

    var self = this;
    self.parent = parent;

    self.pageMenuId = data.pageMenuId;
    self.name = data.name;
    self.caption = data.shortCaption;
    self.longCaption = data.longCaption;
    self.isNewWindow = data.isNewWindow;
    self.isModal = data.isModal;
    self.inIFRAME = data.inIFRAME;
    self.pagePath = data.pagePath;

    self.active = function () {
        return (self.pageMenuId == self.parent.parent.activeMenuId);
    };

    self.pagePathC = function () {
        return (!self.isNewWindow && !self.isModal && !self.inIFRAME ? '#' + self.pagePath : '');
    };

    // (Class) whether "active" //
    self.liClass = function () {
        return (self.active() ? "active" : "");
    };

    self.makeActive = function () {
        self.parent.parent.activeMenuGroupIndex = self.parent.index;
        self.parent.parent.activeMenuId = self.pageMenuId;
        self.parent.parent.activeViewUrl = self.pagePath;
    };

    self.clicked = function () {
        if (!self.isNewWindow && !self.isModal && !self.inIFRAME) {
            self.makeActive();
        }
        var windowMode = (self.isNewWindow ? 'n'
                    : (self.isModal ? (self.inIFRAME ? 'd' : 'm')
                    : (self.inIFRAME ? 'i' : 'p')));

        menuOpen(windowMode, self.pagePath, 'content', self.name);
    };

};

/* ///// [[[ (ViewModel) Menu Group ]]]  ///////////////////////////////////////////*/
function menuGroup_viewModel(data, parent) {

    var self = this;
    self.parent = parent;

    self.pageMenuGroupId = data.pageMenuGroupId
    self.caption = data.caption;
    self.iconClass = data.iconClass;
    self.index = self.parent.menuGroups.length;
    
    self.menuItems = [];
    angular.forEach(data.pageMenus, function (data) {
        this.push(new menuItem_viewModel(data, self));
    }, self.menuItems);

    self.menuCount = function () {
        return self.menuItems.length;
    };

    self.itselfMenu = function () {
        return (self.menuCount() == 1);
    }

    self.active = function () {
        return (self.index == self.parent.activeMenuGroupIndex);
    }

    self.liClass = function () {
        var _class = (self.itselfMenu() ? "" : "submenu");

        if (self.active())
            _class = _class + (_class != "" ? " " : "") + "active";
        if (self.menuCount() > 1 && self.active())
            _class = _class + (_class != "" ? " " : "") + "open";

        return _class;
    };

    self.clicked = function () {
        if (self.itselfMenu()) {
            self.menuItems[0].clicked();
        }
    };

    self.pagePathC = function () {
        return (self.itselfMenu() ? self.menuItems[0].pagePathC() : '');
    };

};

/* ///// [[[ (ViewModel) Menu Definition ]]]  //////////////////////////////////////*/
function menuDef_viewModel(data) {
    var self = this;

    self.menuGroups = [];
    self.activeMenuGroupIndex = 0;   // Initially, First MenuGroup
    self.activeMenuId = null;
    self.activeViewUrl = '';

    angular.forEach(data.results, function (data) {
        this.push(new menuGroup_viewModel(data, self));
    }, self.menuGroups);

};

/* ///// [[[ (Angular Controller) ngAppMainController ]]]  ////////////*/
app_.controller('ngAppMainController', ['$scope', '$http', '$compile', '$routeParams', '$location',
        function ($scope, $http, $compile, $routeParams, $location) {

            $scope.currentHost = '';
            $scope.UserId_i = 0;           
			//console.log('loading menu from ' + baseUrl + '/module/menu');
            $http.get(baseUrl + '/module/menu').success(function (data) {
                $scope.menuDef = new menuDef_viewModel(data, $compile, $scope);

                /* Default Page */
                var locPath = $location.path()
                if (locPath == "" || locPath == "/") {
                    $scope.menuDef.menuGroups[0].menuItems[0].clicked();
                    $location.path($scope.menuDef.menuGroups[0].menuItems[0].pagePath);
                }
                else
                    /* Highlight a menu of Selected Content Page*/
                    angular.forEach($scope.menuDef.menuGroups, function (data) {
                        angular.forEach(data.menuItems, function (data) {
                            if (data.pagePath == $location.path())
                                data.clicked();
                        });
                    });

            });
            
        }]);

/* ///// [[[ (Angular Controlle) Content Page Route - Type A ]]]  //////////////////////////////////////*/
function contPageRouteCtrl_a($scope, $routeParams) {
    $scope.templateUrl = $routeParams.area + '/' + $routeParams.controller + '/' + $routeParams.action;
}

/* ///// [[[ (Angular Controlle) Content Page Route - Type B ]]]  //////////////////////////////////////*/
function contPageRouteCtrl_b($scope, $routeParams) {
    $scope.templateUrl = $routeParams.controller + '/' + $routeParams.action;
}

/* ///// [[[ (Angular Controlle) Content Page Route - Type C ]]]  //////////////////////////////////////*/
function contPageRouteCtrl_c($scope, $routeParams) {
    $scope.templateUrl = $routeParams.action;
}

/* ///// [[[ (Angular Route) ]]]  //////////////////////////////////////////////////////////////////////*/
app_
    .config(['$routeProvider', function ($routeProvider) {
        $routeProvider
            .when('/:area/:controller/:action', {
                template: '<div ng-include="templateUrl">Loading...</div>',
                controller: contPageRouteCtrl_a
            })
            .when('/:controller/:action', {
                template: '<div ng-include="templateUrl">Loading...</div>',
                controller: contPageRouteCtrl_b
            })
            .when('/:action', {
                template: '<div ng-include="templateUrl">Loading...</div>',
                controller: contPageRouteCtrl_c
            })
            .otherwise({ redirectTo: '/' });
    }]);
    
/* Custom Directive Trial (eg.       <div ng-load-script></div> )
app_
    .directive('ngLoadScript', [function () {
        return function (scope, element, attrs) {
            angular.element('<script src="/contents/_shared/script/crm/ng-taskSelectCtrl.js" type="text/javascript"></script>').appendTo(element);
            console.log('loaded');
        }
    }]);
*/
