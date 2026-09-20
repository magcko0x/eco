deac = false

layer_create(depth,"Particles")
psystem = part_system_create_layer("Particles",false)

mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = ( sprite_height + sprite_width ) /2
cursor = 7
mytalker = noone


textlist = [
	[
		"FUCK YOU.",
		"I HATE YOU.",
		"ADADUAHODANDIJJAIUOHDIOBAJUOH0D9IJOAJD BIHJAJOUDIHAJDUOIHJADJBIUOAHJPDJAO"
	],
	
	[
		"OKAY."
	],
	
	[
		"..."
	],
]
text = 0

speechsound = snd_rot_talk

spawntext = function() {
	if !instance_exists(mytalker) {
		
		var texts = tag_get_asset_ids("textdisplay",asset_object)
		
		for (var i = 0; i < array_length(texts);i++) {
			instance_destroy(texts[i])
		}
		mytalker = instance_create_depth(x,y,depth,obj_NPCtalker)
		mytalker.creator = self
		mytalker.text = textlist[text]
		mytalker.speechsound = speechsound
	}	
}

depthoffset = 0