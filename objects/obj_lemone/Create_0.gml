mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = ( sprite_height + sprite_width ) /2
deac = false
cursor = 7
mytalker = noone
image_speed = 0

textlist = [
	[
		"/shakeFUCK YOU.",
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
		mytalker = instance_create_depth(x + 42,y - 16,depth,obj_lemonetalker)
		mytalker.creator = self
		mytalker.text = textlist[text]
		mytalker.speechsound = speechsound
	}	
}