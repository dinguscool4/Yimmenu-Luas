script.run_in_callback(function()
	local running = true

	while running == true do
		local isonline =
			network.network_is_session_started() and
			not network.network_is_in_transition() and
			not streaming.is_player_switch_in_progress()

		if isonline then
			stats.set_int("mpx_club_popularity", 1000)
			stats.set_int("mpx_club_pay_time_left", -1)
			tunables.set_int("nightclubincomeuptopop100", 250000)

			notify.success("max nightclub safe", "done")
		else
			notify.info("max nightclub safe", "lobby not supported")
		end

		script.yield(5000)
	end
end)
