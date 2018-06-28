var oldTask = task;

if (oldTask != TASK.IDLE) {
	CancelTasks(taskX, taskY, true);
	
	switch (oldTask) {
		case TASK.DIG:
			AddDigTask(taskX, taskY);
			break;
			
		case TASK.FLOOR:
			AddFloorTask(taskX, taskY);
			break;
			
		case TASK.WALL:
			AddWallTask(taskX, taskY);
			break;
	}
}

if (metals > 0) {
	CreateMetals(gridX, gridY, metals);	
}

task = TASK.IDLE;