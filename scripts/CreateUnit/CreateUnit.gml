var xx = argument0;
var yy = argument1;
var obj = argument2;

var instance = instance_create_layer(WorldX(xx, yy), WorldY(xx, yy), objControl.layerUnits, obj);
return instance;