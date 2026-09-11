mylight.x = x

image_alpha -= 0.01
mylight.radius = clamp(32 * image_alpha,0,32)

setdepth()

if instance_exists(mylight) {
    if sprite_index = spr_playerhead {
        mylight.y = y - 32
    }
    
    if sprite_index = spr_playerbody {
        mylight.y = y - 16
    }
    
    if sprite_index = spr_playerpants {
        mylight.y = y
    }
}

if yspd < 10 && y < floory{
    yspd += grav
}

if y >= floory {
    
    if !crashsoundplayed {
        crashsoundplayed = true
		audio_play_sound_at(snd_step,x,y,0,200,300,1,false,0,1,0,random_range(0.5,0.7))
    }
    yspd = -yspd * 0.6
}

if image_alpha = 0 {
    instance_destroy()
    audio_stop_sound(crashsound)
    instance_destroy(mylight)
}

if xspd > 0 {
    xspd -= 0.5
}

if xspd < 0 {
    xspd = -xspd * 0.6
}

move_and_collide(xspd * xdir,yspd,obj_collision)