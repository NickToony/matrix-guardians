var assaultCount = 0;
with (objEnemy) {
	if (state == STATE.ASSAULT) {
		assaultCount += 1;	
	}
}
if (assaultCount < global.ASSAULT_MAX && irandom(10) <= 1) {
	var newPath = PathFindThroughDirt(gridX, gridY, objGateway.gridX, objGateway.gridY);
	if (newPath != noone) {
		if (path != noone) {
			APathDestroy(path);
		}
			
		state = STATE.ASSAULT;
		path = newPath;
	}
}