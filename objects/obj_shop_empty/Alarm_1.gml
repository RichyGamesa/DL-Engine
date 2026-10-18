/// @description LEAVE
//alarm[1]
            if !instance_exists(oWarp)
            var warp = instance_create_depth(obj_mainchara.x,obj_mainchara.y,obj_mainchara.depth,oWarp)
              warp.target_room =  room_last
			  warp.target_x = 625
			  warp.target_y = 162
