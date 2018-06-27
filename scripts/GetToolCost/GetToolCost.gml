var tool = argument0;
var region = argument1;

var cost = 0;
switch (tool) {
	
	case TOOL.CHARGE:
		cost = 100;
		break;
		
	case TOOL.STORAGE:
		cost = 0;
		break;
	
	default:
		cost = 0;
}

if (region == noone) {
	return cost;
} else {
	return (array_length_1d(RegionToArray(region))) * cost;	
}