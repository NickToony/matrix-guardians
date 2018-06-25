var region = argument0;
var col = argument1;

if (region == noone) {
	return;
} else {
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
			
			draw_sprite_ext(sprBlock, 0, WorldX(cx, cy), WorldY(cx, cy), 1, 1, 0, col, 0.4);
			
			xxx = GetNeighbourX(cx, cy, region[REGION_YDIR]);
			yyy = GetNeighbourY(cx, cy, region[REGION_YDIR]);
			sy-= 1;
		}
		
		
		xx = GetNeighbourX(tx, ty, region[REGION_XDIR]);
		yy = GetNeighbourY(tx, ty, region[REGION_XDIR]);
		searchedX -= 1;
	}	
}