var watering = (DRAGGED && !returning && image_angle <= -44)


setdepth(30 * watering)

if watering {
	draw_sprite(spr_water,(current_time / 100) mod 3,x + 30,y + 24)
	audio_emitter_gain(emitter,1)
} else {
	audio_emitter_gain(emitter,0)
}

if !deac
	draw_selected()
draw_self()