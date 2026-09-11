buttonfunction = function () {
    global.playerhead = irandom_range(0,(sprite_get_number(spr_playerhead)/2)-1)
    global.playerbody = irandom_range(0,(sprite_get_number(spr_playerbody)/2)-1)
    global.playerpants = irandom_range(0,(sprite_get_number(spr_playerpants)/4)-1)
    
	custom_save()

}