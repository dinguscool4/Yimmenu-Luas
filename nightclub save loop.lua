script.run_in_callback(function()
	local running = true

	while running == true do
		stats.set_int("mpx_club_popularity", 1000)
		stats.set_int("mpx_club_pay_time_left", -1)

		notify.success("max nightclub safe", "done")
		script.yield(10000)
	end
end)
