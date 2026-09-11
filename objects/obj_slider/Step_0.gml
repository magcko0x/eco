if mouse_check_button(mb_left) && place_meeting(x,y,obj_hand_UI){
    progressx = ( ( mouse_x - x ) div 32 ) * 32
    clicking = true
} else clicking = false

progressx = clamp(progressx,0,10 * 32)

sliderfunction()