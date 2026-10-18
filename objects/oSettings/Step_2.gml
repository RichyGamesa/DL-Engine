if last_volume != global.volume
{
ini_open("configurations.ini")
ini_write_real("Settings","Volume",global.volume)
ini_close()
}