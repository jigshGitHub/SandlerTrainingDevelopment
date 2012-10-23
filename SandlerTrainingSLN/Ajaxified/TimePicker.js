Type.registerNamespace("Ajaxified");

Ajaxified.TimePicker = function(element) {
    Ajaxified.TimePicker.initializeBase(this, [element]);
    this._btnPopUp = null;
    this._curtain = null;
    this._timePicker = null;
    this._table = null;
    this._headerTable = null;
    this._amButton = null;
    this._pmButton = null;
    this._closeButton = null;
    this._content = null;
    this._cssClass = null;
    this._headerCssClass = null;
    this._titleCssClass = null;
    this._tabCssClass = null;
    this._selectedTabCssClass = null;
    this._itemCssClass = null;
    this._selectedItemCssClass = null;
    this._closeOnSelection = null;
    this._selectedTime = null;
    this._selectedCell = null;
    this._timeCells = null;
    this._minuteStep = null;
    this._btnPopUp_mousedownHandler = null;
    this._btnClose_mousedownHandler = null;
    this._amButton_mousedownHandler = null;
    this._pmButton_mousedownHandler = null;
    this._timeButton_mousedownHandler = null;
}

Ajaxified.TimePicker.prototype = {
    timePicker_Css_Class: "_ajaxified_timepicker",
    header_Css_Class: "_ajaxified_timepicker_header",
    closeButton_Css_Class: "_ajaxified_timepicker_closeButton",
    title_Css_Class: "_ajaxified_timepicker_title",

    //constructor
    initialize: function () {
        Ajaxified.TimePicker.callBaseMethod(this, 'initialize');
        this._timeCells = new Array();
        this._createDelegates();
        $addHandlers(this.get_element(), { "blur": this._element_blurHandler }, this);
        this._addCurtain();
        this._appendPopupButton();
        this._addTimePicker();
    },

    //dispose method
    dispose: function () {
        this._removePopupButton();
        this._removeCurtain();
        this._removeTimePicker();
        Ajaxified.TimePicker.callBaseMethod(this, 'dispose');
        this._btnPopUp = null;
        this._curtain = null;
        this._timeCells = null;
        this._minuteStep = null;
        this._timePicker = null;
        this._table = null;
        this._headerTable = null;
        this._amButton = null;
        this._pmButton = null;
        this._closeButton = null;
        this._content = null;
        this._selectedCell = null;
    },

    get_CssClass: function () {
        return this._cssClass;
    },

    set_CssClass: function (val) {
        if (this._cssClass !== val) {
            this._cssClass = val;
            this.raisePropertyChanged('CssClass');
        }
    },

    get_HeaderCssClass: function () {
        return this._headerCssClass;
    },

    set_HeaderCssClass: function (val) {
        if (this._headerCssClass !== val) {
            this._headerCssClass = val;
            this.raisePropertyChanged('HeaderCssClass');
        }
    },

    get_TitleCssClass: function () {
        return this._titleCssClass;
    },

    set_TitleCssClass: function (val) {
        if (this._titleCssClass !== val) {
            this._titleCssClass = val;
            this.raisePropertyChanged('TitleCssClass');
        }
    },

    get_TabCssClass: function () {
        return this._tabCssClass;
    },

    set_TabCssClass: function (val) {
        if (this._tabCssClass !== val) {
            this._tabCssClass = val;
            this.raisePropertyChanged('TabCssClass');
        }
    },

    get_SelectedTabCssClass: function () {
        return this._selectedTabCssClass;
    },

    set_SelectedTabCssClass: function (val) {
        if (this._selectedTabCssClass !== val) {
            this._selectedTabCssClass = val;
            this.raisePropertyChanged('SelectedTabCssClass');
        }
    },

    get_ItemCssClass: function () {
        return this._itemCssClass;
    },

    set_ItemCssClass: function (val) {
        if (this._itemCssClass !== val) {
            this._itemCssClass = val;
            this.raisePropertyChanged('ItemCssClass');
        }
    },

    get_SelectedItemCssClass: function () {
        return this._selectedItemCssClass;
    },

    set_SelectedItemCssClass: function (val) {
        if (this._selectedItemCssClass !== val) {
            this._selectedItemCssClass = val;
            this.raisePropertyChanged('SelectedItemCssClass');
        }
    },

    get_CloseOnSelection: function () {
        return this._closeOnSelection;
    },

    set_CloseOnSelection: function (val) {
        if (this._closeOnSelection !== val) {
            this._closeOnSelection = val;
            this.raisePropertyChanged('CloseOnSelection');
        }
    },

    get_MinuteStep: function () {
        return this._minuteStep;
    },

    set_MinuteStep: function (val) {
        if (this._minuteStep !== val) {
            this._minuteStep = val;
            this.raisePropertyChanged('MinuteStep');
        }
    },

    _createDelegates: function () {
        this._element_blurHandler = Function.createDelegate(this, this._element_onblur);
        this._btnPopUp_mousedownHandler = Function.createDelegate(this, this._btnPopUp_onmousedown);
        this._btnClose_mousedownHandler = Function.createDelegate(this, this._btnClose_onmousedown);
        this._amButton_mousedownHandler = Function.createDelegate(this, this._amButton_onmousedown);
        this._pmButton_mousedownHandler = Function.createDelegate(this, this._pmButton_onmousedown);
        this._timeButton_mousedownHandler = Function.createDelegate(this, this._timeButton_onmousedown);
    },

    _appendPopupButton: function () {
        this._btnPopUp = NewElement("img", { 'src': '<%= WebResource("Ajaxified.images.timepicker_off.gif")%>' });
        document.forms[0].appendChild(this._btnPopUp);
        var textbox = this.get_element();
        var textbox_location = Sys.UI.DomElement.getLocation(textbox);
        //alert(textbox.offsetHeight);
        Sys.UI.DomElement.setLocation(this._btnPopUp, textbox_location.x + textbox.offsetWidth + 5, textbox_location.y + ((textbox.offsetHeight + 5 - 20) / 2));
        $addHandler(this._btnPopUp, "mousedown", this._btnPopUp_mousedownHandler);
    },

    _removePopupButton: function () {
        document.forms[0].removeChild(this._btnPopUp);
    },

    _closePopupButton: function () {
        this._btnPopUp.src = '<%= WebResource("Ajaxified.images.timepicker_off.gif")%>';
    },

    _addCurtain: function () {
        this._curtain = NewElement("div", { 'id': '_ajaxified_timepicker_curtain' });
        document.forms[0].appendChild(this._curtain);
    },

    _removeCurtain: function () {
        document.forms[0].removeChild(this._curtain);
    },

    _showCurtain: function () {
        this._curtain.style.visibility = "visible";
    },

    _hideCurtain: function () {
        this._curtain.style.visibility = "hidden";
    },

    _addTimePicker: function () {
        menu_Css_Class = "_ajaxified_timepicker_basictab";
        this._timePicker = NewElement("div");
        document.forms[0].appendChild(this._timePicker);
        Sys.UI.DomElement.addCssClass(this._timePicker, this.timePicker_Css_Class);
        Sys.UI.DomElement.addCssClass(this._timePicker, this.get_CssClass());

        this._table = NewElement("table");
        this._table.cellpadding = 0;
        this._table.cellspacing = 0;
        this._table.style['border-collapse'] = 'collapse';
        this._table.style['border-spacing'] = 0;

        headerRow = this._table.insertRow(-1);
        headerRowCell = headerRow.insertCell(0);

        this._headerTable = NewElement("table", { 'cellpadding': 0, 'cellspacing': 0 });
        headerTableRow = this._headerTable.insertRow(-1);
        headerTableRow.valign = 'middle';
        Sys.UI.DomElement.addCssClass(this._headerTable, this.header_Css_Class);
        Sys.UI.DomElement.addCssClass(this._headerTable, this.get_HeaderCssClass());

        titleCell = headerTableRow.insertCell(0);
        titleCell.width = "80px";
        //Make it Bold - BRT Change
        title = NewElement('span', { 'innerHTML': '<b>Select Time</b>' });
        Sys.UI.DomElement.addCssClass(title, this.title_Css_Class);
        Sys.UI.DomElement.addCssClass(title, this.get_TitleCssClass());
        titleCell.appendChild(title);

        listCell = headerTableRow.insertCell(1);

        this._amButton = NewElement('span', { 'innerHTML': 'A.M' });
        $addHandler(this._amButton, "mousedown", this._amButton_mousedownHandler);
        Sys.UI.DomElement.addCssClass(this._amButton, this.get_TabCssClass());


        this._pmButton = NewElement('span', { 'innerHTML': 'P.M' });
        $addHandler(this._pmButton, "mousedown", this._pmButton_mousedownHandler);
        Sys.UI.DomElement.addCssClass(this._pmButton, this.get_TabCssClass());

        menu = NewElement("ul");
        amMenuItem = NewElement("li");
        pmMenuItem = NewElement("li");
        amMenuItem.appendChild(this._amButton);
        pmMenuItem.appendChild(this._pmButton);
        menu.appendChild(amMenuItem);
        menu.appendChild(pmMenuItem);
        listCell.appendChild(menu);
        Sys.UI.DomElement.addCssClass(listCell, menu_Css_Class);

        buttonCell = headerTableRow.insertCell(2);
        this._closeButton = NewElement('img', { 'alt': 'close', 'src': '<%= WebResource("Ajaxified.images.close.gif")%>' });
        Sys.UI.DomElement.addCssClass(this._closeButton, this.closeButton_Css_Class);
        $addHandler(this._closeButton, "mousedown", this._btnClose_mousedownHandler);
        buttonCell.appendChild(this._closeButton);

        headerRowCell.appendChild(this._headerTable);


        contentRow = this._table.insertRow(-1);
        this._content = NewElement("div");
        contentCell = contentRow.insertCell(0);
        contentCell.appendChild(this._content);

        this._timePicker.appendChild(this._table);
    },

    _removeTimePicker: function () {
        document.forms[0].removeChild(this._timePicker);
    },

    _showTimePicker: function () {
        this._timePicker.style.visibility = "visible";
    },

    _hideTimePicker: function () {
        this._timePicker.style.visibility = "hidden";
    },

    _selectTab: function (mode) {
        if (mode == 0) {
            this._amButton.className = this.get_SelectedTabCssClass();
            this._pmButton.className = this.get_TabCssClass();
        }
        else {
            this._pmButton.className = this.get_SelectedTabCssClass();
            this._amButton.className = this.get_TabCssClass();
        }
    },

    _ensureTimePicker: function (mode, tm) {
        var textbox = this.get_element();
        if (tm === undefined) {
            if (mode == 0) {
                suffix = "am";
            }
            else {
                suffix = "pm";
            }
        } else {
            tm = this._nearestTime(tm);
            suffix = tm.split(" ")[1];
            if (suffix == "am")
                mode = 0;
            else
                mode = 1;
        }

        this._selectTab(mode);

        timeTable = NewElement("table");
        timeTable.cellpadding = 2;
        timeTable.cellspacing = 0;

        for (i = 0; i < 12; i++) {
            timeRow = timeTable.insertRow(-1);
            timeRow.align = 'right';

            if (i == 0) {
                hr = 12;
            }
            else {
                hr = i;
            }

            steps = 60 / this.get_MinuteStep();

            for (j = 0; j < steps; j++) {
                var thisTime = hr + ":" + this._padZero(j * this.get_MinuteStep()) + " " + suffix;

                timeCell = timeRow.insertCell(j);
                cellContent = NewElement("div");
                cellContent.style.cursor = "pointer";

                classSelector = this.get_ItemCssClass();
                if (thisTime == tm) { classSelector = this.get_SelectedItemCssClass(); this._selectedTime = tm; this._selectedCell = cellContent; }
                Sys.UI.DomElement.addCssClass(cellContent, classSelector);

                cellContent.extenderObject = this;
                $addHandler(cellContent, "mousedown", this._timeButton_onmousedown);
                cellContent.innerHTML = hr + ":" + this._padZero(j * this.get_MinuteStep()) + "&nbsp;" + "<font color=\"#808080\">" + suffix + "</font>";
                timeCell.appendChild(cellContent);
                this._timeCells.push(cellContent);
            }
        }
        if (this._content.hasChildNodes()) {
            this._content.removeChild(this._content.childNodes[0]);
        }
        this._content.appendChild(timeTable);
    },

    _nearestTime: function (n) {
        var t = new Object();
        t.value = n;
        this._validateDatePicker2(t);
        var arr = t.value.split(":");
        var a2 = arr[1].split(" ");
        var mn = parseInt(a2[0], 10);
        var ampm = a2[1];
        // get nearest minute boundary, within Minute Steps mins.
        var nMin = parseInt((mn + parseInt(this.get_MinuteStep() / 2, 10)) / this.get_MinuteStep(), 10) * this.get_MinuteStep();
        return arr[0] + ":" + this._padZero(nMin) + " " + ampm;
    },

    _validateDatePicker2: function (ctl) {
        t = ctl.value.toLowerCase();
        t = t.replace(" ", "");
        t = t.replace(".", ":");
        t = t.replace("-", "");

        if ((this._isNumeric(t)) && (t.length == 4)) {
            t = t.charAt(0) + t.charAt(1) + ":" + t.charAt(2) + t.charAt(3);
        }

        var t = new String(t);
        tl = t.length;

        if (tl == 1) {
            if (this._isDigit(t)) {
                if (t == "0")
                    ctl.value = "12:00 am";
                else
                    ctl.value = t + ":00" + this._amOrPm(t);
            }
            else {
                return false;
            }
        }
        else if (tl == 2) {
            if (this._isNumeric(t)) {
                if (parseInt(t, 10) < 13) {
                    if (t.charAt(1) != ":") {
                        ctl.value = t + ':00' + this._amOrPm(t);
                    }
                    else {
                        if (t.charAt(0) == "0")
                            ctl.value = "12:00 am";
                        else
                            ctl.value = t + '00' + this._amOrPm(t);
                    }
                }
                else if (parseInt(t, 10) == 24) {
                    ctl.value = "12:00 am";
                }
                else if (parseInt(t, 10) < 24) {
                    if (t.charAt(1) != ":") {
                        ctl.value = (t - 12) + ':00 pm';
                    }
                    else {
                        ctl.value = (t - 12) + '00 pm';
                    }
                }
                else if (parseInt(t, 10) <= 60) {
                    ctl.value = '0:' + this._padZero(t) + ' am';
                }
                else {
                    ctl.value = '1:' + this._padZero(t % 60) + ' am';
                }
            }
            else {
                if ((t.charAt(0) == ":") && (this._isDigit(t.charAt(1)))) {
                    ctl.value = "0:" + this._padZero(parseInt(t.charAt(1), 10)) + " am";
                }
                else {
                    return false;
                }
            }
        }
        else if (tl >= 3) {
            // 3-digit time modification by MV, 5/2007
            if ((tl == 3) && (!this._isNumeric(t))) return false;
            if ((tl == 3) && (this._isNumeric(t))) {
                // time is in format, say 330, for 330 am or pm
                var tHour = t.charAt(0);
                var tMin = t.charAt(1) + t.charAt(2);
                hr = parseInt(tHour, 10);
                mn = parseInt(tMin, 10);
                if (isNaN(mn)) mn = 0; // e.g. if "7qq" is entered, this becomes 7:00pm
                if ((mn < 0) || (mn > 59))
                    return false;
                if (hr == 0) {
                    hr = 12;
                    mode = "am";
                } else
                    mode = this._amOrPm(tHour);

                ctl.value = hr + ":" + this._padZero(mn) + " " + mode;
                return true;
            }

            // now tl>3
            var arr = t.split(":");
            if (t.indexOf(":") > 0) {
                hr = parseInt(arr[0], 10);
                mn = parseInt(arr[1], 10);

                if (t.indexOf("pm") > 0)
                    mode = "pm";
                else if (t.indexOf("am") > 0)
                    mode = "am";
                else
                    mode = this._amOrPm(hr);

                if (isNaN(hr)) {
                    return false;
                    hr = 0;
                } else {
                    if (hr > 24) {
                        return false;
                    }
                    else if (hr == 24) {
                        mode = "am";
                        hr = 0;
                    }
                    else if (hr > 12) {
                        mode = "pm";
                        hr -= 12;
                    }
                }

                if (isNaN(mn)) {
                    mn = 0;
                }
                else {
                    if (mn > 60) {
                        mn = mn % 60;
                        hr += 1;
                    }
                }
            } else {

                hr = parseInt(arr[0], 10);

                if (isNaN(hr)) {
                    return false;
                    // hr=0;
                } else {
                    if (hr > 24) {
                        return false;
                    }
                    else if (hr == 24) {
                        mode = "am";
                        hr = 0;
                    }
                    else if (hr > 12) {
                        mode = "pm";
                        hr -= 12;
                    }
                }

                mn = 0;
            }

            if (hr == 24) {
                hr = 0;
                mode = "am";
            }
            ctl.value = hr + ":" + this._padZero(mn) + " " + mode;
        }
        return true;
    },

    _isDigit: function (c) {
        return ((c == '0') || (c == '1') || (c == '2') || (c == '3') || (c == '4') || (c == '5') || (c == '6') || (c == '7') || (c == '8') || (c == '9'))
    },

    _isNumeric: function (n) {
        num = parseInt(n, 10);
        return !isNaN(num);
    },

    _padZero: function (n) {
        v = "";
        if (n < 10) {
            return ('0' + n);
        }
        else {
            return n;
        }
    },

    _amOrPm: function (hr) {
        if ((parseInt(hr, 10) >= 9) && (parseInt(hr) <= 11))
            return "am"
        else
            return "pm"
    },

    _isValidTime: function (val) {
        if (!this._isFormatedTime(val))
            return false;
        return true;

    },

    _isFormatedTime: function (val) {
        if (val.trim() == '') return true;
        var bo = true;
        bo = val.trim().match(new RegExp('^(1[0-2]|0?[1-9]):([0-5]?[0-9]) (AM|PM|am|pm)$'));
        return bo;
    },


    _openPopup: function () {
        var eventArgs = new Sys.CancelEventArgs();
        this.raiseShowing(eventArgs);
        if (eventArgs.get_cancel()) {
            return;
        }
        this._btnPopUp.src = '<%= WebResource("Ajaxified.images.timepicker_on.gif")%>';
        this._showCurtain();

        if (this.get_element().value != "") {
            var res = this._validateDatePicker2(this.get_element());
            if (res)
                this._ensureTimePicker(0, this.get_element().value);
            else
                this._ensureTimePicker(0);
        }
        else {
            this._ensureTimePicker(0);
        }

        this._showTimePicker();
        this._ensureLocation();
        this.raiseShown();
    },

    _closePopup: function () {
        var eventArgs = new Sys.CancelEventArgs();
        this.raiseHiding(eventArgs);
        if (eventArgs.get_cancel()) {
            return;
        }
        this._btnPopUp.src = '<%= WebResource("Ajaxified.images.timepicker_off.gif")%>';
        this._hideCurtain();
        this._hideTimePicker();
        this.raiseHidden();
    },

    _ensureLocation: function () {
        var textbox = this.get_element();
        var textbox_location = Sys.UI.DomElement.getLocation(textbox);
        Sys.UI.DomElement.setLocation(this._timePicker, textbox_location.x + textbox.offsetWidth + 5, textbox_location.y + textbox.offsetHeight + 3);
    },

    _setTime: function (e) {
        if (document.all) {
            val = e.target.parentNode.innerText;
        } else {
            val = e.target.parentNode.textContent;
        }

        if (e.target.tagName.toLowerCase() == "font") {
            this._selectedCell = e.target.parentNode;
        }
        else {
            this._selectedCell = e.target;
        }

        for (i = 0; i < this._timeCells.length; i++) {
            this._timeCells[i].className = this.get_ItemCssClass();
        }

        this._selectedTime = val;
        this._selectedCell.className = this.get_SelectedItemCssClass();

        this.get_element().value = val;
        this.raiseSelectionChanged();
        if (this.get_CloseOnSelection())
            this._closePopup();
    },

    _showError: function () {
        if (!this._isValidTime(this.get_element().value)) {
            this.get_element().val = '';
            this.get_element().title = 'Invalid time format';
            Sys.UI.DomElement.addCssClass(this.get_element(), '_ajaxified_timepicker_selected_error');
        }
        else {
            Sys.UI.DomElement.removeCssClass(this.get_element(), '_ajaxified_timepicker_selected_error');
        }
    },

    // Event Handlers

    _element_onblur: function (e) {
        this._showError();
    },

    _btnPopUp_onmousedown: function (e) {
        this._openPopup();
        e.preventDefault();
        e.stopPropagation();
    },

    _btnClose_onmousedown: function (e) {
        this._closePopup();
        e.preventDefault();
        e.stopPropagation();
    },

    _amButton_onmousedown: function (e) {
        this._ensureTimePicker(0);
        e.preventDefault();
        e.stopPropagation();
    },

    _pmButton_onmousedown: function (e) {
        this._ensureTimePicker(1);
        e.preventDefault();
        e.stopPropagation();
    },

    _timeButton_onmousedown: function (e) {
        this.extenderObject._setTime(e);
        e.preventDefault();
        e.stopPropagation();
    },

    add_showing: function (handler) {
        this.get_events().addHandler("showing", handler);
    },
    remove_showing: function (handler) {
        this.get_events().removeHandler("showing", handler);
    },
    raiseShowing: function (eventArgs) {
        var handler = this.get_events().getHandler('showing');
        if (handler) {
            handler(this, eventArgs);
        }
    },

    add_shown: function (handler) {
        this.get_events().addHandler("shown", handler);
    },
    remove_shown: function (handler) {
        this.get_events().removeHandler("shown", handler);
    },
    raiseShown: function () {
        var handlers = this.get_events().getHandler("shown");
        if (handlers) {
            handlers(this, Sys.EventArgs.Empty);
        }
    },

    add_hiding: function (handler) {
        this.get_events().addHandler("hiding", handler);
    },
    remove_hiding: function (handler) {
        this.get_events().removeHandler("hiding", handler);
    },
    raiseHiding: function (eventArgs) {
        var handler = this.get_events().getHandler('hiding');
        if (handler) {
            handler(this, eventArgs);
        }
    },

    add_hidden: function (handler) {
        this.get_events().addHandler("hidden", handler);
    },
    remove_hidden: function (handler) {
        this.get_events().removeHandler("hidden", handler);
    },
    raiseHidden: function () {
        var handlers = this.get_events().getHandler("hidden");
        if (handlers) {
            handlers(this, Sys.EventArgs.Empty);
        }
    },

    add_selectionChanged: function (handler) {
        this.get_events().addHandler("selectionChanged", handler);
    },
    remove_selectionChanged: function (handler) {
        this.get_events().removeHandler("selectionChanged", handler);
    },
    raiseSelectionChanged: function () {
        var handler = this.get_events().getHandler('selectionChanged');
        if (handler) {
            handler(this, Sys.EventArgs.Empty);
        }
    }
}


Ajaxified.TimePicker.registerClass('Ajaxified.TimePicker', Sys.UI.Control);

if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();

function NewElement(tag, properties) {
    var element = document.createElement(tag);
    for (var propertyName in properties) {
        AssignProperties(element, propertyName, properties[propertyName]);
    }

    return element;
}
function AssignProperties(el, propertyName, propertyValue) {
    if (typeof (propertyValue) === "string" || typeof (propertyValue) === "number")
        el[propertyName] = propertyValue;
    if (typeof (propertyValue) === "object") {
        for (var childpropertyName in propertyValue) {
            AssignProperties(el[propertyName], childpropertyName, propertyValue[childpropertyName]);
        }
    }
}

String.prototype.trim = function() {
    return this.replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1");
};

