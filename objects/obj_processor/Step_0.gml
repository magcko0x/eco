if keyboard_check(ord("R"))
	game_restart()

if keyboard_check_pressed(vk_f4) {
	
	window_set_fullscreen(!window_get_fullscreen())
	
	if window_get_fullscreen() == false {
		alarm[1] = 2
	}
}

if (keyboard_check_pressed(vk_f2)) {
	
	var folder = "Screenshots/"
	last_screenshot = folder + "Capture_" + string(current_time) + ".png"
	var html_file = "open_folder.html"

	var scale = 4
	var app_w = surface_get_width(application_surface)
	var app_h = surface_get_height(application_surface)
	var snap_surf = surface_create(app_w * scale, app_h * scale)
	
	surface_set_target(snap_surf)
	draw_clear_alpha(c_black, 0)
	gpu_set_tex_filter(false)
	draw_surface_stretched(application_surface, 0, 0, app_w * scale, app_h * scale)
	surface_reset_target()
	
	screen_save(last_screenshot)
	
	var r = 0, g = 0, b = 0
	if (surface_exists(application_surface)) {
		var surf = surface_create(1, 1)
		surface_set_target(surf)
		gpu_set_blendenable(false)
		draw_surface_stretched(application_surface, 0, 0, 1, 1)
		gpu_set_blendenable(true)
		surface_reset_target()
		
		var avg_pixel = surface_getpixel(surf, 0, 0)
		surface_free(surf) 
		
		r = color_get_red(avg_pixel)
		g = color_get_green(avg_pixel)
		b = color_get_blue(avg_pixel)
	}
	var css_rgb = "rgb(" + string(r) + "," + string(g) + "," + string(b) + ")"
	
	var icon_base64 = ""
	if (file_exists("icon.png")) {
		var icon_buffer = buffer_load("icon.png")
		icon_base64 = buffer_base64_encode(icon_buffer, 0, buffer_get_size(icon_buffer))
		buffer_delete(icon_buffer)
	}
	
	var icon_data_uri = "data:image/png;base64," + icon_base64
	
	var absolute_path = string_replace_all(game_save_id + last_screenshot, "\\", "/")
	
	var file = file_text_open_write(html_file)
	
	var pagetitle = ["Your wonderful screenshot!!", "Someone found the screenshot button!!!", "Looks good, right?"]
	
	var html_code = "<html><head>" +
	"<title>Your beautiful screenshot!!</title>" + 
	"<link rel='icon' type='image/png' href='" + icon_data_uri + "'>" +
	"<style>" +
	"body { background-color: " + css_rgb + "; margin: 0; display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100vh; overflow: hidden; font-family: sans-serif; }" +
	".container { display: flex; flex-direction: column; align-items: center; text-align: center; gap: 20px; width: 90%; }" +
	"h1 { color: #ffffff; margin: 0; font-size: 24px; text-shadow: 0px 2px 8px rgba(0,0,0,0.8); }" +
	"img { width: 100%; max-width: 800px; height: auto; border: 3px solid rgba(255,255,255,0.2); box-shadow: 0px 8px 30px rgba(0,0,0,0.6); border-radius: 6px; image-rendering: pixelated; }" +
	"a { color: #4da6ff; text-decoration: underline; font-size: 18px; font-weight: bold; text-shadow: 0px 1px 4px rgba(0,0,0,0.5); cursor: pointer; }" +
	"a:hover { color: #80c1ff; }" +
	"</style></head><body>" +
	"<div class='container'>" +
	$"<h1>{pagetitle[irandom(array_length(pagetitle) - 1)]}</h1>" +
	"<img src='" + last_screenshot + "' alt='Screenshot'>" +
	"<a onclick=\"navigator.clipboard.writeText('" + absolute_path + "'); this.innerText='Path Copied!';\">Copy Image Path</a>" +
	"</div>" +
	"</body></html>"
	
	file_text_write_string(file, html_code)
	file_text_close(file)
	
	url_open(html_file)
	
	if global.canpause {
		paused = true
		update_pause()
	}
	
	alarm[3] = 400
}

if global.interact {
	#macro K_MINUS 189
	#macro K_PLUS 187
	
	if keyboard_check_pressed(K_PLUS) {
		zoomlevel = clamp(zoomlevel - 0.5, 0.5, maxzoom)
	} else if keyboard_check_pressed(K_MINUS) {
		zoomlevel = clamp(zoomlevel + 0.5, 0.5, maxzoom)
	}

	current_zoom = lerp(current_zoom, zoomlevel, 0.1)

	if zoomlevel > maxzoom {
		current_zoom = maxzoom	
	}

	var cam = view_camera[0];
	var old_w = camera_get_view_width(cam)
	var old_h = camera_get_view_height(cam)

	var new_w = 480 * current_zoom
	var new_h = 270 * current_zoom

	var new_x = camera_get_view_x(cam) - (new_w - old_w) / 2
	var new_y = camera_get_view_y(cam) - (new_h - old_h) / 2
	
	new_x = clamp(new_x, 0, room_width - new_w)
	new_y = clamp(new_y, 0, room_height - new_h)

	camera_set_view_size(cam, new_w, new_h)
	camera_set_view_pos(cam, new_x, new_y)
}


/*
if keyboard_check(vk_tab) {
	if keyboard_check(vk_up) {
		if global.musicvolume < 1 {
			global.musicvolume += 0.01
		} else if global.musicvolume > 1
			global.musicvolume = 1
	}
	
	if keyboard_check(vk_down) {
		if global.musicvolume > 0 {
			global.musicvolume -= 0.01
		} else if global.musicvolume < 0
			global.musicvolume = 0
	}
} else {
	if keyboard_check(vk_up) {
		if global.sfxvolume < 1 {
			global.sfxvolume += 0.01
		} else if global.sfxvolume > 1
			global.sfxvolume = 1
	}
	
	if keyboard_check(vk_down) {
		if global.sfxvolume > 0 {
			global.sfxvolume -= 0.01
		} else if global.sfxvolume < 0
			global.sfxvolume = 0
			
	}
}
*/

if global.canpause {
	if keyboard_check_pressed(vk_escape) && global.interact{
		paused = !paused
    
		if paused { 
			audio_pause_all()
		} else { 
			audio_resume_all()
		}
    
	    alarm[2] = 1
	}
}

var soundvol = global.sfxvolume * global.mastervolume
var musicvol = global.musicvolume * global.mastervolume

audio_group_set_gain(audiogroup_default,soundvol)
audio_group_set_gain(audiogroup_music,musicvol)


//debug
if debug_mode {
    if room != rm_elevator && room != rm_lobby_elevator{
        if keyboard_check_pressed(vk_up) {
            room = global.rooms[global.currentroom+1]
            global.currentroom += 1
        }
        
        if keyboard_check_pressed(vk_down) {
            room = global.rooms[global.currentroom-1]
            global.currentroom -= 1
        }
    } else {
        if keyboard_check_pressed(vk_up) {
            global.floor += 1
        }
        
        if keyboard_check_pressed(vk_down) {
            global.floor -= 1
        }
    }
    
    if keyboard_check_pressed(vk_end) {
        room = global.rooms[100]
        global.currentroom = 100
    }
}