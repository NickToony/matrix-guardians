if (argument0.wallable) {
	argument0.walled[@BOTTOM_RIGHT] = argument1;
	argument0.walled[@BOTTOM_LEFT] = argument1;
	argument0.walled[@TOP_LEFT] = argument1;
	argument0.walled[@TOP_RIGHT] = argument1;
	RecalcNeighbours(argument0);
}