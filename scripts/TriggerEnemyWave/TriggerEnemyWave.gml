// Find a open spot

if (instance_exists(objBuildingEnemySpawn)) {
	return;
}

var count = 1;
if (global.DIFFICULTY > 4) {
	count = 2;
}
if (global.BEGIN_WIN) {
	count = 4;
	global.ASSAULT_MAX = 10;
	global.DIFFICULTY = 10;
	global.FREQUENCY /= 2;
}



var tile;
var added = false;
repeat (count) {
	var cell = noone;
	var attempts = 0;
	var okay = false;
	while (!okay) {
		cell = 	GetTile(irandom(objMap.mapWidth), irandom(objMap.mapHeight));
		if (cell != noone && cell.object_index == objDirtBlock && !cell.accessible) {
			okay = true;
		}
			
		attempts += 1;
		if (attempts > 100) {
			break;	
		}
	}
	if (okay) {
		tile = SetTile(cell.gridX, cell.gridY, objDirtFloor);
		CreateBuilding(cell.gridX, cell.gridY, objBuildingEnemySpawn, false);
		tile.isVisible = true;
		added = true;
	}
}

if (added) {
	if (!global.BEGIN_WIN) {
		ShowMessage("ALERT! ALERT! HUMANS HAVE BEEN ENCOUNTERED! STOP THEM!");
	}
	MoveCameraWorld(tile.gridX, tile.gridY, false);
	
	objMap.tool = TOOL.NONE;
	global.DIFFICULTY += global.DIFFICULTY_INCREMENT;
}