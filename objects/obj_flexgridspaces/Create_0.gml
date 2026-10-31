mytype = 0
mypage = 0

var root_node = layer_get_flexpanel_node("menu_backstagemap");
var panel_parts = flexpanel_node_get_child(root_node, "panel_parts");

var grid_height = array_length(global.backstage);
var grid_width = 0;
if grid_height > 0
	grid_width = array_length(global.backstage[0]);

var new_width = grid_width * 8;
var new_height = grid_height * 8;

flexpanel_node_style_set_width(panel_parts, new_width, flexpanel_unit.point);
flexpanel_node_style_set_height(panel_parts, new_height, flexpanel_unit.point);

flexpanel_node_style_set_justify_content(panel_parts, flexpanel_justify.center);
flexpanel_node_style_set_align_items(panel_parts, flexpanel_align.center);

function create_map() {
	var grid_height = array_length(global.backstage);
	if grid_height == 0 return
	var grid_width = array_length(global.backstage[0]); 
	
	var maxitems = grid_height * grid_width;
	
	var root_node = layer_get_flexpanel_node("menu_backstagemap");
	var panel_parts = flexpanel_node_get_child(root_node, "panel_parts");
	
	for (var i = 0; i < maxitems; i++) {
		
		var buttonvars = {
			"stagex" : i % grid_width,
			"stagey" : i div grid_width,
		};
		
		var buttonstruct = {
			type: "Instance",
			instanceObjectIndex: obj_mapgridtile,
			instanceColour: -1,
			instanceVariables: buttonvars,
		};
		
		var panel_button = {
			width: 8,
			height: 8,
			layerElements: [buttonstruct],
		};
		
		var button_node = flexpanel_create_node(panel_button);
		
		flexpanel_node_insert_child(panel_parts, button_node, i);
	}
	
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();
	flexpanel_calculate_layout(root_node, gui_w, gui_h, flexpanel_direction.LTR);
}

alarm[0] = 60