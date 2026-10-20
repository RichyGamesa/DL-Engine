// Create Event of Object Responsible for Bullet Spawning

// Set the initial alarm
alarm[0] = room_speed * 2; // Spawn the first bullet after 2 seconds
bullet_direction = 0; //direction of the bullet

/*
For a vertical bullet travelling downward, use 270 instead. 

GameMaker's direction angles are 
0° right, 
90° up,
180° left, 
and 270° down.
*/