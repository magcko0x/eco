setdepth()

if global.interact {
	if prevwatered != watered && watered = true {
		audio_play_sound_at(snd_water_grow,x,y,0,60,90,1,false,0,1,0,random_range(1,2))
		itemgrowing = instance_create_depth(x,y-16,depth,itemgrown)
		itemgrowing.deac = true
		itemgrowing.image_xscale = 0
		itemgrowing.image_yscale = 0
		itemgrowing.depth = depth - 1
		if itemgrowing.object_index == obj_itempickup {
			itemgrowing.item = variable_clone(get_item_definition(growingitemid))
			itemgrowing.depthoffset = 32
		}
	
		growingitem = true
	}

	if growingitem && instance_exists(itemgrowing){
		with itemgrowing {
			image_xscale = lerp(image_xscale,1,0.3)
			image_yscale = lerp(image_yscale,1,0.3)
		
			if 1 - image_xscale <= 0.1 && 1 - image_yscale <= 0.1 {
				image_xscale = 1
				image_yscale = 1
			}
		
			if image_xscale == 1 && image_yscale == 1 {
				deac = false
				other.growingitem = false
			}
		}
	}

	if !instance_exists(itemgrowing) && watered {
		sprite_index = spr_flowerpot_retreat
		image_speed = 1
		mask_index = spr_null
	}
}




prevwatered = watered