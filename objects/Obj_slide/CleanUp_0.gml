// Destroy Event

obj_mainchara.sliding = false;

if (instance_exists(obj_follower)) 
{
	for (var i= 0; i < instance_number(obj_follower); i++)
	{
	     obj_follower.sliding = false;
	}
   
}
