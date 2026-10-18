/// @function check_conflict(new_key, replaced_key)
/// @param {int} new_key The key being assigned
/// @param {int} replaced_key The key being swapped out

function check_conflict(new_key, replaced_key) 
{
    // Determine which control is using the new key
    if (global.down == new_key) 
	{
        global.down = replaced_key;
    }
	else if (global.right == new_key) 
	{
        global.right = replaced_key;
    } 
	else if (global.up == new_key) 
	{
        global.up = replaced_key;
    } 
	else if (global.left == new_key)
	{
        global.left = replaced_key;
    } 
	else if (global.confirm == new_key) 
	{
        global.confirm = replaced_key;
    } 
	else if (global.cancel == new_key) 
	{
        global.cancel = replaced_key;
    } 
	else if (global.menu == new_key)
	{
        global.menu = replaced_key;
    }
}
