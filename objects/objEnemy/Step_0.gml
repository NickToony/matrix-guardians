depth = y + 10 + objMap.tileHeight/2;

if (myHealth <= 0) {
	instance_destroy();	
}

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
			MoveTowards(tx, ty, currentSpeed);
		}
		
	}
}