if (!global.PAUSED) {
	if (waveCountdown <= 0) {
		TriggerEnemyWave();
		waveCountdown = global.WAVE_TIME;
	} else {
		waveCountdown -= 1;	
	}
}

if (global.BEGIN_WIN) {
	if (instance_number(objEnemy) <= 0 && instance_number(objBuildingEnemySpawn) <= 0 && !global.FINISHED)  {
		ShowMessage("THE GATEWAY IS ACTIVATED - THIS REALM IS ASSIMILATED!");
		ShowMessage("You have completed this Game Jam submission - thanks for playing!");
		ShowMessage("Want to play more? Just refresh the page, the map is randomly generated! Alternatively, you can keep playing this level.");
		global.FINISHED = true;
	}
}