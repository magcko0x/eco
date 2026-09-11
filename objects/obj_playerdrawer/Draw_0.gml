var frequency,amplitude

frequency = 0.02
amplitude = 1.5

timer += frequency;

var y_offset = sin(timer) * amplitude;

var angle_offset = cos(timer) * amplitude

yoff = y_offset

angleoff = y_offset + angle_offset

draw_sprite_ext(spr_playerpants,global.playerpants * 4,x,y,image_xscale,image_yscale,0,c_white,1)
draw_sprite_ext(spr_playerbody,global.playerbody * 2,x,y,image_xscale,image_yscale,angleoff,c_white,1)
draw_sprite_ext(spr_playerhead,global.playerhead * 2,x - 8 * image_xscale,y + yoff,image_xscale,image_yscale - clamp(yoff/32,0,9999),angleoff,c_white,1)