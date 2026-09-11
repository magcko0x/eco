switch obj_flexparts.mytype { 
    case 0:
        maxpages = ( sprite_get_number(spr_playerhead)/2 - 1 ) div obj_flexparts.mymaxitems
    break;

    case 1:
        maxpages = ( sprite_get_number(spr_playerbody)/2 - 1) div obj_flexparts.mymaxitems
    break; 

    case 2:
        maxpages = ( sprite_get_number(spr_playerpants)/4 - 1) div obj_flexparts.mymaxitems
    break;  
}

if type = 0 {
    if obj_flexparts.mypage + 1 > maxpages {
        deac = true
    } else deac = false
} else {
    if obj_flexparts.mypage - 1 < 0 {
        deac = true
    } else deac = false
}

if deac {
    image_index = 0
    image_alpha = 0.5
    cursor = 0
} else {
    cursor = 1
    image_alpha = 1
}