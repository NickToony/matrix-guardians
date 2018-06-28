alarm[0] = frequency + (room_speed * instance_number(objEnemy));

if (instance_number(objEnemy) < min(difficulty, global.MAX_ENEMIES)) {
	var enemy = objEnemySimple;
	
	if (difficulty > 1 && irandom(10) < difficulty) {
		enemy = objEnemyHard;
	}
	CreateUnit(gridX, gridY, enemy);
}