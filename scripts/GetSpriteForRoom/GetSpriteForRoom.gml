switch (argument0) {		
	case ROOM.CHARGING:
		return (irandom(5) <= 1) ? sprFloorChargingBattery : sprFloorCharging;
	
	case ROOM.STORAGE:
		return sprFloorStorage;
		
	case ROOM.ASSEMBLY:
		return (irandom(5) <= 1) ? sprFloorAssemblyFan : sprFloorAssembly;
		
	case ROOM.ARCHIVE:
		return (irandom(5) <= 1) ? sprFloorArchiveServer : sprFloorArchive;
		
	default: return sprFloorStorage;
}