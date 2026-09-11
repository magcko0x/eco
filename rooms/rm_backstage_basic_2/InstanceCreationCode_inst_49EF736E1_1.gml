var grid_height = array_length(global.backstage);
var grid_width = array_length(global.backstage[0]);

enID = 2

if global.backstagey != grid_height - 1 {

	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagey += 1
	}

	target_rm = global.backstage[global.backstagey + 1][global.backstagex]
	
} else {
	
	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagey = 0
	}

	target_rm = global.backstage[0][global.backstagex]	
}