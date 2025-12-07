local arrayList = {
    {
        identifier = "plush_01",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_01a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_02",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_02a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_03",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_03a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_04",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_04a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_05",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_05a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_06",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_arcade_claw_plush_06a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_07",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_princess_robo_plush_07a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_08",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_shiny_wasabi_plush_08a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },

    {
        identifier = "plush_09",

        dictName = "impexp_int-0",
        clipName = "mp_m_waremech_01_dual-0",

        propName = "ch_prop_master_09a", -- isnt needed can be left nil if needed
        propBone = 24817, -- same like above
        propPlacement = { 0.00, 0.46, -0.016, -180.0, -90.0, 0.0 }, -- same like above

        loop = true, -- same like above
        moving = true, -- same like above
    },
}

CreateThread(function()
    for k, v in pairs(arrayList) do
        local emote = CreateCustomAnimation()

        emote.SetUniqueIdentifier(v.identifier)

        emote.SetDictionaryName(v.dictName)
        emote.SetAnimationClipName(v.clipName)

        emote.SetPropName(v.propName)
        emote.SetPropBone(v.propBone)
        emote.SetPropPlacement(v.propPlacement)

        emote.SetEmoteLoop(v.loop)
        emote.SetEmoteMoving(v.moving)

        emote.Create()
    end
end)