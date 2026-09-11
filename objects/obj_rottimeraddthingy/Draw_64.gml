ascensionamount += 0.5
ascension += ascensionamount
alpha -= 0.05

if alpha <= 0 {
	instance_destroy()
}

draw_sprite_ext(spr_rotalarmnumberadds,variant,view_wport[0],view_hport[0] + 170 - 32 - ascension,1,1,0,c_white,alpha)
