x = obj_mainchara.x;
y = (192 - obj_mainchara.y);

// Get input
var down_key = keyboard_check(global.down);
var left_key = keyboard_check(global.left);
var right_key = keyboard_check(global.right);
var up_key = keyboard_check(global.up);

// Calculate speed based on input
var xspd = (right_key - left_key) * move_spd;
var yspd = (down_key - up_key) * move_spd;

// Handle running or walking
if obj_mainchara.can_move
{
if (keyboard_check(vk_shift) || keyboard_check(global.cancel)) 
{
    move_spd = run_spd;
} 
else
{
    move_spd = walk_spd;
}
}
else
{
move_spd = 0;	
}

// Animate character
if (obj_mainchara.can_move) 
{
    if (obj_mainchara.sprite_index != KrisD && obj_mainchara.sprite_index != KrisU) 
	{
        sprite_index = obj_mainchara.sprite_index;    
    }
	else if (obj_mainchara.sprite_index == KrisD) 
	{
        sprite_index = KrisU;    
    } 
	else if (obj_mainchara.sprite_index == KrisU) 
	{
        sprite_index = KrisD;    
    }
}



// Move character
x += xspd;
y += yspd;

// Store position history
if (x != xprevious || y != yprevious)
{
    for (var i = array_size - 1; i > 0; i--) 
	{
        pos_x[i] = pos_x[i - 1];
        pos_y[i] = pos_y[i - 1];
    }
    pos_x[0] = x;
    pos_y[0] = y;
}

// Stop movement if necessary
image_index = obj_mainchara.image_index
