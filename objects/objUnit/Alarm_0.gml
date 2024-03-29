
if (state == STATE.TASK) {
	alarm[0] = 10;
} else {
	alarm[0] = room_speed;	
}

if (gateway) return;
if (pickedup) return;

var currentX = gridX;
var currentY = gridY;

var closest = instance_nearest(x, y, targetObject);
var closestBuilding =  instance_nearest(x, y, objBuildingEnemySpawn);;
if (closest == noone && targetObject == objEnemy) {
	closest = closestBuilding;
}
if (damage > 0 && ((closest != noone && state != STATE.ATTACK) || (state == STATE.ATTACK && target != closest))) {
	if (closest && closest.object_index != objBuildingEnemySpawn && point_distance(x, y, closest.x, closest.y) < 800) {
		var temp = APathFind(currentX, currentY, UnworldX(closest.x, closest.y), UnworldY(closest.x, closest.y), false);
		if (temp != noone) {
			if (ds_stack_size(temp) < 20) {
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
	} else if (state == STATE.IDLE && instance_exists(objBuildingEnemySpawn) && targetObject == objEnemy) {
		closest = instance_nearest(x, y, objBuildingEnemySpawn);
		if (closest && point_distance(x, y, closest.x, closest.y) < 3000) {
			var temp = APathFind(currentX, currentY, closest.gridX, closest.gridY, false);
			if (temp != noone) {
				if (path != noone) {
					APathDestroy(path);	
				}
				state = STATE.ATTACK;
				ClearTasks();
				path = temp;
				target = closest;
			}
		}
	}
}

if (damage == 0 && !flee && closest && point_distance(x, y, closest.x, closest.y) < 500) {
	ClearTasks();
	STATE = STATE.IDLE;
	TASK = TASK.IDLE;
	if (path != noone) {
		APathDestroy(path);
		path = noone;
	}
	flee = true;
}

if (state == STATE.IDLE && task == TASK.IDLE) {
	
	gridX = UnworldX(x, y);
	gridY = UnworldY(x, y);
	currentX = gridX;
	currentY = gridY;
	
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
		} else {
			alarm[0] = room_speed * 5;	
		}
	}
}