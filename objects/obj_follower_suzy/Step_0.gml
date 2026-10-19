//step event

depth = -y;

if global.darkworld = false {down_y = 5}
else
{down_y = 9}
if obj_mainchara.can_move
{

x =	obj_mainchara.pos_x[record];
y = obj_mainchara.pos_y[record]-down_y;

   if obj_mainchara.sliding == true
   {x =	obj_mainchara.pos_x[record];y = obj_mainchara.pos_y[record]}
   else
   y += 7;
}




if global.darkworld == false {
    //changing sprites
    if (x != xprevious) {
        if (x > xprevious) {
            sprite_index = spr_suzyR;
        } else if (x < xprevious) {
            sprite_index = spr_suzyL;
        }
    }

    if (y != yprevious) {
        if (y < yprevious) {
            sprite_index = spr_suzyU;
        } else if (y > yprevious) {
            sprite_index = spr_suzyD;
        }
    }
down_y = 0
}
else if global.darkworld == true {
    if (x != xprevious) {
        if (x > xprevious) {
            sprite_index = spr_suzyR_dark;
        } else if (x < xprevious) {
            sprite_index = spr_suzyL_dark;
        }
    }
    if (y != yprevious) {
        if (y < yprevious) {
            sprite_index = spr_suzyU_dark;
        } else if (y > yprevious) {
            sprite_index = spr_suzyD_dark;
        }
    }
down_y = 14
}

//depth
if sliding == false {


if (global.darkworld == true) {
    image_xscale = 2;
    image_yscale = 2;
}

if obj_mainchara.can_move == false
{image_index = 0}
if x = xprevious and y = yprevious
{image_index = 0}


}
else
{

sprite_index = spr_suzy_slide

	
}
if instance_exists(obj_slide)
{if obj_slide.interacted == true and sliding == false and y > obj_slide.y {sliding = false}}
else
{sliding = false}

