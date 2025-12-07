local dbg = RDebug()
dbg.setupPrefix(GetCurrentResourceName())

Locales = Locales or {}

function _U(str, ...)
    if not Config or not Config.Locale then
        dbg.critical('Cannot find Locale in the config')
        return 'not_found_config'
    end

    if not Locales[Config.Locale] then
        dbg.critical('Cannot find locale %s', Config.Locale)
        return 'not_found_locale'
    end

    local isNested = string.find(str, ".", 1, true)

    if isNested then
        local cat, key = str:match('([^%.]+)%.([^%.]+)')

        if not Locales[Config.Locale][cat] then
            dbg.critical('Cannot find locale category %s for string %s in locale %s', cat, key, Config.Locale)
            return str
        end

        if not Locales[Config.Locale][cat][key] then
            dbg.critical('Cannot find locale string %s in category %s in locale %s', key, cat, Config.Locale)
            return str
        end

        return string.format(Locales[Config.Locale][cat][key], ...)
    end

    if not Locales[Config.Locale][str] then
        dbg.critical('Cannot find locale string %s in locale %s', str, Config.Locale)
        return str
    end

    return string.format(Locales[Config.Locale][str], ...)
end
