if (gateway) {
	depth = 999999;
	image_index = 3;
	var xx = UnworldX(x, y);
	var yy = UnworldY(x, y);
	var tx = WorldX(GetNeighbourX(xx, yy, BOTTOM_LEFT), GetNeighbourY(xx, yy, BOTTOM_LEFT));
	var ty = WorldY(GetNeighbourX(xx, yy, BOTTOM_LEFT), GetNeighbourY(xx, yy, BOTTOM_LEFT));
	
	var tile = GetTile(xx, yy);
	if (point_distance(x,y,tile.x, tile.y) <= moveSpeed && tile != noone && !tile.solid) {
		gateway = false;	
	} else {
		var angle = point_direction(x, y, tx, ty);
		x += lengthdir_x(moveSpeed/2, angle);
		y += lengthdir_y(moveSpeed/2, angle);
	}
	return;
}

depth = y + 10 + objMap.tileHeight/2;

if (state == STATE.IDLE) {
	 
}else if (state == STATE.MOVING) {
	var node = ds_stack_top(path);
	var tx = node[0];
	var ty = node[1];
	var currentSpeed = (energy <= 0) ? crawlSpeed : moveSpeed;
	tx = WorldX(tx, ty);
	ty = WorldY(tx, ty);
	
	if (abs(tx - x) <= currentSpeed && abs(ty - y) <= currentSpeed) {
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
} else if (state == STATE.TASK) {
	switch (task) {
		case TASK.DIG:
			if (taskProgress > taskTime) {
				var oldTile = GetTile(taskX, taskY);
				if (oldTile != noone && oldTile.metals > 0) {
					CreateMetals(taskX, taskY, oldTile.metals);
				}
				
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
			if (taskProgress > taskTime) {
				SetTile(taskX, taskY, objFloorTile);
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress ++ }
		break;
		
		case TASK.WALL:
			if (taskProgress > taskTime) {
				var currentTile = GetTile(taskX, taskY);
				if (currentTile == noone || !currentTile.wallable || currentTile.taskDig) {
					
				} else {
					var taskDig = currentTile.taskDig;
					var tile = SetTile(taskX, taskY, objBlockTile);
					SetTileWalls(tile, true);
					tile.taskDig = taskDig;
				}
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress ++ }
		break;
		
		case TASK.CHARGE:
			if (taskProgress > taskTime) {
				energy = totalEnergy;
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress += max(1, chargeSpeed * ds_list_size(global.ROOMS[ROOM.CHARGING])); }
		break;
		
		case TASK.PICKUP:
			// if it needs moving to storage
			if (instance_exists(taskObj)) {
				if (!taskObj.stored) {
					metals += taskObj.metals;
					with (taskObj) instance_destroy();	
				} else if (taskObj.metals > MAX_METALS) {
					// It's too big!
					var diff = abs(taskObj.metals - MAX_METALS);
					metals += diff;
					taskObj.metals -= diff;
					taskObj.bot = noone;
					taskObj.stored = true;
				}
			}
			task = TASK.IDLE;
			state = STATE.IDLE;	
		break;
		
		case TASK.DROP:
			CreateMetals(taskX, taskY, metals);
		
			metals = 0;
			task = TASK.IDLE;
			state = STATE.IDLE;	
		break;
		
		default:
		show_debug_message("FAIL TASK");
		task = TASK.IDLE;
		state = STATE.IDLE;
		break;
	}
}