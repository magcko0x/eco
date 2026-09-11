if CLICKED {
    if mode = 0 {
        if global.floor + 1 < global.maxfloor {
            audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
            image_index = 1
            global.floor++
        } 
    } else {
        if global.floor - 1 > -2 {
            audio_play_sound_at(snd_pickup,x,y,0,100,200,1,false,0,0.5,0,2)
            image_index = 1
            global.floor--
        }
    }
} else image_index = 0