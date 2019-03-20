//
// Overlay for adding some HTML text on cords specified by bounds over the given map
//
function overlayText(bounds, HTMLcontent, map, minZoomToBeShow)
{

	// Now initialize all properties.
	this.bounds_ = bounds;
	this.HTMLcontent_ = HTMLcontent;
	this.map_ = map;
	this.minZoomToBeShow_ = minZoomToBeShow;	// defaults to current (upon creation) zoom

	// We define a property to hold the HTMLcontent's
	// div. We'll actually create this div
	// upon receipt of the add() method so we'll
	// leave it null for now.
	this.div_ = null;

	// Explicitly call setMap() on this overlay
	this.setMap(map);
}

overlayText.prototype = new google.maps.OverlayView();

overlayText.prototype.onAdd = function()
{

	// Note: an overlay's receipt of onAdd() indicates that
	// the map's panes are now available for attaching
	// the overlay to the map via the DOM.

	// Create the DIV and set some basic attributes.
	var div = document.createElement('DIV');
	div.style.border = "none";
	div.style.borderWidth = "0px";
	div.style.position = "absolute";

	// default text styles
	div.style.fontFamily = 'Verdana,Arial,sans';
	div.style.fontWeight = 'bold';
	div.style.fontSize = '13px';
	div.style.textAlign = 'center';
	
	// content
	div.innerHTML = this.HTMLcontent_;

	// Set the overlay's div_ property to this DIV
	this.div_ = div;

	// We add an overlay to a map via one of the map's panes.
	var panes = this.getPanes();
	//panes.overlayLayer.appendChild(div);		// on the same level as polygons (and such)
	panes.overlayShadow.appendChild(div);		// above polygons
}

overlayText.prototype.draw = function()
{

	// Size and position the overlay. We use a southwest and northeast
	// position of the overlay to peg it to the correct position and size.
	// We need to retrieve the projection from this overlay to do this.
	var overlayProjection = this.getProjection();

	// Retrieve the southwest and northeast coordinates of this overlay
	// in latlngs and convert them to pixels coordinates.
	// We'll use these coordinates to resize the DIV.
	var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
	var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());

	// Resize the image's DIV to fit the indicated dimensions.
	var div = this.div_;
	div.style.left = sw.x + 'px';
	div.style.top = ne.y + 'px';
	div.style.width = (ne.x - sw.x) + 'px';
	div.style.height = (sw.y - ne.y) + 'px';

	// EXTRA: hide after zooming out (show on zooming in)
	if (this.map_.getZoom() >= this.minZoomToBeShow_)
	{
		this.show();
	}
	else
	{
		this.hide();
	}
}

overlayText.prototype.onRemove = function()
{
	this.div_.parentNode.removeChild(this.div_);
	this.div_ = null;
}

//
// Hiding and Showing an Overlay
//
// Note that the visibility property must be a string enclosed in quotes
overlayText.prototype.hide = function()
{
	if (this.div_)
	{
		this.div_.style.visibility = "hidden";
	}
}

overlayText.prototype.show = function()
{
	if (this.div_)
	{
		this.div_.style.visibility = "visible";
	}
}

overlayText.prototype.toggle = function()
{
	if (this.div_)
	{
		if (this.div_.style.visibility == "hidden")
		{
			this.show();
		}
		else
		{
			this.hide();
		}
	}
}

overlayText.prototype.toggleDOM = function()
{
	if (this.getMap())
	{
		this.setMap(null);
	}
	else
	{
		this.setMap(this.map_);
	}
}