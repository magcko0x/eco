instance_destroy(mylight)
instance_destroy(mypointer)
part_particles_burst(psystem,x,y,part_burst)
part_system_depth(psystem,depth)
audio_play_sound_at(snd_burst,x,y,0,100,300,2,false,0,1,0,random_range(0.8,1.2))

var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])


var cam_right = cam_x + cam_w
var cam_bottom = cam_y + cam_h


if rectangle_in_rectangle(bbox_left, bbox_top, bbox_right,bbox_bottom, cam_x, cam_y, cam_right, cam_bottom) { 
	instance_create_depth(x,y,depth,obj_flash)
}