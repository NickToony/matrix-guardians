// Inherit the parent event
event_inherited();

enum STATE {
	IDLE,
	MOVING,
	TASK
}

enum TASK {
	IDLE,
	DIG,
	FLOOR,
	WALL
}

path = noone;
//pathIndex = 0;
alarm[0] = 60;
state = STATE.IDLE;
task = TASK.IDLE;
taskX = noone;
taskY = noone;
taskProgress = 0;

moveSpeed = 8;
digSpeed = room_speed;
floorSpeed = room_speed/2;