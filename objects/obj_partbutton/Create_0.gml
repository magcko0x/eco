buttonfunction = function () {
    audio_play_sound(snd_swap,0,false,2,0,random_range(0.7,1.2))
    
    switch (type) {
        case 0:
            global.playerhead = partid
            
			custom_save()
            
        break;
    
        case 1:
            global.playerbody = partid
            
			custom_save()
			
        break;
    
        case 2:
            global.playerpants = partid
            
			custom_save()
        break; 
    }
}

cursor = 1

color = c_white