function remap_key(global_var_name)
{
  if selected_color = c_red
  {
    var key_code = -1;  // Initialize with an invalid key code

    // Detect alphabetic key presses (A-Z)
    for (var i = 65; i <= 90; i++) 
    {
        if (keyboard_check_pressed(i)) 
        {
            key_code = i;
            break;  // Exit the loop once a key is detected
        }
    }
    
    // Detect directional key presses
    if (key_code == -1)
    {
        if (keyboard_check_pressed(vk_up)) key_code = vk_up;
        else if (keyboard_check_pressed(vk_down)) key_code = vk_down;
        else if (keyboard_check_pressed(vk_left)) key_code = vk_left;
        else if (keyboard_check_pressed(vk_right)) key_code = vk_right;
    }

    // If a valid key was detected, remap it
    if (key_code != -1)
    {
        show_debug_message("Detected Key: " + string(key_code));
        
        // Map the detected key code to the corresponding global variable
        switch (global_var_name)
        {
            case "confirm": global.confirm = key_code; break;
            case "cancel": global.cancel = key_code; break;
            case "up": global.up = key_code; break;
            case "down": global.down = key_code; break;
            case "left": global.left = key_code; break;
            case "right": global.right = key_code; break;
            case "menu": global.menu = key_code; break;
            default: show_message("Unknown control name: " + global_var_name); return;
        }
        
        selected_color = c_aqua;
        selected_a_control = false;
    }
    else
    {
        show_message("Invalid key! Please press a directional key or a letter.");
    }
}
}