// Find a open spot
var okay = false;
var cell = noone;
var attempts = 0;
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
	var tile = SetTile(cell.gridX, cell.gridY, objDirtFloor);
	tile.isVisible = true;
	MoveCameraWorld(tile.gridX, tile.gridY, false);
	ShowMessage("ALERT! ALERT! HUMANS HAVE BEEN ENCOUNTERED! STOP THEM!");
	objMap.tool = TOOL.NONE;
}