mouseX = device_mouse_x_to_gui(0);
mouseY = device_mouse_y_to_gui(0);
over = false;

myX = x;
myY = y;
if (x > room_width/2) myX = view_wview[0] - (room_width-x);
if (y > room_height/2) myY = view_hview[0] - (room_height-y);

if (mouseX >= myX-sprite_width/2 && mouseX <= myX + sprite_width/2)
	if (mouseY >= myY - sprite_width/2 && mouseY <= myY + sprite_height/2) {
		global.mouse_over_ui = true;
		over = true;
	}
	