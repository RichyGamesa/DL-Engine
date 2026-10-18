/// @description Find the index of a global.value in an array
/// @param array The array to search
/// @param global.value The global.value to find
/// @returns The index of the global.value in the array, or -1 if not found
function scr_array_find_index(argument0,argument1) 
{
var array = argument0;
 global.value = argument1;

for (var i = 0; i < array_length(array); i++) {
    if (array[i] == global.value) {
        return i;
    }
}
return -1;
}