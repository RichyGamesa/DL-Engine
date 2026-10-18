if place_meeting(x,y,obj_mainchara) and obj_mainchara.can_move and !instance_exists(oTextbox_dark)
if keyboard_check(global.confirm) or keyboard_check(vk_enter)
{
keyboard_clear(vk_enter)
keyboard_clear(ord("Z"))
if (myinteract == 0) and global.flag[flag_index] = false
{
    if (close == 1)
        image_index = 0
    close = 0
	scr_sound_play(snd_locker)
}


if (image_index == 0) and global.flag[flag_index] = false
{   
   for (var i = 0; i < 5; i++)
        {
            bug[i] = instance_create_depth((x + 20), (y + 20),obj_mainchara.depth-1, obj_chest_bug)
            bug[i].direction = random(180)
            bug[i].speed = (random(2) + 4)
            bug[i].sprite_index = spr_minybug
            bug[i].depth = (depth - 1)
        }
image_index = 1
myinteract = true;
global.flag[flag_index] = true;
		
		
		
}


}


if global.flag[flag_index] = true
{
image_index = 1;	
}


//depth
if obj_mainchara.y < y - 35
{ 
depth = (obj_mainchara.depth - obj_mainchara.depth) - 3 
}
else
{
depth = obj_mainchara.depth + 3
}

