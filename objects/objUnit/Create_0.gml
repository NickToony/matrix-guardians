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
	WALL,
	CHARGE
}

path = noone;
//pathIndex = 0;
alarm[0] = room_speed
alarm[1] = room_speed;
state = STATE.IDLE;
task = TASK.IDLE;
taskX = noone;
taskY = noone;
taskProgress = 0;
gateway = false;

moveSpeed = 8;
crawlSpeed = 4;
taskTime = 0;
image_speed = 0;

totalEnergy = 20;
energy = totalEnergy;
chargeTime = room_speed*10;
chargeSpeed = 0.5;