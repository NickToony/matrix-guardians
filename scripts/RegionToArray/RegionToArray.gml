var region = argument0;

if (region == noone) {
	return;
} else {
	var arr = [];
	var i = 0;
	var xx = region[REGION_X1];
	var yy = region[REGION_Y1];
	var searchedX = region[REGION_WIDTH];
	var searchedY = region[REGION_HEIGHT];
	while (searchedX > 0) {
		var tx = xx;
		var ty = yy;
		
		var xxx = xx;
		var yyy = yy;
		var sy = searchedY;
		while (sy > 0) {
			var cx = xxx;
			var cy = yyy;
			
			arr[i] = [cx, cy];
			i += 1;
			
			xxx = GetNeighbourX(cx, cy, region[REGION_YDIR]);
			yyy = GetNeighbourY(cx, cy, region[REGION_YDIR]);
			sy-= 1;
		}
		
		
		xx = GetNeighbourX(tx, ty, region[REGION_XDIR]);
		yy = GetNeighbourY(tx, ty, region[REGION_XDIR]);
		searchedX -= 1;
	}	
	
	return arr;
}