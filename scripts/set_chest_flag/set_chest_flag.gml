// Script: set_chest_flag
function set_chest_flag(argument0) 
{
    // Find the flag index for this chest
    var flag_index = argument0 % 500; // Ensure this matches your flag assignment logic

    // Set the corresponding flag to true
    global.flag[flag_index] = true;
}
