alarm[0] = frequency;
if (!global.BEGIN_WIN) {
	alarm[0] += (room_speed * instance_number(objEnemy)/10);
}

if (instance_number(objEnemy) < min(difficulty, global.MAX_ENEMIES)) {
	var enemy = objEnemySimple;
	
	if (difficulty > 1 && irandom(6) < difficulty) {
		enemy = objEnemyHard;
	}
	if (global.BEGIN_WIN && irandom(4) <= 1) {
		enemy = objEnemyBoss;
	}
	CreateUnit(gridX, gridY, enemy);
}