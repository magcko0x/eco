

var alpha = (timer/maxtimer)

var dkred = make_colour_hsv(0,255,100)

var color = merge_colour(c_black,dkred,timer/maxtimer)

var noisescale = 2
var noisesize = sprite_get_width(spr_noise) * noisescale

for (var j = 0; j < ceil(540 / noisesize); j++) {
	for (var i = 0; i < ceil(960 / noisesize); i++) {
		draw_sprite_ext(spr_noise,irandom(sprite_get_number(spr_noise)),i*noisesize,j*noisesize,noisescale,noisescale,0,color,alpha)
	}
}

if timer > 100 && place_meeting(x,y,obj_player){
	var shakex,shakey,shakestrength,size
	
	shakestrength = 4
	
	size = 2
	
	shakex = irandom_range(-shakestrength,shakestrength)
	shakey = irandom_range(-shakestrength,shakestrength)
	
	if hallucinationtimer > 0 {
		hallucinationtimer--
	} else {
		hframe = irandom(sprite_get_number(spr_mitestext)-1)
		
		var hwidth,hheight
		
		hwidth = sprite_get_width(spr_mitestext) * size
		hheight = sprite_get_height(spr_mitestext) * size
		
		hx = irandom_range(hwidth,960-hwidth)
		hy = irandom_range(hheight,540-hheight)
		
		audio_sound_pitch(closetsound,random_range(0.8,1.2))
		
		
		var range = clamp(( maxtimer div 10 ) - (timer div 10),1,9999)
		
		ha = irandom_range(-25,25)
		
		hallucinationtimer = irandom_range(range,range*2)

	}
	
	draw_sprite_ext(spr_mitestext,hframe,hx + shakex,hy + shakey,size,size,ha,c_white,1)
}