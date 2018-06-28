depth = y + 10 + objMap.tileHeight/2;

if (state == STATE.IDLE) {
	 
} else if (state == STATE.MOVING) || (state == STATE.ASSAULT) {
	var node = ds_stack_top(path);
	var tx = node[0];
	var ty = node[1];
	var currentSpeed = moveSpeed;
	tx = WorldX(tx, ty);
	ty = WorldY(tx, ty);
	
	if (abs(tx - x) <= currentSpeed && abs(ty - y) <= currentSpeed) {
		ds_stack_pop(path);
		taskProgress = 0;
		
		if (ds_stack_empty(path)) {
			APathDestroy(path);
			path = noone;
			state = STATE.IDLE;	
		}
	} else {
		
		var tile = GetTile(node[0], node[1]);
		if (tile == noone) {
			APathDestroy(path);
			path = noone;
			state = STATE.IDLE;	
		}
		
		if (tile.solid) {
			if (taskProgress > tile.digTime * 2) {
				SetTile(tile.gridX, tile.gridY, objDirtFloor);
			} else {
				taskProgress += 1;	
			}
		} else {
			var angle = point_direction(x, y, tx, ty);
			x += lengthdir_x(currentSpeed, angle);
			y += lengthdir_y(currentSpeed, angle);
			if (x < tx) {
				if (y > ty) {
					// top right
					image_index = 0;
				} else {
					// bottom right
					image_index = 2;
				}
			} else {
				if (y > ty) {
					// top left
					image_index = 1;
				
				} else {
					// botom left
					image_index = 3;
				}
			}
		}
		
	}
}