if FrameworkResource == Framework.Standalone then
    function Framework.getIdentifier(source)
        return GetPlayerIdentifierByType(source, "license")
    end

    function Framework.payMoney(source, price)
        return true
    end
end
