switch (argument0) {		
	case ROOM.CHARGING:
		return sprWallCharging;
	
	case ROOM.STORAGE:
		return sprWallStorage;
		
	default: return sprWall;
}