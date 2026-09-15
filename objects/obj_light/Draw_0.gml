gpu_set_blendmode(bm_eq_add)

if instance_exists(obj_lightsout) {
    var v = (80* (radius/100))
	draw_circle_colour(x,y,radius,make_colour_hsv(hue,saturation,clamp(v,0,100)),c_black,false)
}
gpu_set_blendmode(bm_normal)