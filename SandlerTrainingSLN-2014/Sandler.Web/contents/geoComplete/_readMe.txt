https://github.com/ubilabs/geocomplete
jQuery Wrapper for Google Places Search API 
	(https://developers.google.com/maps/documentation/javascript/geocoding?csw=1#GeocodingResults)
Integrated on 08/08/2013 by Junho

Binding can be done in two ways.
1. Using Options and Directives of "details" w/ ".form-group" and detailsAttribute w/ "data-geo"
	- (HTML) <div = class="form-group">...<input id="pe_city" class="form-control" data-geo="locality" type="text" data-bind="value: CITY">
	- (SCRIPT) .geocomplete({ details: ".form-group", detailsAttribute: "data-geo" })
	
2. Using .bind event
	- (SCRIPT) 
		.bind("geocode:result", function (event, result) {                
                	locality = get_GoogleGeoAttribute(result.address_components, "locality", true);