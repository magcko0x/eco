var grid_height = array_length(global.backstage);
var grid_width = array_length(global.backstage[0]);

enID = 3

if global.backstagey != 0 {

	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagey -= 1
	}

	target_rm = global.backstage[global.backstagey - 1][global.backstagex]
	
} else {
	
	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagey = grid_height - 1
	}

	target_rm = global.backstage[grid_height - 1][global.backstagex]	
}