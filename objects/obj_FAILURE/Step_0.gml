//obj_FAILURE Step Event

// -----------------------------------------
// STATE 0 - TYPE CURRENT LINE
// -----------------------------------------

if (state == 0)
{
    var _text = text_lines[line_index];

    if (index < string_length(_text))
    {
        index += display_speed;

        displayed_lines[line_index] = string_copy(
            _text,
            1,
            floor(index)
        );
    }
    else
    {
        displayed_lines[line_index] = _text;

        // More lines remaining
        if (line_index < 2)
        {
            state = 1;
            pause_timer = 30*3; //30 FPS so 5 seconds equal 30*5
        }
        // All lines completed
        else
        {
			if !started_alarm
			{
			alarm[0] = 30;
			started_alarm = true
			}
        }
    }
}


// -----------------------------------------
// STATE 1 - WAIT 
// -----------------------------------------

else if (state == 1)
{
    pause_timer--;

    if (pause_timer <= 0)
    {
        line_index++;
        index = 0;
        state = 0;
    }
}