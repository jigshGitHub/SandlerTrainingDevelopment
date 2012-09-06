/*
* UpdatePanel plug-in v1.0.0
* Copyright (c) 2009 James Westgate
* Dual licensed under the MIT and GPL licenses.
*/

//Create closure
(function($) {

    var prm = null;

    //Plugin definition
    $.fn.extend({

        panelUpdated: function(fn) {

            //Get a reference to the page request manager
            if (prm == null) prm = Sys.WebForms.PageRequestManager.getInstance();
            var selector = $(this);

            //Add an anonymous function to the page request manager to handle page load event
            prm.add_pageLoaded(function(sender, args) {

                raiseEvents(args.get_panelsUpdated(), selector, fn);
            });

            //Return matched set iterator
            return this.each(function() { });
        },

        panelCreated: function(fn) {

            //Get a reference to the page request manager
            if (prm == null) prm = Sys.WebForms.PageRequestManager.getInstance();
            var selector = $(this);

            //Add an anonymous function to the page request manager to handle page load event
            prm.add_pageLoaded(function(sender, args) {

                raiseEvents(args.get_panelsCreated(), selector, fn);
            });

            //Return matched set iterator
            return this.each(function() { });
        },

        panelReady: function(fn) {

            //Get a reference to the page request manager
            if (prm == null) prm = Sys.WebForms.PageRequestManager.getInstance();
            var selector = $(this);

            //Add an anonymous function to the page request manager to handle page load event
            prm.add_pageLoaded(function(sender, args) {

                raiseEvents(args.get_panelsUpdated(), selector, fn);
            });

            //Return matched set iterator, calling the user function
            return this.each(function() {
                fn(this);
            });
        },

        beginRequest: function(fn) {

            //Get a reference to the page request manager
            if (prm == null) prm = Sys.WebForms.PageRequestManager.getInstance();
            var selector = $(this);

            prm.add_beginRequest(function(sender, args) {

                //Loop through and check if the postbackelement is inside the element
                var options = {prm: prm };
                raiseRequestEvents($(args.get_postBackElement()), selector, fn, options);
            });

            //Return matched set iterator
            return this.each(function() { });
        },

        initializeRequest: function(fn) {

            //Get a reference to the page request manager
            if (prm == null) prm = Sys.WebForms.PageRequestManager.getInstance();
            var selector = $(this);

            prm.add_initializeRequest(function(sender, args) {

                //Loop through and check if the postbackelement is inside the element
                var options = {prm: prm, cancel: false };

                raiseRequestEvents($(args.get_postBackElement()), selector, fn, options);

                //Cancel post back if required
                if (options.cancel) args.set_cancel(true);
            });

            //Return matched set iterator
            return this.each(function() { });
        }
    });

    //Compares the selector and the panels provided and calls the function when they match
    function raiseEvents(panels, selector, fn) {

        //Match panels to the selector
        for (var i = 0; i < panels.length; i++) {

            //Check the selectors and callback the function if matching
            selector.each(function() {
                if (this.id == panels[i].id) fn(this);
            });
        }
    }

    //Compares the parent hierarchy of the element initiating the postback to the selector and calls back
    function raiseRequestEvents(element, selector, fn, options) {

        //Loop through parents and check for panel
        element.parents('div').each(function() {

            var parent = this;

            //Loop through the selector
            selector.each(function() {

                if (this.id == parent.id) {
                    options.postBackElement = element;
                    fn(options);
                    return;
                };
            });
        });
    }

    // end of closure
})(jQuery);
