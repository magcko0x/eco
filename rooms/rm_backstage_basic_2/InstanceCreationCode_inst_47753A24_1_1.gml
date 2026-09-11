var grid_height = array_length(global.backstage);
var grid_width = array_length(global.backstage[0]);

enID = 0

if global.backstagex != grid_width - 1 {

	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagex += 1
	}

	target_rm = global.backstage[global.backstagey][global.backstagex + 1]
	
} else {
	
	transitioncode = function() {
		var grid_height = array_length(global.backstage);
		var grid_width = array_length(global.backstage[0]);
		global.backstagex = 0
	}

	target_rm = global.backstage[global.backstagey][0]	
}