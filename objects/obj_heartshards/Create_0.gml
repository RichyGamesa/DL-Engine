// Create event of obj_soul_fragment
speed = irandom_range(2, 5); // Randomize speed
direction = irandom(360); // Randomize initial direction
rotation_speed = irandom_range(-5, 5); // Randomize rotation speed
rotation_direction = choose(-1, 1); // Randomize rotation direction


x = 304; //the x of the fragment
y = 304 //the y of the fragment

obj_soul_break.i += 1; // Increment i when creating a fragment