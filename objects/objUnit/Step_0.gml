depth = y + objMap.tileHeight;

if (state == STATE.IDLE) {
	 
}else if (state == STATE.MOVING) {
	var tx = path_get_point_x(path, pathIndex);
	var ty = path_get_point_y(path, pathIndex);
	tx = WorldX(tx, ty);
	ty = WorldY(tx, ty);
	
	if (abs(tx - x) <= moveSpeed && abs(ty - y) <= moveSpeed) {
		pathIndex += 1;
		
		if (pathIndex > path_get_length(path)) {
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
				SetTile(taskX, taskY, objDirtFloor);
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
		
		default:
		show_debug_message("FAIL TASK");
		task = TASK.IDLE;
		state = STATE.IDLE;
		break;
	}
}