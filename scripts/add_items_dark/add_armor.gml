
function add_armor(argument0) {
	var new_armor = argument0
	
    for (var i = 0; i < array_length(global.armors); i++) {
        if (global.armors[i] == " ") {
            global.armors[i] = new_armor;
            return;
        }
    }
    
    // If no empty slot is found, you could handle it (e.g., by showing a message)
    // show_message("No empty slot available for a new armor!");
}
