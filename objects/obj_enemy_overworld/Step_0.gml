//obj_enemy step event
var player = instance_nearest(x, y, obj_mainchara);

// Check if the player is within detection radius
if (player != noone) {
    var distance_to_player = point_distance(x, y, player.x, player.y);
    
    if (distance_to_player <= detection_radius) {
        chasing_player = true;
    }
}

// Movement logic
var move_x = 0;
var move_y = 0;

if (chasing_player) {
    var angle = point_direction(x, y, player.x, player.y);
    move_x = lengthdir_x(move_speed, angle);
    move_y = lengthdir_y(move_speed, angle);
} else {
    move_x = lengthdir_x(move_speed, normal_direction);
    move_y = lengthdir_y(move_speed, normal_direction);
    
    // Change direction randomly
    if (irandom(100) < 5) {
        normal_direction = choose(0, 90, 180, 270);
    }
}

// Check for wall collision and adjust movement
if (place_meeting(x + move_x, y, oWall) || place_meeting(x + move_x, y, obj_stop_enemy)) {
    normal_direction = choose(0, 90, 180, 270);
} else {
    x += move_x;
}

if (place_meeting(x, y + move_y, oWall) || place_meeting(x, y + move_y, obj_stop_enemy)) {
    normal_direction = choose(0, 90, 180, 270);
} else {
    y += move_y;
}

// Check for collision with player
if (place_meeting(x, y, obj_mainchara))
{
    // Transition to battle scene
    instance_create_layer(x, y, "battle", obj_battle_transition);
}

show_debug_message("HP = " + string(hp))