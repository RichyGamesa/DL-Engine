
depth = -y;

if follow 
{
x =	obj_mainchara.pos_x[record];
y = obj_mainchara.pos_y[record] -down_y;
}


if !sliding
{
    if (x != xprevious)
	{
        if (x > xprevious) 
		{
            sprite_index = right;
        } 
		else
		if (x < xprevious)
		{
            sprite_index = left;
        }
    }

    if (y != yprevious)
	{
        if (y < yprevious)
		{
            sprite_index = up;
        }
		else if (y > yprevious) 
		{
            sprite_index = down;
        }
    }
}
else
sprite_index = slide_sprite
	
if !cutscene
{
if (x == xprevious and y == yprevious) 
{
	image_speed = 0;
	image_index = 0;
}
else
image_speed = 1
}