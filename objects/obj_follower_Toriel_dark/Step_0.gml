if obj_mainchara.can_move{
x =	obj_mainchara.pos_x[record];
y = obj_mainchara.pos_y[record];

}



if obj_mainchara.can_move == false
{image_index = 0}
if x = xprevious and y = yprevious
{image_index = 0}

if obj_mainchara.y < y 
{depth = (obj_mainchara.depth - obj_mainchara.depth) - 2 }
else 
if obj_mainchara.y = y 
{depth = obj_mainchara.depth + 1}
else
if obj_mainchara.y > y 
{depth = obj_mainchara.depth + 3}


if instance_exists(obj_slide)
{if obj_slide.interacted == true and sliding == false and y > obj_slide.y {sliding = false}}
else
{sliding = false}


