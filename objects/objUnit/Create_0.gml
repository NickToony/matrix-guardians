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
	CHARGE,
	PICKUP,
	DROP
}

path = noone;
//pathIndex = 0;
alarm[0] = room_speed
alarm[1] = room_speed;
state = STATE.IDLE;
task = TASK.IDLE;
taskX = noone;
taskY = noone;
taskObj = noone;
taskProgress = 0;
gateway = false;

moveSpeed = 6;
crawlSpeed = 3;
taskTime = 0;
image_speed = 0;

totalEnergy = 60;
energy = totalEnergy;
chargeTime = room_speed*10;
chargeSpeed = 0.25;
metals = 0;