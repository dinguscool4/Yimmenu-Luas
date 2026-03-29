script.run_in_callback(function()
    local cluck_stats = {
        { index = 0 , name = "Slush Fund"},
        { index = 1 , name = "Breaking and Entering"},
        { index = 3 , name = "Concealed Rewards"},
        { index = 7 , name = "Hit And Run"},
        { index = 15, name = "Disorganized Crime"},
        { index = 31, name = "Scene of Crime"}
    }

    for _, stat in ipairs(cluck_stats) do
        stats.set_int("MPX_SALV23_INST_PROG", stat.index)
        script.yield(100)
    end

    notify.info("skip cluckin bell", "done")
end)
