
function save_key_config()
{
if file_exists("keyconfig_0.ini")
file_delete("keyconfig_0.ini")
ini_open("keyconfig_0.ini")
ini_write_real("KEYBOARD","down",global.down)
ini_write_real("KEYBOARD","right",global.right)
ini_write_real("KEYBOARD","up",global.up)
ini_write_real("KEYBOARD","left",global.left)
ini_write_real("KEYBOARD","confirm",global.confirm)
ini_write_real("KEYBOARD","cancel",global.cancel)
ini_write_real("KEYBOARD","menu",global.menu)  
ini_close()
}