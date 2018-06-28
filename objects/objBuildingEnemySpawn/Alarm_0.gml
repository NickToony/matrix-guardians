alarm[0] = frequency + (room_speed * instance_number(objEnemy));

if (instance_number(objEnemy) < global.MAX_ENEMIES) {
	CreateUnit(gridX, gridY, objEnemySimple);
}