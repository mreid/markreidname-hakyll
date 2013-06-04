/**
 * One-dimensional Bregman divergence visualisation using Paper.js 
 * <http://paperjs.org>
 *
 * AUTHOR:  Mark Reid <mark@reid.name>
 * CREATED: 2013-04-22
 */

// Function to compute f-divergence for and the graph view bounds
var f = function(x) { return x*x; }
var graphView = new Rectangle(-0.5,-20,10,80);

// Constants controlling the visual appearance of the app
var CONST = {
	'markerSize': 3,
	'labelOffset': new Point(3,10),
	'points': 100
};

// Single global variable to be read by mouse event handlers
var markers;

// Run the visualisation
var mousePos = view.center / 2;
initialize();

//--------------------------------------------------------------------------------
// Initialisation

// Initialise everything
function initialize() {
	var axes = initAxes(graphView);
	var graph = initGraph(f, axes);
	markers = initMarkers(graph);
}

// Plot the given function and set of the graph to screen transformation
function initGraph(f, axes) {
	var gView = axes.data.view;

	// Build the graph of f in the given gView coordinates
	var result = new Path();
	result.strokeWidth = 2;
	result.strokeColor = 'black';
    result.segments = [];
    for (var i = 1; i < CONST.points; i++) {
        var x = (i / CONST.points) * gView.width + gView.left;
		if(f(x) < Infinity) {
	        var point = axes.data.screenCoords([x, f(x)]); 
    	    result.add(point);
		}
    }
    result.simplify();
	result.data = axes.data;
	return result;
}

// Builds a view of the x and y axes based on the given graph coordinates
// The returned object has functions `screenCoords` and `graphCoords` for
// transforming between graph and screen coordinate systems
function initAxes(gView) {
	// Standard affine transformation between rectangular coordinate systems
	// This one takes a graph coordinate and returns the corrsponding screen
	// coordinate.
	var g2s = new Matrix(
		view.bounds.right/gView.width, 0, 
		0, -view.bounds.bottom/gView.height,
		-gView.left * view.bounds.right/gView.width, 
		gView.top * view.bounds.bottom/gView.height + view.bounds.bottom
	);

	// Calculate extremes of view in screen coordinates
	var origin = g2s.transform([0,0]);
	var xMin = g2s.transform([graphView.left,0]);
	var xMax = g2s.transform([graphView.right,0]);
	var yMin = g2s.transform([0,graphView.bottom]);
	var yMax = g2s.transform([0,graphView.top]);

	// Build axes
	var xAxis = new Path.Line(xMin, xMax);
	var yAxis = new Path.Line(yMin, yMax);
	var axes = new Group(xAxis, yAxis);

    axes.strokeWidth = 1;
    axes.strokeColor = 'grey';
	axes.data = { 
		'origin': origin, 'xAxis': xAxis, 'yAxis': yAxis,
		'view': gView,
		'screenCoords': function(p) { return g2s.transform(p); },
		'graphCoords': function(p) { return g2s.inverseTransform(p); }
	};
	return axes;
}

// Set up the markers for the x and x' points along with support for 
// drawing tangent and divergence lines
function initMarkers(graph) {
	var result = {};
	result.graph = graph;
	result.x0 = marker(graph, "y");
	result.x1 = marker(graph, "x");
	return result;
};

//---------------------------------------------------------------------------------
// Markers

// Constructs a new marker (circle + label) at the given position.
function labelledPoint(name, position, color, labelOffset) {
	var p = new Path.Circle(position, CONST.markerSize);
	p.fillColor = color;
	p.visible = false;
	
 	var label = new PointText(p.position + labelOffset); 
    label.content = name;
    label.fillColor = color;
	label.data = { 'offset': labelOffset };
	label.visible = false;

	p.data = {};
	p.data.label = label;

	return p;
}

function show(point) { point.visible = true; point.data.label.visible = true; }
function hide(point) { point.visible = false; point.data.label.visible = false; }

// Compute where the label for the given marker point should go
function labelPosition(marker) {
	return marker.position + marker.data.label.data.offset;
}

// Construct a pair of point markers, one for `name` and one for f(`name`)
// The `moveTo` function on the marker will move both the x and f(x) points
// on the graph.
function marker(graph, name) {
	var xPos  = graph.data.origin;
	var fxPos =  graph.data.screenCoords([0,f(0)]);
	var x = labelledPoint(name, xPos, 'black', CONST.labelOffset);	
	var fx = labelledPoint('f('+name+')', undefined, 'red', -CONST.labelOffset);

	var result = {
		'graph': graph,
		'x': x, 'fx': fx,
		// Move the current marker to the given position (inc. labels)
		'moveTo': function(pos) {
			this.x.position.x = pos.x;
			this.x.data.label.position = labelPosition(this.x);

			var xCoord = this.graph.data.graphCoords(pos).x;
			if(f(xCoord) < Infinity) {
				this.fx.position = this.graph.data.screenCoords([xCoord, f(xCoord)]);
				this.fx.data.label.position = labelPosition(this.fx);
				show(this.x);
				show(this.fx);
			} else {
				hide(this.fx);
			}
		},
		// Returns a linear function representing the tangent of the graph
		// at the point f(x).
		'tangent': function() {
			// Build function mapping a value x onto the line <m, x-c> = 0
			if(!isNaN(this.fx.position.x)) {
				var loc = this.graph.getNearestLocation(this.fx.position);
				var m = loc.tangent;
				var c = loc.point;
				return function(x) { return c + m * (x - c.x) / m.x; }
			} else {
				return undefined;
			}
		},
	};
	return result;
};


//--------------------------------------------------------------------------------
// Events

function onMouseDown(event) {
	// Update the location of the x0 marker
	markers.x0.moveTo(mousePos);
	
	// Compute values on tangent at extremes of view
	var tangentFn = markers.x0.tangent();
	if(tangentFn !== undefined) {
		var start = tangentFn(0);
		var end = tangentFn(view.bounds.width);
		var tangent = new Path.Line(start, end);
    	tangent.strokeColor = 'red';
    	tangent.removeOnDown();
	}

	// Make sure all markers are redrawn
	this.onMouseMove(event);
}

function onMouseMove(event) {
	// Get horizontal mouse position and clamp to view.
    mousePos = new Point(event.point);
	if(mousePos.x < view.bounds.left) { mousePos.x = view.bounds.left; }
	if(mousePos.x > view.bounds.right) { mousePos.x = view.bounds.right; }

	if(mousePos.y > view.bounds.top && mousePos.y < view.bounds.bottom) {
		// Update the position of the x1 marker
		markers.x1.moveTo(mousePos);

		// Compute the line between the tangent and the graphed function at x1
		var start = markers.x1.fx.position;
		if(markers.x0.fx.visible) {
			var tangentFn = markers.x0.tangent();
			var end = tangentFn(start.x);

			// Draw the divergence line
			var div = new Path.Line(start,end);
			div.strokeWidth = 2;
			div.strokeColor = 'blue';
			div.removeOnMove();
		}
	} else {
		document.dispatchEvent(event);
	}
}

// Reposition the path whenever the window is resized:
function onResize(event) {
    initializePath();
}
