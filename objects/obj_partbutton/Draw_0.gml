draw_self()

switch (type) {
    case 0:
        draw_sprite_ext(spr_playerhead,partid * 2, x + 16,y + 46,image_xscale,image_yscale,image_angle,color,image_alpha)
    break;
    
    case 1:
        draw_sprite_ext(spr_playerbody,partid * 2, x + 16,y + 24,image_xscale,image_yscale,image_angle,color,image_alpha)
    break;

    case 2:
        draw_sprite_ext(spr_playerpants,partid * 4, x + 16,y + 8,image_xscale,image_yscale,image_angle,color,image_alpha)
    break; 
}