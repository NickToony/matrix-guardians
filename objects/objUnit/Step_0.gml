depth = y + objMap.tileHeight/2;

if (state == STATE.IDLE) {
	 
}else if (state == STATE.MOVING) {
	var node = ds_stack_top(path);
	var tx = node[0];
	var ty = node[1];
	tx = WorldX(tx, ty);
	ty = WorldY(tx, ty);
	
	if (abs(tx - x) <= moveSpeed && abs(ty - y) <= moveSpeed) {
		ds_stack_pop(path);
		
		if (ds_stack_empty(path)) {
			APathDestroy(path);
			path = noone;
			if (task != TASK.IDLE) {
				state = STATE.TASK;
				taskProgress = 0;
			} else {
				state = STATE.IDLE;	
			}
		}
	} else {
		var angle = point_direction(x, y, tx, ty);
		x += lengthdir_x(moveSpeed, angle);
		y += lengthdir_y(moveSpeed, angle);
	}
} else if (state == STATE.TASK) {
	switch (task) {
		case TASK.DIG:
			if (taskProgress > digSpeed) {
				var instance = SetTile(taskX, taskY, objDirtFloor);
				for (var i = 0; i <= 3; i ++) {
					var xx = GetNeighbourX(taskX, taskY, i);
					var yy = GetNeighbourY(taskX, taskY, i);
					AddWallTask(xx, yy);	
				}
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress ++ }
		break;
		
		case TASK.FLOOR:
			if (taskProgress > floorSpeed) {
				SetTile(taskX, taskY, objFloorTile);
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress ++ }
		break;
		
		case TASK.WALL:
			if (taskProgress > floorSpeed) {
				var currentTile = GetTile(taskX, taskY);
				if (currentTile == noone || !currentTile.wallable) {
					
				} else {
					var taskDig = currentTile.taskDig;
					var tile = SetTile(taskX, taskY, objBlockTile);
					SetTileWalls(tile, sprWall);
					tile.taskDig = taskDig;
				}
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress ++ }
		break;
		
		default:
		show_debug_message("FAIL TASK");
		task = TASK.IDLE;
		state = STATE.IDLE;
		break;
	}
}