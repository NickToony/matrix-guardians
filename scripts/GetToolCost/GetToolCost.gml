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
		
	case TOOL.SPAWN:
		cost = 300;
		break;
		
	case TOOL.OVERCLOCK:
		cost = 100;
		break;
		
	case TOOL.ARCHIVE:
		cost = 150;
		break;
		
	case TOOL.ASSEMBLY:
		cost = 60;
		break;
		
	case TOOL.GENERATOR:
		cost = 500;
		break;
	
	default:
		cost = 0;
}

if (region == noone) {
	return cost;
} else {
	return (array_length_1d(RegionToArray(region))) * cost;	
}