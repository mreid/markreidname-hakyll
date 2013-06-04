// Assumes bregman.js has already been loaded

// Function to compute f-divergence for and the graph view bounds
var f = function(x) { return x*x/2; }
var graphView = new Rectangle(-0.5,-15,6,30);

// Run the visualisation
// var mousePos = view.center / 2;
initialize();
