function L(path, args)
	assert(type(path) == "string", "path must be a string")
	local translation = locales[Config.Locale]

	for key in path:gmatch("[^%.]+") do
		if not translation[key] then
			print("Translation not found for path: " .. path)
			return path
		end
		translation = translation[key]
	end

	if args then
		for k, v in pairs(args) do
			translation = translation:gsub("{" .. k .. "}", v)
		end
	end

	return type(translation) == "string" and translation or path
end
