
var message = argument0;
var type = argument1;

if (global.TUTORIALS[type]) {
	return;
}
global.TUTORIALS[type] = true;

with (objCamera) {
	ds_queue_enqueue(messages, message);	
}