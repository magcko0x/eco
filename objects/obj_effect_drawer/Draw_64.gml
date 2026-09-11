
for (var i = 0; i < MAXEFFECTS; i+= 1) {
	
	if effects[i] != -1 {
		var xx = 0
		var yy = i * 36
	
		var ind,maxt,t,totalt
	
		ind = effects[i].index
		maxt = effects[i].maxtime
		t = effects[i].efftimer
	
		totalt = t/maxt
		
		draw_sprite_ext(spr_effect,ind,xx,yy,1,1,0,c_gray,1)
		draw_sprite_part(spr_effect,ind,0,0,32 * totalt,32,xx,yy)
	}
	
}