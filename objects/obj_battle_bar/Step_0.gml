// obj_attack_bar Step Event
bar_position -= speed; // Move the bar left

x = bar_position

// Check if the bar is out of bounds
if (x <= 0) {
    attack_power = 0 // Miss
	speed = 0;
	selected_member.image_speed = 1;
}

// Check for Z key press
if (keyboard_check_pressed(global.confirm)) or keyboard_check(vk_enter) {
    // Calculate attack power based on bar position
    var distance_to_hit_zone = abs(bar_position - hit_zone);

    // The closer to the hit zone, the higher the power
    if (distance_to_hit_zone < 50) {
        attack_power = max_power;
		global.tp += 8
    } else if (distance_to_hit_zone < 100) {
        attack_power = max_power - 2;
		global.tp += 4
    } else {
        attack_power = min_power;
		global.tp += 1
    }

 speed = 0;
 keyboard_clear(vk_enter)
 keyboard_clear(ord("Z"))
 selected_member.image_speed = 1;
}
