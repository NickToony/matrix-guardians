switch (argument0) {		
	case ROOM.CHARGING:
		return sprWallCharging;
	
	case ROOM.STORAGE:
		return sprWallStorage;
		
	case ROOM.ASSEMBLY:
		return sprWallAssembly;
		
	case ROOM.ARCHIVE:
		return sprWallArchive;
		
	default: return sprWallDefault;
}