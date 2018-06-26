var mouseX = device_mouse_x_to_gui(0);
var mouseY = device_mouse_y_to_gui(0);
over = false;

if (mouseX >= bbox_left && mouseX <= bbox_right)
	if (mouseY >= bbox_top && mouseY <= bbox_bottom) {
		global.mouse_over_ui = true;
		over = true;
	}