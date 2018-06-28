
if (state == STATE.TASK) {
	alarm[0] = 10;
} else {
	alarm[0] = room_speed;	
}

if (gateway) return;
if (pickedup) return;

var currentX = gridX;
var currentY = gridY;

if (damage > 0 && targetObject != noone && state != STATE.ATTACK) {
	var closest = instance_nearest(x, y, targetObject);
	if (closest && point_distance(x, y, closest.x, closest.y) < 600) {
		var temp = APathFind(currentX, currentY, UnworldX(closest.x, closest.y), UnworldY(closest.x, closest.y), false);
		if (temp != noone) {
			if (ds_stack_size(temp) < 15) {
				if (path != noone) {
					APathDestroy(path);	
				}
				state = STATE.ATTACK;
				ClearTasks();
				path = temp;
				target = closest;
			} else {
				APathDestroy(temp);
			}
		}
	} else if (state == STATE.IDLE && instance_exists(objBuildingEnemySpawn) && irandom(10) <= 1) {
		var closest = instance_nearest(x, y, objBuildingEnemySpawn);
		if (closest && point_distance(x, y, closest.x, closest.y) < 600) {
		var temp = APathFind(currentX, currentY, closest.gridX, closest.gridY, false);
			if (temp != noone) {
				if (ds_stack_size(temp) > 2) {
					if (path != noone) {
						APathDestroy(path);	
					}
					state = STATE.MOVING;
					ClearTasks();
					path = temp;
				} else {
					APathDestroy(temp);
					with (closest) { instance_destroy(); };
				}
			}
		}
	}
}

if (state == STATE.IDLE && task == TASK.IDLE) {
	
	event_user(0);
	
	// If STILL idle
	if (state == STATE.IDLE && task == TASK.IDLE) {
		// Find a open spot
		var okay = false;
		var cell = noone;
		var attempts = 0;
		while (!okay) {
			cell = 	GetTile(irandom(objMap.mapWidth), irandom(objMap.mapHeight));
			if (cell != noone && !cell.solid) {
				okay = true;
			}
			
			attempts += 1;
			if (attempts > 10) {
				break;	
			}
		}
		if (okay) {
			path = APathFind(currentX, currentY, cell.gridX, cell.gridY, false);
			if (path != noone) {
				state = STATE.MOVING;
			}
		}
	}
}