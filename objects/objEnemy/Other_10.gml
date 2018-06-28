var assaultCount = 0;
with (objEnemy) {
	if (state == STATE.ASSAULT) {
		assaultCount += 1;	
	}
}
if (assaultCount <= global.ASSAULT_MAX && irandom(10) <= 1) {
	path = PathFindThroughDirt(gridX, gridY, objGateway.gridX, objGateway.gridY);
	show_debug_message("ATTEMPT ASSAULT");
	if (path != noone) {
		state = STATE.ASSAULT;
	}
}