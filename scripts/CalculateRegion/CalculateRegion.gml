var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var range = argument4;

var xFrom = [x1, x1, x1, x1];
var yFrom = [y1, y1, y1, y1];
var searchedX = 0;
var searchedY = 0;

var xAxis = [TOP_LEFT, BOTTOM_RIGHT];
var yAxis = [TOP_RIGHT, BOTTOM_LEFT];

var xDir = TOP_LEFT;
var yDir = TOP_RIGHT;

var done = false;

if (x1 == x2 && y1 == y2) {
	done = true;
}

while (!done) {
	for (var i = 0; i <= 1; i ++) {		
		xDir = xAxis[i];
		var tx = xFrom[xDir];
		var ty = yFrom[xDir];
		
		var cx, cy;
		for (var i2 = 0; i2 <= 1; i2 ++) {	
			searchedY = 0;
			var cx = x2;
			var cy = y2;
			while (searchedY < range) {
				yDir = yAxis[i2];
				var cxx = cx;
				var cyy = cy;
				searchedY += 1;
		
				if (cx == tx && cy == ty) {
					done = true;
					yDir = yAxis[1-i2];
					break;
				}
		
				cx = GetNeighbourX(cxx, cyy, yDir);
				cy = GetNeighbourY(cxx, cyy, yDir);
	
				
			}
			
			if (done) {
				break;
			}
		}
		
		xFrom[xDir] = GetNeighbourX(tx, ty, xDir);
		yFrom[xDir] = GetNeighbourY(tx, ty, xDir);
		
		if (done) {
			break;
		}
	}
	
	searchedX += 1;
	if (done) {
		break;
	}
	
	if (searchedX > range) {
		break;
	}
}

if (done) {
	#macro REGION_X1 0
	#macro REGION_Y1 1
	#macro REGION_X2 2
	#macro REGION_Y2 3
	#macro REGION_XDIR 4
	#macro REGION_YDIR 5
	#macro REGION_WIDTH 6
	#macro REGION_HEIGHT 7
	return [x1, y1, x2, y2, xDir, yDir, max(searchedX, 1), max(searchedY, 1)];
} else {
	show_debug_message("FAIL");
	return noone;
}