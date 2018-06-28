gridX = UnworldX(x, y);
gridY = UnworldY(x, y);

if (myHealth <= 0) {
	instance_destroy();	
}

if (pickedup) {
	x = mouse_x + 64;
	y = mouse_y;
	depth = 999999;
	
	if (mouse_check_button(mb_right)) {
		var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
		if (tile != noone && !tile.solid && tile.connected) {
			x = WorldX(tile.gridX, tile.gridY);
			y = WorldY(tile.gridX, tile.gridY);
			pickedup = false;
			return;
		} else {
			PlayUISound(sndFailed);	
		}
	}
	
	return;	
}

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
var multiplier = 1;
if (overclocked) {
	overclocked -= 1;
	multiplier = 2;
	energy = totalEnergy;
}

if (state == STATE.IDLE) {
	 
}else if (state == STATE.MOVING) || (state == STATE.ASSAULT) {
	var node = ds_stack_top(path);
	var tx = node[0];
	var ty = node[1];
	var currentSpeed = (energy <= 0) ? crawlSpeed : moveSpeed * multiplier;
	tx = WorldX(tx, ty);
	ty = WorldY(tx, ty);
	
	if (abs(tx - x) <= currentSpeed && abs(ty - y) <= currentSpeed) {
		ds_stack_pop(path);
		taskProgress = 0;
		
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
		
		var tile = GetTile(node[0], node[1]);
		if (tile == noone) {
			APathDestroy(path);
			path = noone;
			state = STATE.IDLE;	
		}
		
		if (tile.solid && state == STATE.ASSAULT) {
			if (taskProgress > tile.digTime * 2) {
				SetTile(tile.gridX, tile.gridY, objDirtFloor);
			} else {
				taskProgress += 1;	
			}
		} else {
			MoveTowards(tx, ty, currentSpeed);
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
			} else { taskProgress += multiplier }
		break;
		
		case TASK.FLOOR:
			if (taskProgress > taskTime) {
				SetTile(taskX, taskY, objFloorTile);
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress += multiplier }
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
			} else { taskProgress += multiplier }
		break;
		
		case TASK.CHARGE:
			if (taskProgress > taskTime) {
				energy = totalEnergy;
				myHealth = maxHealth;
				task = TASK.IDLE;
				state = STATE.IDLE;	
			} else { taskProgress += max(1, chargeSpeed * ds_list_size(global.ROOMS[ROOM.CHARGING])) * multiplier; }
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
} else if (state == STATE.ATTACK) {
	if (!instance_exists(target)) {
		state = STATE.IDLE;
		return;
	}
	
	if (point_distance(x, y, target.x, target.y) < objMap.tileWidth) {
		target.myHealth -= damage;
	} else {
		if (path == noone) {
			path = APathFind(gridX, gridY, UnworldX(target.x, target.y), UnworldY(target.x, target.y), false);
			if (path == noone) {
				state = STATE.IDLE;	
			}
		}
		
		// Move along path..
		var node = ds_stack_top(path);
		var tx = node[0];
		var ty = node[1];
		var currentSpeed = (energy <= 0) ? crawlSpeed : moveSpeed * multiplier;
		tx = WorldX(tx, ty);
		ty = WorldY(tx, ty);
	
		if (abs(tx - x) <= currentSpeed && abs(ty - y) <= currentSpeed) {
			ds_stack_pop(path);
		
			if (ds_stack_empty(path)) {
				APathDestroy(path);
				path = noone;
			}
		} else {
			MoveTowards(tx, ty, currentSpeed);
		}
	}
}