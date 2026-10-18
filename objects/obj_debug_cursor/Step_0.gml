//obj_debug_cursor Step event
// Update cursor position to follow the mouse
x = mouse_x;
y = mouse_y;

// Initialize the global variable if it doesn't exist
if (!variable_global_exists("dragged_instance")) {
    global.dragged_instance = noone;
}

// Check if the left mouse button is pressed
if (mouse_check_button_pressed(mb_left)) {
    // Find the nearest object to the cursor's position
    var _nearest_instance = instance_nearest(x, y, all);

    // Check if an instance was found
    if (_nearest_instance != noone) {
        // Store the found instance in a variable to be dragged
        global.dragged_instance = _nearest_instance;
    }
}

// If the left mouse button is held down and an instance is being dragged
if (mouse_check_button(mb_left) && global.dragged_instance != noone) {
    // Update the position of the dragged instance to follow the cursor
    global.dragged_instance.x = mouse_x;
    global.dragged_instance.y = mouse_y;
}

// When the left mouse button is released, stop dragging
if (mouse_check_button_released(mb_left)) {
    global.dragged_instance = noone;
}
