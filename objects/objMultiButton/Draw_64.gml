/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (icon != noone) {
	draw_sprite(active ? activeIcon : icon, 0, x, y-10);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_font(fntIcon);
	draw_text(x, y + 18, active ? activeText : text);
}