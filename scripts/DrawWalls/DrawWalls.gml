for (var dir = 0; dir < array_length_1d(argument0); dir++) {
	var wall = argument0[dir];
	if (wall == noone) continue;
	
	var tile;

	switch (dir) {
		case TOP_LEFT:
			tile = topLeft;
			break;
		
		case TOP_RIGHT:
			tile = topRight;
			break;
			
		case BOTTOM_RIGHT:
			tile = bottomRight;
			break;
			
		case BOTTOM_LEFT:
			tile = bottomLeft;
			break;
	}

	if (tile != noone && tile.solid) continue;

	var xx = 0, yy = 0, ind = 0;
	var sprite = wall;

	switch (dir) {
		case BOTTOM_LEFT:
		xx = -40;
		yy = 0;
		break;
	
		case BOTTOM_RIGHT:
		xx = 40;
		yy = 0;
		ind = 1;
		break;
	
		case TOP_LEFT:
		xx = -40;
		yy = -57;
		ind = 0;
		sprite = sprWallTop;
		break;
	
		case TOP_RIGHT:
		xx = 40;
		yy = -57;
		ind = 1;
		sprite = sprWallTop;
		break;
	}

	draw_sprite(sprite, ind, x + xx, y + yy);
}

