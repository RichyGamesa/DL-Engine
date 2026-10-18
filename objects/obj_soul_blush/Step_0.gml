// Step Event of obj_soul

       if instance_exists(obj_mainchara)
	   {
		x = obj_mainchara.x+10;
		y = obj_mainchara.y+30;
	   }
		/* 
		depth = -999999999
		image_alpha = 0;
		
		**/
		
		if instance_exists(obj_follower_ralsei)
{
	if place_meeting(obj_mainchara.x+10,obj_mainchara.y+30,obj_follower_ralsei)
	{
	with (obj_follower_ralsei)
	{

	  if blushtimer_start == false
	  {
		  alarm[0] = 260
	      blushtimer_start = true	  
	  }
	
	}
	
	}
}
		

