pcall(function()
    natives.load_natives()
	local percent = 100
    local IsOnline =
        NETWORK.NETWORK_IS_SESSION_STARTED() and
        not NETWORK.NETWORK_IS_IN_TRANSITION() and
        not STREAMING.IS_PLAYER_SWITCH_IN_PROGRESS()

    if IsOnline then
		stats.set_int("MPx_SCRIPT_INCREASE_STAM", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_STRN", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_LUNG", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_DRIV", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_FLY", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_SHO", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_STL", percent, true)
		stats.set_int("MPx_SCRIPT_INCREASE_MECH", percent, true)
        notify.success("max stats", "done")
    else
        notify.info("max stats", "lobby not supported")
    end
end)
