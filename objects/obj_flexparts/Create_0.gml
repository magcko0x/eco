mytype = 0
mypage = 0
mymaxitems = 88

function create_character_panels(type,page) {
    
    mytype = type
    mypage = page
    
        
    var maxitems = mymaxitems
    
    var sprite
    
    switch (type) {
    	case 0:
            sprite = (sprite_get_number(spr_playerhead)/2)
        break; 
    
        case 1:
            sprite = (sprite_get_number(spr_playerbody)/2)
        break;
    
        case 2:
            sprite = (sprite_get_number(spr_playerpants)/4)
        break;
    }
    
    var root_node = layer_get_flexpanel_node("menu_wardrobifier");
        
    var panel_parts = flexpanel_node_get_child(root_node,"panel_parts")
    
    for (var i = page * maxitems; i < clamp(sprite,( page * maxitems ),( (page + 1) * maxitems )); i++) {
        
        var buttonvars = {
            "type" : type,
            "partid" : i,
        }
        
        var buttonstruct = {
            type: "Instance",
            instanceObjectIndex: obj_partbutton,
            instanceColour: -1,
            instanceVariables: buttonvars,
        };
        
        var panel_button = {
            width: 32,
            height: 32,
            layerElements: [buttonstruct],
        };
        
        var button_node = flexpanel_create_node(panel_button);
        
        flexpanel_node_insert_child(panel_parts, button_node, clamp(i - page * maxitems,0,999999));
    }
}

function remove_character_panels() {
    var root_node = layer_get_flexpanel_node("menu_wardrobifier");
        
    var panel_parts = flexpanel_node_get_child(root_node,"panel_parts")
    
   
    for (var i = flexpanel_node_get_num_children(panel_parts) - 1; i > -1; i--) {
    
        var target_panel = flexpanel_node_get_child(panel_parts,i)
            
        flexpanel_delete_node(target_panel,true)
            
    }
}

create_character_panels(0,0)