function conflicting_keys(argument0) 
{
    var new_key;
    var current_key;

    // Determine the currently selected key and the new key to be assigned
    switch(argument0) 
    {
        case "down":
            new_key = obj_remapkey.key;
            current_key = global.down;
            break;
        case "right":
            new_key = obj_remapkey.key;
            current_key = global.right;
            break;
        case "up":
            new_key = obj_remapkey.key;
            current_key = global.up;
            break;
        case "left":
            new_key = obj_remapkey.key;
            current_key = global.left;
            break;
        case "confirm":
            new_key = obj_remapkey.key;
            current_key = global.confirm;
            break;
        case "cancel":
            new_key = obj_remapkey.key;
            current_key = global.cancel;
            break;
        case "menu":
            new_key = obj_remapkey.key;
            current_key = global.menu;
            break;
    }

    // Check for conflicts and swap if needed
    if (new_key == global.down && argument0 != "down")
    {
        global.down = current_key;
    } 
    else if (new_key == global.right && argument0 != "right") 
    {
        global.right = current_key;
    } 
    else if (new_key == global.up && argument0 != "up")
    {
        global.up = current_key;
    } 
    else if (new_key == global.left && argument0 != "left")
    {
        global.left = current_key;
    } 
    else if (new_key == global.confirm && argument0 != "confirm")
    {
        global.confirm = current_key;
    } 
    else if (new_key == global.cancel && argument0 != "cancel")
    {
        global.cancel = current_key;
    } 
    else if (new_key == global.menu && argument0 != "menu") 
    {
        global.menu = current_key;
    }

    // Assign the new key to the current control
    switch(argument0) 
    {
        case "down":
            global.down = new_key;
            break;
        case "right":
            global.right = new_key;
            break;
        case "up":
            global.up = new_key;
            break;
        case "left":
            global.left = new_key;
            break;
        case "confirm":
            global.confirm = new_key;
            break;
        case "cancel":
            global.cancel = new_key;
            break;
        case "menu":
            global.menu = new_key;
            break;
    }
}
