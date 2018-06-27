switch (argument0) {		
	case ROOM.CHARGING:
		return (irandom(5) <= 1) ? sprFloorChargingBattery : sprFloorCharging;
	
	case ROOM.STORAGE:
		return sprFloorStorage;
		
	default: return noone;
}