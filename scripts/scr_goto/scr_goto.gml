function scr_goto(argument0, argument1, argument2, argument3) {
    x = argument0;
    y = argument1;
    var go_x = argument2;
    var go_y = argument3;

    if (x != go_x) {
        if (abs(go_x - x) > 1) {
            if (go_x < x) {
                x -= 1;
            } else {
                x += 1;
            }
        } else {
            x = go_x;
        }
    }

    if (y != go_y) {
        if (abs(go_y - y) > 1) {
            if (go_y < y) {
                y -= 1;
            } else {
                y += 1;
            }
        } else {
            y = go_y;
        }
    }

// Define a steering force to avoid obstacles
var avoidance_force = 0.5;

// Check for collisions with obstacles
if (place_meeting(x + xspd, y, oCollision)) or (place_meeting(x + xspd, y, oWall))  {
    // If there's a collision, adjust xspd to avoid the obstacle
    xspd += avoidance_force; // Increase xspd to move away from the obstacle
}

if (place_meeting(x, y + yspd, oCollision)) or (place_meeting(x, y + yspd, oWall)) {
{
    // If there's a collision, adjust yspd to avoid the obstacle
    yspd += avoidance_force; // Increase yspd to move away from the obstacle
}




}
}