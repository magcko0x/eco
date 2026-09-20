var sin_y = sin(current_time/1000) * 4

if bun_active {
	
	if bun_spawn_timer < 2 * 60 {
		bun_overlay_shake_strength = lerp(bun_overlay_shake_strength,2,0.3)
	} else {
		bun_overlay_shake_strength = lerp(bun_overlay_shake_strength,0,0.3)
	}
	
	bun_top_overlay_y = lerp(bun_top_overlay_y,-7 + sin_y,0.3)
	bun_bottom_overlay_y = lerp(bun_bottom_overlay_y,display_get_gui_height() + 7 - sin_y,0.3) 
} else {
	bun_overlay_shake_strength = lerp(bun_overlay_shake_strength,0,0.3)
	
	bun_top_overlay_y = lerp(bun_top_overlay_y,-61 + sin_y,0.3)
	bun_bottom_overlay_y = lerp(bun_bottom_overlay_y,display_get_gui_height() + 61 - sin_y,0.3)
}

var shake_x = random_range(-bun_overlay_shake_strength,bun_overlay_shake_strength)
var shake_y = random_range(-bun_overlay_shake_strength,bun_overlay_shake_strength)

draw_sprite_ext(spr_bun_top_jaw,0,display_get_gui_width()/2 + shake_x,bun_top_overlay_y + shake_y,3,3,0,c_white,1)
draw_sprite_ext(spr_bun_bottom_jaw,0,display_get_gui_width()/2 + shake_x,bun_bottom_overlay_y + shake_y,3,3,0,c_white,1)