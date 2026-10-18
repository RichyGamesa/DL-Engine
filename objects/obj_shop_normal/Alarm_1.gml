/// @description LEAVE
//alarm[1]
            if !instance_exists(oWarp)
            var warp = instance_create_depth(obj_mainchara.x,obj_mainchara.y,obj_mainchara.depth,oWarp)
               warp.target_x = global.last_x
			   warp.target_y = global.last_y
			   warp.target_room = global.last_room;
			   obj_mainchara.depth = global.last_depth;
			   audio_stop_all()
			  
