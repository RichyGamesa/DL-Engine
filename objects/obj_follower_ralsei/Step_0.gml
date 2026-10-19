//step event
if obj_mainchara.can_move
{
	if sliding	== false
	{
x =	obj_mainchara.pos_x[record];
y = obj_mainchara.pos_y[record]-down_y;
	}
   else
   if obj_mainchara.sliding == true
   {x =	obj_mainchara.pos_x[record];y = obj_mainchara.pos_y[record]}
   else
   y += 7;
}



//sprites
if global.darkworld == true 
{
    if (x != xprevious) {
        if (x > xprevious) {
            sprite_index = spr_ralseiR;
        } else if (x < xprevious) {
            sprite_index = spr_ralseiL;
        }
    }
    if (y != yprevious) {
        if (y < yprevious) {
            sprite_index = spr_ralseiU;
        } else if (y > yprevious) {
            sprite_index = spr_ralseiD;
        }
    }
}
if global.darkworld == false
{
 image_alpha = 0;	
}

//depth
if sliding == false {
if (obj_mainchara.y < y) {
    depth = (obj_mainchara.depth - obj_mainchara.depth) - 2;
} else if (obj_mainchara.y == y) {
    depth = obj_mainchara.depth + 1;
} else if (obj_mainchara.y > y) {
    depth = obj_mainchara.depth + 1;
}

if (global.darkworld == true) {
    image_xscale = 2;
    image_yscale = 2;
}

if obj_mainchara.can_move == false
{image_index = 0}
if x = xprevious and y = yprevious
{image_index = 0}

if obj_mainchara.y < y 
{depth = (obj_mainchara.depth - obj_mainchara.depth) - 3 }
else 
if obj_mainchara.y = y 
{depth = obj_mainchara.depth + 1}
else
if obj_mainchara.y > y 
{depth = obj_mainchara.depth + 2}
}
else
{
depth = obj_mainchara.depth	 + 2;
sprite_index = spr_ralsei_slide;
	
}

if instance_exists(obj_slide)
if obj_slide.interacted == true and sliding == false and y > obj_slide.y {sliding = false}

