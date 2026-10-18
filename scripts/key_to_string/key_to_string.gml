function key_to_string(argument0) 
{
var key = argument0
    switch(key) 
	{
        case vk_up: return "Up";
        case vk_down: return "Down";
        case vk_left: return "Left";
        case vk_right: return "Right";
        case vk_space: return "Space";
        case vk_shift: return "Shift";
        case vk_control: return "Control";
        // Handle letters A-Z
        default:
            // If it's a key that corresponds to a letter, return the character
            if (key >= ord("A") && key <= ord("Z")) 
			{
                return chr(key);
            }
            // If it's another key, return the key code as a string
            return string(key);
    }
}
