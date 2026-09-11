mylight = instance_create_depth(x,y,depth,obj_light)
mylight.radius = sprite_get_height(spr_sunnyhead)+sprite_get_height(spr_sunnypetal)

cursor = 7

mytalker = noone

spawntext = function() {
	if !instance_exists(mytalker) {
		
		var texts = tag_get_asset_ids("textdisplay",asset_object)
		
		for (var i = 0; i < array_length(texts);i++) {
			instance_destroy(texts[i])
		}
		
		if randomtext {
			get_message()	
		}
		
		mytalker = instance_create_depth(x,y + sprite_get_height(spr_sunnypetal),depth,obj_sunflowertalker)
		mytalker.creator = self
		mytalker.text = textlist[text]
		mytalker.restart = restart
	}	
}

if !randomtext {
	deac = true
	get_death_message()
} else {
	deac = false
	get_message()
}

timer = 0

text = 0

talkedto = false

mytalker = noone

petalamount = 16

mouthframe = 0

prevstartframe = 0

angleadd = 0

shakesound = snd_A

eyesprite = spr_sunnyeye
mouthsprite = spr_sunnymouth

expression = "default"

mouthgroup = [
	["A","E","H","I","L","Y"],
	["C","D","F","G","J","K","N","Q","R","S","T","V","X","Z"],
	["B","M","P",".",",","'","?"],
	["O","U","W"]
]