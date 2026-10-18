function add_weapon(argument0) {
	var new_weapon = argument0
	
    for (var i = 0; i < array_length(global.weapons); i++) {
        if (global.weapons[i] == " ") {
            array_insert(global.weapons,i,new_weapon)
			show_debug_message("global.weapons = " + string(global.weapons[i]))
			return
        }
    }
    
    // If no empty slot is found, you could handle it (e.g., by showing a message)
    // show_message("No empty slot available for a new weapon!");
}