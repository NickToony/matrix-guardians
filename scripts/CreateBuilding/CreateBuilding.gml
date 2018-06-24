var xx = argument0;
var yy = argument1;
var obj = argument2;

var instance = instance_create_layer(0, 0, objControl.layerBuildings, obj);
yy += round(instance.height/2);
//xx -= round(instance.width/2);
instance.x = WorldX(xx, yy);
instance.y = WorldY(xx, yy) - 10;
instance.depthOverride = true;
return instance;