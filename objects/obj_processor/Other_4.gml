// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_wport[0] = 480;
view_hport[0] = 270;

if instance_exists(obj_player) {
	view_camera[0] = camera_create_view(obj_player.x, obj_player.y, view_wport[0], view_hport[0], 0, obj_player, -1, -1, 200, 100);
} else view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0]);

var _dwidth = display_get_width();
var _dheight = display_get_height();

window_set_rectangle(window_get_x(), window_get_y(), 960, 540);

surface_resize(application_surface, 960, 540);

if instance_exists(obj_player) {
	if !instance_exists(obj_playerhandler)
		instance_create_depth(x,y,0,obj_playerhandler)	
} else if instance_exists(obj_playerhandler) {
	instance_destroy(obj_playerhandler)	
}

audio_channel_num(256);

if global.music = -1 {
	audio_stop_sound(prevmusic)
} else if !(prevmusic = global.music) {
	audio_stop_sound(prevmusic)
	global.pmusic = audio_play_sound(global.music,0,true)
}

prevmusic = global.music

audio_group_stop_all(audiogroup_default)

if room = rm_start {
	alarm[0] = 15	
}

// Base resolution
var base_w = 480;
var base_h = 270;

// Calculate the maximum scale that fits in the room
var max_w_scale = room_width / base_w;
var max_h_scale = room_height / base_h;

// The limit is the smaller of the two scales
maxzoom = min(max_w_scale, max_h_scale);