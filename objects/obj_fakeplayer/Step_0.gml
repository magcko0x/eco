setdepth()

if place_meeting(x,y,deadlycol) {
    state = dead
}

if global.interact {
	
	var slowdown = instance_place(x,y,tag_get_asset_ids("slowdown",asset_object)) 
	
	if slowdown {
		slowdownspd = slowdown.slowdownspd	
	} else {
		slowdownspd = 0
	}	
	
	state()
    
    if keyboard_check_pressed(vk_delete) {
        state = dead
    }
    
    if instance_exists(obj_bun) {
        buncollision = collision_rectangle(0,obj_bun.y-14,room_width,obj_bun.y+40,self,false,false)
        if buncollision && !place_meeting(x,y,obj_safespot) {
            state = dead
        }
    }
    
    if point_distance(x,y,prevx,prevy) > 0{
        moving = true
    } else moving = false
	
    if direction < 45 {
        xdir = -1
    }
    
    if direction >= 45 && direction < 90{
        xdir = -1
        ydir = -1
    }
    
    if direction >= 90 && direction < 135 {
        ydir = -1
    }
    
    if direction >= 135 && direction < 180{
        xdir = 1
        ydir = -1
    }
    
    
    if direction >= 180 && direction < 225{
        xdir = 1
    }
    
    
    if direction >= 225 && direction < 270{
        xdir = 1
        ydir = 1
    }    
    
    if direction >= 270 && direction < 315{
        ydir = 1
    }      
    
    if direction >= 315{
        xdir = -1
        ydir = 1
    } 
    
    prevx = x
    prevy = y
    
    if instance_exists(mylight) {
        mylight.x = x
        mylight.y = y
    }
    
    collist = [
        obj_player,
        obj_fakeplayer
    ]
    
    var collidinginst = instance_place(x,y,collist)
    
    var me = self
    
    if place_meeting(x,y,collidinginst) {
        with collidinginst {
            move_and_collide(me.xdir * me.spd,me.ydir * me.spd,obj_collision)
        }
        
        move_and_collide(collidinginst.xdir * collidinginst.spd, collidinginst.ydir * collidinginst.spd,obj_collision)
    }
} else {
    path_end()
    moving = false
}