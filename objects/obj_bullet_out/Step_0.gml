if place_meeting(x, y, obj_mainchara) {
    if instance_exists(obj_kris_target) == true
	{
        if obj_kris_target.image_alpha != 0 {
            obj_kris_target.image_alpha = clamp(obj_kris_target.image_alpha - 0.01, 0, 1); //make the object fade out.
            global.bulletzone = false;
            instance_destroy(obj_kris_target);
            instance_destroy(); // Destroy the current instance
		}
    }
    if instance_exists(obj_soul)
	{
		instance_destroy(obj_soul)	
	}
}
