
var yy = UnworldY(argument0, argument1);

var offset = 0;
if (yy mod 2 != 0) {
	offset += objMap.tileWidth;
}
var xx = floor(argument0 / (objMap.tileWidth*2));
return xx;

//var offset = 0;
//if (argument1 mod 2 != 0) {
//	offset = objMap.tileWidth;	
//}
//return argument0 * objMap.tileWidth*2 + offset;