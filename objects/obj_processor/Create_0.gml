randomize()


global.floor = "lobby"

audio_falloff_set_model(audio_falloff_linear_distance);

global.credits = 0
global.currentroom = -1
global.fog = false
global.music = -1
global.pmusic = -1

prevmusic = -1
scroll = 0
paused = false
global.fullscreen = false
audio_group_load(audiogroup_music)

load_settings()

global.backstagex = 0;
global.backstagey = 0;
global.backstage  = [];

load_saves()

save_entities_based_on_floors()

global.nextfloor = global.unlockedfloors[0]

createbackstage(50,50);

global.inbackstage = false

var grid_height = array_length(global.backstage);
var grid_width  = array_length(global.backstage[0]);

global.room_states = array_create(grid_height);
for (var j = 0; j < grid_height; j++) {
	global.room_states[j] = array_create(grid_width, undefined);
}

zoomlevel = 1
current_zoom = zoomlevel
cameraspd = 2

global.diedto = -1
global.deathcounter[0] = 0

if !instance_exists(obj_richpresence) instance_create_depth(x,y,depth,obj_richpresence) 

update_pause = function()
{
	if paused {
		instance_deactivate_all(true)
		layer_set_visible("menu_pause",true)
	} else {
        
        ini_open("settings")
        
        ini_write_real("volume", "mastervolume", global.mastervolume)
        ini_write_real("volume", "musicvolume", global.musicvolume)
        ini_write_real("volume", "sfxvolume", global.sfxvolume)
        
        ini_close()
        
		instance_activate_all()
		layer_set_visible("menu_pause",false)
        layer_set_visible("menu_settings",false)
        layer_set_visible("menu_wardrobifier",false)
	}
}

update_pause()

maxzoom = 1

global.canpause = true
global.hideinventory = false

if !variable_global_exists("backfromdeath") {
	global.backfromdeath = false	
}