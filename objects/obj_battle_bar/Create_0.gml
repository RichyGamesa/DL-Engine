// obj_attack_bar Create Event
t_x = camera_get_view_x(view_camera[0])
speed = 5; // Speed of the bar moving left
depth = -300
random_position = random_range(150,170)
bar_position = t_x + random_position; // Starting position (right side of the screen)
attack_power = 0; // Initial attack power
max_power = 10; // Maximum attack power
min_power = 1; // Minimum attack powerù
hit_zone = t_x + 15; // Ideal position for max attack power
if instance_exists(obj_battle)
{
selected_member = obj_battle.selected_member
}

