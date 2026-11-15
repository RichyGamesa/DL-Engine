if variable_global_exists("checkpoint_pending")
if (global.checkpoint_pending) //if you are loading from death
{
    x = global.checkpoint_x;
    y = global.checkpoint_y;
    can_move = global.checkpoint_move;

    global.checkpoint_pending = false;
}