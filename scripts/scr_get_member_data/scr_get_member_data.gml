function scr_get_member_data(__name)
{
    for (var i = 0; i < array_length(global.memberData); i++)
    {
        if (global.memberData[i].id == __name)
        {
            return global.memberData[i];
        }
    }

    return undefined;
}