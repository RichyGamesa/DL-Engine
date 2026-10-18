//create event
if instance_number(self) > 1
{instance_destroy()}
members_when = global.num_active_members; //the number of active members when it was created
record = 40
xspd = 0;
yspd = 0;
depth = 2 + members_when;
sliding = false;
down_y = 0;
blushtimer_start = false;

