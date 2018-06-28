/// @description Create

// Inherit the parent event
event_inherited();

image_xscale = 1 / 4;
image_yscale = 1 / 4;

myTasks = ds_list_create();
ds_list_add(myTasks, TASK.DIG);
ds_list_add(myTasks, TASK.FLOOR);
ds_list_add(myTasks, TASK.PICKUP);
alarm[2] = room_speed * (10 + irandom(10));
ds_list_shuffle(myTasks);

damage = 0;
maxHealth = 50;
myHealth = 50;