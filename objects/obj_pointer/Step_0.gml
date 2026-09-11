// Get the current camera's view dimensions
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

// Calculate the right and bottom boundaries
var cam_right = cam_x + cam_w;
var cam_bottom = cam_y + cam_h;

// Use rectangle_in_rectangle to see if the object's bbox is outside

if instance_exists(owner) {
    if !(rectangle_in_rectangle(owner.bbox_left, owner.bbox_top, owner.bbox_right, owner.bbox_bottom, cam_x, cam_y, cam_right, cam_bottom)) { 
        image_alpha = 1
            
        var player
            
        player = instance_nearest(x,y,obj_player)
            
        indx = clamp(owner.x, cam_x + 16, cam_right - 16); 
        indy = clamp(owner.y, cam_y + 16, cam_bottom - 16);
        inda = point_direction(player.x, player.y, owner.x, owner.y) - 90;
        
    } else { 
        image_alpha = 0
    }
} else instance_destroy()