//obj_damage_popup step event
y -= rise_speed;

life--;

if (life <= 0)
{
    instance_destroy();
}