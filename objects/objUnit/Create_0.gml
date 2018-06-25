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
gateway = false;

moveSpeed = 8;
digSpeed = room_speed;
floorSpeed = room_speed/2;
wallSpeed = room_speed*2;
image_speed = 0;