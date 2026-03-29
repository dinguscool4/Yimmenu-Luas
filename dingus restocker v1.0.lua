--Based off Biz-teroids, Edited to be quicker and more efficient.
local h_restock, h_max = true, true
local h_type, w_type = 6, 6
local h_set, w_set = false, false
local mc_resup, mc_restock, nc_goods = true, true, true

script.run_in_callback(function()
    if ScriptGlobal(2655288):get_int() == -1 then
        notify.info("dingus restocker v1.0", "please join a session and reload.")
        return
    end

    notify.info("dingus restocker v1.0", "starting logic...")
    script.yield(2000)

    local base = 1845299 + 1 + 260
    local wh_p, h_p, mc_p, nc_p = base + 128, base + 304, base + 205, base + 364

    if h_restock then
        if ScriptGlobal(h_p):get_int() >= 1 and ScriptGlobal(h_p + 3):get_int() <= 49 then
            if h_set then ScriptGlobal(1882707 + 8):set_int(h_type) end
            ScriptGlobal(1882707 + 7):set_int(50)
            stats.set_packed_bool(36828, true)
            notify.success("hangar", "hangar ready for sale.")
        end

        if ScriptGlobal(wh_p + 1):get_int() >= 1 then
            for c = 0, 4 do
                if ScriptGlobal(wh_p + 1):at(c, 3):get_int() <= 110 then
                    if w_set then ScriptGlobal(1882682 + 16):set_int(w_type) end
                    ScriptGlobal(1882682 + 13):set_int(111)
                    for wh = 32359, 32363 do stats.set_packed_bool(wh, true) end
                end
            end
            notify.success("warehouses", "warehouses ready for sale.")
        end
    end

    if mc_resup then
        for b = 0, 7 do
            if ScriptGlobal(mc_p):at(b, 13):get_int() >= 1 then
                for s = 1, 7 do ScriptGlobal(1673814 + s):set_int(1) end
                notify.success("mc supplies", "supplies ready.")
                break
            end
        end
    end

    if mc_restock then
        local biz_data = {
            {n = "meth", ids = {1, 6, 11, 16}, l = 19, t = {1370024930, 1944848251, 1577999189, 1678460062, -730135062, -660914094}},
            {n = "weed", ids = {2, 7, 12, 17}, l = 79, t = {-635596193, -1694873660, 1575359233, 102029883, -373027461, 1195564032}},
            {n = "coke", ids = {3, 8, 13, 18}, l = 9,  t = {702413484, 2070857577, -1539796661, 396217128, -161187879, 1500658261}},
            {n = "cash", ids = {4, 9, 14, 19}, l = 39, t = {1310272402, 1690071006, -1454958662, -1913260493, 631857857, -891680742}},
            {n = "docs", ids = {5, 10, 15, 20}, l = 59, t = {-959721585, 1672482518, -518264160, 489023341, -1839004359, -192060672}},
            {n = "bunk", ids = {21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}, l = 99, t = {215868155, 631477612, 818645907, -1652502760, 1647327744}}
        }

        for i = 0, 5 do
            local slot_id = ScriptGlobal(mc_p):at(i, 13):get_int()
            if slot_id > 0 then
                for _, b in ipairs(biz_data) do
                    for _, id in ipairs(b.ids) do
                        if slot_id == id then
                            if ScriptGlobal(mc_p + 1):at(i, 13):get_int() <= b.l then
                                for _, v in ipairs(b.t) do tunables.set_int(v, 1) end
                                notify.success(b.n, b.n .. " ready for sale.")
                            end
                        end
                    end
                end
            end
        end

        if ScriptGlobal(mc_p):at(6, 13):get_int() >= 1 and ScriptGlobal(mc_p + 1):at(6, 13):get_int() <= 159 then
            for _, v in ipairs({-672998848, 494316332, -40235252, -1506354854, -993236072}) do tunables.set_int(v, 1) end
            notify.success("acid", "acid ready for sale.")
        end
    end

    if ScriptGlobal(nc_p):get_int() >= 1 and nc_goods then
        for _, v in ipairs({-147565853, -1390027611, -1292210552, 1007184806, 18969287, -863328938, 1607981264}) do tunables.set_int(v, 1) end
        notify.success("nightclub", "nightclub ready for sale.")
    end
end)
