// Alarm 0 Event of the Object Responsible for Bullet Spawning

// Spawn bullets example
instance_create_depth(x, y,0, obj_bullet_vertical); // Create a bullet object at the current position
alarm[0] = room_speed * 1; // Set alarm to spawn the next bullet after 1 second
