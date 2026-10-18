
if (place_meeting(x, y, mainchara) and mainchara.can_move and ( needed_sprite == "everysprite" or  mainchara.sprite_index == needed_sprite)) or start
{
	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)) or start
	{
		if q == 0
		{
          if instance_exists(obj_follower_asgore)
		  {
			obj_follower_asgore.follow = false;
			obj_follower_asgore.cutscene = true
			obj_follower_asgore.image_speed = 1;
			obj_follower_asgore.sprite_index = spr_asgoreU;
			obj_follower_asgore.vspeed = -2
			obj_mainchara.sprite_index = KrisR;
			q = 1;
		  }
		  
		}
	}
}

if q == 1
{
if !instance_exists(oTextbox_light)
{
instance_create_depth(x,y,-300,oTextbox_light)
oTextbox_light.text[0] = "*Kris!"
oTextbox_light.text[1] = "*Did you..."
oTextbox_light.text[2] = "*Nevermind."
oTextbox_light.text[3] = "*I have somethin to tell you."
oTextbox_light.text[4] = "*I did some research for the code"
oTextbox_light.text[5] = "*Your father worked as chief of police."
oTextbox_light.text[6] = "*He was also with us in the Mayor's house, so he might also know her code."
oTextbox_light.text[7] = "*C'mon let's go."

oTextbox_light.txtb_sounds = snd_txtsus

oTextbox_light.speaker_sprite[0] = spr_face_s_enthusiast
oTextbox_light.speaker_sprite[1] = spr_face_s_careful
oTextbox_light.speaker_sprite[2] = spr_face_s_depressed
oTextbox_light.speaker_sprite[3] = spr_face_s_proud
oTextbox_light.speaker_sprite[4] = spr_face_s_happy
oTextbox_light.speaker_sprite[5] = spr_face_s_happy
oTextbox_light.speaker_sprite[6] = spr_face_s_happy
oTextbox_light.speaker_sprite[7] = spr_face_s_happy


obj_mainchara.sprite_index = KrisR;
q = 2
}
}

if q == 2
{
if !instance_exists(obj_follower_susie)
{
instance_create_depth(mainchara.x + 300,mainchara.y,0,obj_follower_susie)
obj_follower_susie.sprite_index = spr_suzyL
obj_follower_susie.hspeed = -3
obj_follower_susie.cutscene = true;
obj_follower_susie.image_speed = 1;
obj_follower_susie.follow = false;
global.flag[10] = true;
}
else
{
if obj_follower_susie.x < mainchara.x + 30
{
obj_follower_susie.hspeed = 0;
obj_follower_susie.image_speed = 0;
obj_follower_susie.image_index = 0;
q = 3
}
}
}


if q = 3
{
if instance_exists(obj_follower_asgore)
if obj_follower_asgore.y < -10
instance_destroy(obj_follower_asgore)

if !instance_exists(oTextbox_light)
{
q = 4
for (var i = 0; i <= 30; i++) 
{
obj_mainchara.pos_x[i] = obj_follower_susie.x
obj_mainchara.pos_y[i] = obj_follower_susie.y
}
obj_follower_susie.follow = true
obj_follower_susie.cutscene = false;

instance_destroy()
}
}
