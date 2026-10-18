// Step Event of Bullet Object

// Movement Variables
speed = 4;
direction = 270; // Adjust this angle for different movement patterns

// Move the bullet
motion_set(direction, speed);

// Check if bullet is out of bounds
if (x < -sprite_width / 2 || x > room_width + sprite_width / 2 || y < -sprite_height / 2 || y > room_height + sprite_height / 2) {
    instance_destroy(); // Destroy the bullet if it's out of bounds
}

if place_meeting(x, y, obj_soul) {
    // Set a variable in the soul object to indicate it was hit
    obj_soul.hit_by_bullet = true;
    
    audio_play_sound(snd_hurt, 2, false);
    
        damage_bullet(40)
 
 draw_set_font(fnt_dt_mono);
 alarm[0] = 0;
    
    // Destroy the bullet object
    instance_destroy();
}
