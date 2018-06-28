var currentTile = argument0;

if (!currentTile.walls) return;

for (var dir = 0; dir < array_length_1d(currentTile.walled); dir++) {
	var wall = currentTile.walled[dir];
	if (wall == noone) {
		wall = sprWallDefault;	
	}
	
	var tile;

	switch (dir) {
		case TOP_LEFT:
			tile = currentTile.topLeft;
			break;
		
		case TOP_RIGHT:
			tile = currentTile.topRight;
			break;
			
		case BOTTOM_RIGHT:
			tile = currentTile.bottomRight;
			break;
			
		case BOTTOM_LEFT:
			tile = currentTile.bottomLeft;
			break;
	}

	if (tile != noone && tile.solid) continue;
	
	if (tile != noone && tile.roomType != ROOM.NONE) {
		wall = GetWallForRoom(tile.roomType);	
	}

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

	draw_sprite(sprite, ind, currentTile.x + objMap.tileWidth + xx, SURFACE_HEIGHT + yy);
}

