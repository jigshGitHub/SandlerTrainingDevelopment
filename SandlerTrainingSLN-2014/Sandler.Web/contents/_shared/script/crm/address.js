
/* [[[[[ GeoComplete/GooglePlacesaPI ]]]]] //////////////////////////////////////////////////////////// */

/* [[ showAddrOnMap_ ]] Shown an address on a Google Map */
function showAddrOnMap_(
    inputSelector,      // Input Element
    mapSelector,        // Map Element
    location            // Address Line
) {
    try
    {
        if (location != "") {
            $(inputSelector)
                .geocomplete({ map: mapSelector })
                .one("geocode:result", function (event, result) {
                    $(inputSelector).val('');
                });
            $(inputSelector).geocomplete("find", location);
        }
        return true;
    }
    catch (err) {
        return false;
    }
};

/* [[ bindFindAddr_ ]] Bind Address Search w/ a map */
                    function bindFindAddr_getAttribute_(result, fieldName) {
                        try {
                            return get_GoogleGeoAttribute(result.address_components, fieldName, true)
                        }
                        catch (err) {
                            return "";
                        }
                    }
function bindFindAddr_(
    inputSelector,      // Input Element
    mapSelector,        // Map Element
    focusSelector,      // Element to Focus after Search
    dataViewModel       // Knockout Data Object w/ following observable fields: STREET, ADDR1, ADDR2, CITY, STATE, ZIP
) {
    try
    {
        $(inputSelector)
            .geocomplete({ map: mapSelector })  //, details: ".form-group", detailsAttribute: "data-geo" })
            .bind("geocode:result", function (event, result) {
                dataViewModel.STREET( bindFindAddr_getAttribute_(result, "street_number") + ' '
                                    + bindFindAddr_getAttribute_(result, "route"));
                dataViewModel.ADDR1('');
                dataViewModel.ADDR2('');
                dataViewModel.CITY(bindFindAddr_getAttribute_(result, "locality"));
                dataViewModel.STATE(bindFindAddr_getAttribute_(result, "administrative_area_level_1"));
                dataViewModel.ZIP(bindFindAddr_getAttribute_(result, "postal_code"));
            })       
            .one("geocode:result", function (event, result) {
                $(inputSelector).val('');
                $(focusSelector).focus();
            });
        return true;
    }
    catch (err) {
        console.log(err);
        return false;
    }
};

/* [[ findAddr_ ]] Find and Show an address on a map (REQUIRED: GeoComplete must be pre-bound) */
function findAddr_(
    inputSelector,      // Input Element
    location            // Address Line/Location
) {
    try {
        if (location != "") {
            $(inputSelector).geocomplete("find", location);
        }
        return true;
    }
    catch (err) {
        return false;
    }
};

