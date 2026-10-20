// Alarm 0 Event of the Object Responsible for Bullet Spawning

// Spawn bullets example
var _bullet = instance_create_depth(x, y, 0, obj_bullet);
_bullet.bullet_direction = bullet_direction;

alarm[0] = room_speed * 2;