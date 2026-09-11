sprite_index = owner.sprite_index

setdepth()

if owner.object_index = obj_player {
	if ydir = -1{
		draw_sprite_ext(spr_playerhead,headframe,x - 8 * xdir,y,-xdir,1,0,col,image_alpha)
		draw_sprite_ext(spr_playerpants,pantsframe,x,y,xdir,1,0,col,image_alpha)
		draw_sprite_ext(spr_playerbody,bodyframe,x,y,xdir,1,0,col,image_alpha)
	} else {
			draw_sprite_ext(spr_playerpants,pantsframe,x,y,xdir,1,0,col,image_alpha)
		draw_sprite_ext(spr_playerbody,bodyframe,x,y,xdir,1,0,col,image_alpha)
		draw_sprite_ext(spr_playerhead,headframe,x - 8 * xdir,y,xdir,1,0,col,image_alpha)
	}
} else draw_sprite_ext(owner.sprite_index,owner.image_index,x,y,owner.image_xscale,owner.image_yscale,owner.image_angle,col,image_alpha)


image_alpha -= 0.1

if image_alpha = 0
	instance_destroy()