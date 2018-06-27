switch (argument0) {		
	case ROOM.CHARGING:
		return sprFloorCharging;
	
	case ROOM.STORAGE:
		return sprFloorStorage;
		
	default: return noone;
}