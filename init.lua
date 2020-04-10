local handle = nil
minetest.override_item("default:sword_wood", {
    on_use = function(itemstack, user, pointed_thing)
        if pointed_thing.ref == nil then  -- if the thing we are pointing at is not an object
            return
        elseif pointed_thing.ref:is_player() == false then -- if the thing we are pointing at is not a player
            return
        else                                                        --if the thing we are pointing at is a player
            if handle ~= nil then                                   --are we playing the song?
                minetest.sound_stop(handle)                         --if so, stop the song
                handle = minetest.sound_play("therollingofrick", {  --and play the song again
                to_player = pointed_thing.ref:get_player_name(),    --to the person that we hit
                    gain = 0.25, --for all headphone users
                })
                return
            else                                                    --have we not played the song?
                handle = minetest.sound_play("therollingofrick", {  --then play the song
                to_player = pointed_thing.ref:get_player_name(),    --to the person that we hit
                    gain = 0.25, --for all headphone users
                })
                return
            end    
        end
        return nil
    end   
})