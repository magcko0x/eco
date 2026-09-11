owner = noone

goaway = false
lerper = 0
harmless = true
iframe = 80
flicker_timer = 0
flicker_speed = 1
reverse = false
xlerper = 0
ambsfx = audio_play_sound_at(snd_tendril_ambience,x,y,0,200,400,1,false,0,1,random(0.2))

bannedcol = [
	obj_tendril,
	obj_key,
	obj_door,
    obj_bun
]

var solids = tag_get_asset_ids("solid",asset_object)

for (var i = 0; i < array_length(solids); i++) {
	bannedcol[array_length(bannedcol)] = solids[i]	
}

alarm[0] = 5

save_entity_to_cafeteria("tendril")