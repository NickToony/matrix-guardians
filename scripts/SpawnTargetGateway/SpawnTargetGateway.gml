var yy = choose(0, 0);
var xx = choose(0, objMap.mapWidth-1);

CreateBuilding(xx, yy, objGateway, true);
ShowMessage("IT SEEMS WE'VE FOUND OUR GOAL! IF WE CAN CONNECT THIS GATEWAY, WE CAN PASS TO THE NEXT REALM. BE WARNED: BE READY FOR A FIGHT!");
MoveCameraWorld(xx, yy, false);
global.WIN_CONNECT_X = xx;
global.WIN_CONNECT_Y = yy;
