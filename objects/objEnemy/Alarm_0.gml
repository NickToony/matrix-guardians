alarm[0] = room_speed;	

if (state == STATE.IDLE) {
	var currentX = UnworldX(x, y);
	var currentY = UnworldY(x, y);
	
	var assaultCount = 0;
	with (objEnemy) {
		if (state == STATE.ASSAULT) {
			assaultCount += 1;	
		}
	}
	if (assaultCount <= global.ASSAULT_MAX && irandom(10) <= 1) {
		path = PathFindThroughDirt(currentX, currentY, objGateway.gridX, objGateway.gridY);
		show_debug_message("ATTEMPT ASSAULT");
		if (path != noone) {
			state = STATE.ASSAULT;
		}
	}
	
	// If STILL idle
	if (state == STATE.IDLE) {
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