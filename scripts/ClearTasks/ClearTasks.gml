var oldTask = task;

if (oldTask != TASK.IDLE) {
	//CancelTasks(taskX, taskY, true);
	var tile = GetTile(taskX, taskY);
	
	if (tile != noone) {
		switch (oldTask) {
			case TASK.DIG:
				tile.taskDig = false;
				AddDigTask(taskX, taskY);
				break;
			
			case TASK.FLOOR:
				tile.taskFloor = false;
				AddFloorTask(taskX, taskY);
				break;
			
			case TASK.WALL:
				tile.taskWall = false;
				AddWallTask(taskX, taskY);
				break;
			
			case TASK.PICKUP:
				taskObj.bot = noone;
				break;
		}
	}
	
	
}

if (metals > 0) {
	CreateMetals(gridX, gridY, metals);	
}

task = TASK.IDLE;