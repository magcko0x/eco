draw_set_alpha(darkness)
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false); // Draw a solid background

if (!surface_exists(global.lightsoutsurface)) {
	global.lightsoutsurface = surface_create(room_width, room_height);
}

surface_set_target(global.lightsoutsurface);


draw_clear_alpha(c_black, 0); // Clear with transparent black
 
// Draw the area you want to be visible
draw_set_color(c_black);
draw_set_alpha(darkness*2)
draw_rectangle(0, 0, room_width, room_height, false); // Draw a solid background

for (var i = 0; i < instance_number(obj_myxo); i++) {
	
	var myxo = instance_find(obj_myxo,i)
	
	draw_sprite(spr_myxooutline,myxo.image_index,myxo.x,myxo.y)

}

// Now, draw the "inverse circle" using blending

gpu_set_blendmode(bm_subtract); // Subtract from the existing surface

for (var i = 0; i < instance_number(obj_light); i++) {
	
	var light = instance_find(obj_light,i)
	
	draw_circle(light.x, light.y, light.radius, false);

}

gpu_set_blendmode(bm_normal); // Reset blend mode

draw_set_alpha(1)


surface_reset_target();

// Draw the resulting surface to the screen
draw_surface(global.lightsoutsurface, 0, 0);
