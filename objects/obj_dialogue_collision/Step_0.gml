x = obj_mainchara.x
y = obj_mainchara.y

if global.darkworld == false
{
	image_xscale = 1;
	image_yscale = 1;
if obj_mainchara.sprite_index == KrisD || obj_mainchara.sprite_index == KrisU
{
	
	object_set_mask(obj_dialogue_collision,KrisD);
	
}
	
	if obj_mainchara.sprite_index == KrisL 
	{
		
	 object_set_mask(obj_dialogue_collision,KrisL_collision);
	}
	
	if obj_mainchara.sprite_index == KrisR 
	{
		
	 object_set_mask(obj_dialogue_collision,KrisR_collision);
	}
	
}
else
{
	image_xscale = 2;
	image_yscale = 2;
	if obj_mainchara.sprite_index == KrisD_dark || obj_mainchara.sprite_index == KrisU_dark
{
	
	object_set_mask(obj_dialogue_collision,KrisD_dark_collision);
	
}
	
	if obj_mainchara.sprite_index == KrisL 
	{
		
	 object_set_mask(obj_dialogue_collision,KrisL_dark_collision);
	}
	
	if obj_mainchara.sprite_index == KrisR 
	{
		
	 object_set_mask(obj_dialogue_collision,KrisR_dark_collision);
	}
	
	
}

