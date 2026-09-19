generate_rooms()

if !instance_exists(obj_roomhandler)
    instance_create_depth(x,y,depth,obj_roomhandler)

if !instance_exists(obj_entityhandler)
    instance_create_depth(x,y,depth,obj_entityhandler)

//instance_create_depth(x,y,depth,obj_roomlistdrawer)
alarm[0] = 15