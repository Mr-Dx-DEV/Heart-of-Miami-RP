
Queries = {
		BUSINESS_JOB_ESX_INSERT = [[
			INSERT IGNORE INTO jobs (name, label, whitelisted) VALUES (?, ?, ?)
		]],
		BUSINESS_JOB_GRADES_ESX_INSERT = [[
			INSERT IGNORE INTO job_grades (job_name, grade, name, label, salary, skin_male, skin_female) VALUES (?, ?, ?, ?, ?, ?, ?)
		]],
		BUSINESS_JOB_ESX_ADDON_ACCOUNT_INSERT = [[
			INSERT IGNORE INTO `addon_account` (`name`, `label`, `shared`) VALUES (@name, @name, '1')
		]],
		UPDATE_BILLBOARD_RENT_STATE = [[
			UPDATE rcore_banners_billboards SET state = ? WHERE rent_billboardId = ?;
		]],
		DEFINE_BILLBOARD_OWNER = [[
			UPDATE rcore_banners_billboards SET owner = ? WHERE rent_billboardId = ?;
		]],
		DEFINE_BILLBOARD_OWNER_NULL = [[
			UPDATE rcore_banners_billboards SET owner = NULL WHERE rent_billboardId = ?;
		]],
		DEFINE_BILLBOARD_SERVICE_FEE_RESET = [[
			UPDATE rcore_banners_billboards SET service_fee = NULL WHERE rent_billboardId = ?;
		]],
		UPDATE_BILLBOARD_RENT_LEFT = [[
			UPDATE rcore_banners_billboards SET rent_left = ? WHERE rent_billboardId = ?;
		]],
		UPDATE_BILLBOARD_RENT_RIGHT = [[
			UPDATE rcore_banners_billboards SET rent_right = ? WHERE rent_billboardId = ?;
		]],
		UPDATE_BILLBOARD = [[
			UPDATE rcore_banners_placed SET banner_name = ?, billboardText = ? WHERE id = ?;
		]],
		FETCH_ALL_BILLBOARDS = [[
			SELECT * FROM rcore_banners_billboards;
		]],
		FETCH_SERVICE_FEE_FOR_BILLBOARD = [[
			SELECT service_fee, timestampdiff(second, now(), service_fee) AS time FROM rcore_banners_billboards WHERE rent_billboardId = ?;
		]],
		INSERT_SERVICE_FEE_FOR_BILLBOARD =
		'UPDATE rcore_banners_billboards SET service_fee = DATE_ADD(NOW(), INTERVAL ? SECOND) WHERE rent_billboardId = ?',
		CREATE_BANNER = [[
			INSERT INTO rcore_banners_placed
				(`banner_name`, `owner`, `x`, `y`, `z`, `scaleX`, `scaleY`)
			VALUES
				(@banner_name, @owner, @x, @y, @z, @scaleX, @scaleY)
		]],
		CREATE_SERVER_BANNER = [[
			INSERT INTO rcore_banners_list
				(`banner_name`, `banner_type`, `banner_dict`, `image`)
			VALUES
				(@banner_name, @banner_type, @banner_dict, @image)
		]],
		CREATE_SERVER_BUSINESS_BANNER = [[
			INSERT INTO rcore_banners_list
				(`banner_name`, `banner_type`, `banner_dict`, `image`, `job_allowed`, `jobs`)
			VALUES
				(@banner_name, @banner_type, @banner_dict, @image, @job_allowed, @jobs)
		]],
		DOES_BANNER_EXIST = "SELECT id FROM rcore_banners_placed WHERE id = ?",
		DELETE_BANNER = [[
            DELETE FROM rcore_banners_placed
            WHERE id = @id
        ]],
		DOES_TABLE_EXIST = [[
			SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = ?
		]],
		UPDATE_EXISTING_BANNER = [[
			UPDATE rcore_banners_placed
			SET
				`x` = @x,
				`y` = @y,
				`z` = @z,
				`fwX` = @fwX,
				`fwY` = @fwY,
				`fwZ` = @fwZ,
				`dX` = @dX,
				`dY` = @dY,
				`dZ` = @dZ,
				`scaleX` = @scaleX,
				`scaleY` = @scaleY
			WHERE
				id = @id
        ]],
		DOES_FAVORITE_USER_BANNER_EXIST = [[
			SELECT banners
			FROM rcore_banners_users_favorite
			WHERE owner = @owner
		]],
		INSERT_FAVORITE_USER_BANNER = [[
			INSERT INTO rcore_banners_users_favorite
				(`banners`, `owner`)
			VALUES
				(@banners, @owner)
			ON DUPLICATE KEY UPDATE
				`banners` = VALUES(`banners`);
		]],
		UPDATE_FAVORITE_USER_BANNER = [[
			UPDATE rcore_banners_users_favorite
			SET
				`banners` = @banners
			WHERE
				owner = @owner
		]],
		DELETE_SERVER_BANNER = [[
			DELETE FROM rcore_banners_list
			WHERE banner_name = @banner_name;
        ]],
		UPDATE_SERVER_BANNER_RENDER_STATE = [[
			UPDATE rcore_banners_list
			SET
				`disabled` = @disabled
			WHERE
				banner_name = @banner_name
		]],
		FETCH_ALL_BANNERS_LIST = [[
            SELECT
				list.image AS banner_image,
                list.banner_name AS banner_name,
                list.banner_type AS banner_type,
                list.banner_dict AS banner_dict,
                list.category AS banner_category,
				list.disabled AS disabled,
				list.job_allowed as job_allowed,
				list.jobs as jobs
            FROM
				rcore_banners_list AS list
		]],
		FETCH_ALL_PLACED_BANNERS = [[
			SELECT
			placed.id AS idx,
			placed.banner_name AS banner_name,
			placed.x AS banner_x,
			placed.y AS banner_y,
			placed.z AS banner_z,
			placed.fwX,
			placed.fwY,
			placed.fwZ,
			placed.dX,
			placed.dY,
			placed.dZ,
			placed.scaleX,
			placed.scaleY,
			placed.billboardText,
			placed.locationType,
			placed.renderDistance,
			placed.owner AS owner,
			list.disabled AS disabled,
			list.image AS banner_image,
			list.banner_type AS banner_type,
			list.banner_dict AS banner_dict
		FROM
			rcore_banners_placed AS placed
		INNER JOIN
			rcore_banners_list AS list
		ON
			placed.banner_name = list.banner_name;
		]],
		FETCH_ALL_FAVORITE_USER_BANNERS = [[
            SELECT
				*
            FROM
				rcore_banners_users_favorite
		]],
		FETCH_BANNERS_BY_STATE = [[
            SELECT
				list.image AS banner_image,
                list.banner_name AS banner_name,
                list.banner_type AS banner_type,
                list.banner_dict AS banner_dict,
                list.category AS banner_category,
				list.disabled AS disabled
            FROM
				rcore_banners_list AS list
			WHERE
                disabled = @disabled;
		]],
	}





db.DoesOwnerHaveRecord = function(owner)
	local query = "SELECT COUNT(*) as count FROM rcore_banners_users_favorite WHERE owner = @owner"
	local parameters = { ["@owner"] = owner }

	local result, error_message = MySQL.Sync.fetchScalar(query, parameters)

	if result ~= nil and tonumber(result) > 0 then
		return true
	else
		return false
	end
end

db.HasUserDefinedFavoriteBanners = function(owner)
	local retval = false
	local state = MySQL.Execute(Queries.DOES_FAVORITE_USER_BANNER_EXIST, { owner })

	if state ~= nil then
		retval = true
	end

	return retval
end

db.DoesTableExist = function(tableName)
	local retval = false
	local state = MySQL.Sync.fetchScalar(Queries.DOES_TABLE_EXIST, { tableName })

	if state ~= nil then
		retval = true
	end

	return retval
end

db.RegisterServerBanner = function(bannerName, bannerType, bannerDict, image)
	local retval = MySQL.Sync.execute(Queries.CREATE_SERVER_BANNER, {
		['@banner_name'] = bannerName,
		['@banner_type'] = bannerType,
		['@banner_dict'] = bannerDict,
		['@image'] = image,
	})

	return retval
end

db.RegisterBusinessBanner = function(bannerName, bannerType, bannerDict, image, businessName)
	local jobs = {}

	table.insert(jobs, {
		[businessName] = true
	})

	local retval = MySQL.Sync.execute(Queries.CREATE_SERVER_BUSINESS_BANNER, {
		['@banner_name'] = bannerName,
		['@banner_type'] = bannerType,
		['@banner_dict'] = bannerDict,
		['@image'] = image,
		['@job_allowed'] = 1,
		['@jobs'] = json.encode(jobs)
	})

	return retval
end

db.UpdateBillboardData = function(bannerName, bannerText, bannerIdx)
	return MySQL.Async.execute(Queries.UPDATE_BILLBOARD, { bannerName, bannerText, bannerIdx })
end

db.DefineBannerHook = function(billboardId, bannerIdx, side)
	local query = nil

	if side == 'left' then
		query = Queries.UPDATE_BILLBOARD_RENT_LEFT
	elseif side == 'right' then
		query = Queries.UPDATE_BILLBOARD_RENT_RIGHT
	end

	return MySQL.Async.execute(query, { bannerIdx, billboardId })
end

db.CreateBanner = function(owner, bannerName, bannerCoords, scale, cb)
	if not owner then
		return dbg.critical('CreateBanner - Failed to insert in database, since no owner of it is received')
	end

	if not bannerName then
		return dbg.critical('CreateBanner - Failed to insert in db, since not bannerName is received')
	end

	if not bannerCoords then
		return dbg.critical('CreateBanner - Failed to insert in db, since not bannerCoords is received')
	end

	MySQL.Async.insert(Queries.CREATE_BANNER, {
		['@owner'] = owner,
		['@banner_name'] = bannerName,
		['@x'] = bannerCoords.x,
		['@y'] = bannerCoords.y,
		['@z'] = bannerCoords.z,
		['@scaleX'] = scale.x,
		['@scaleY'] = scale.y,
	}, function(insertedId)
		if cb then
			cb(insertedId)
		end
	end)
end

db.DoesBannerExist = function(bannerId)
	if not bannerId then return end
	return MySQL.Sync.fetchAll(Queries.DOES_BANNER_EXIST, { bannerId }) or {}
end

db.UpdateBanner = function(bannerIdx, coords, extra)
	if not bannerIdx then return end
	if not coords then return end

	return MySQL.Sync.execute(Queries.UPDATE_EXISTING_BANNER, {
		['@x'] = coords.x,
		['@y'] = coords.y,
		['@z'] = coords.z,
		['@fwX'] = extra.decalForward.x,
		['@fwY'] = extra.decalForward.y,
		['@fwZ'] = extra.decalForward.z,
		['@dX'] = extra.decalRight.x,
		['@dY'] = extra.decalRight.y,
		['@dZ'] = extra.decalRight.z,
		['@scaleX'] = extra.size and extra.size.x,
		['@scaleY'] = extra.size and extra.size.y,
		['@id'] = bannerIdx
	})
end

db.DefineBillboardOwner = function(billboardId, businessName)
	if not billboardId then return end
	if not businessName then return end

	local query = Queries.DEFINE_BILLBOARD_OWNER
	local data = { businessName, billboardId }

	if businessName == 'NULL' then
		query = Queries.DEFINE_BILLBOARD_OWNER_NULL
		data = { billboardId }
	end

	return MySQL.Async.execute(query, data)
end

db.ResetServiceFee = function(billboardId)
	if not billboardId then return end

	return MySQL.Async.execute(Queries.DEFINE_BILLBOARD_SERVICE_FEE_RESET, { billboardId })
end

db.UpdateBillboardRent = function(billboardId, state)
	if not billboardId then return end
	if not state then return end

	return MySQL.Sync.execute(Queries.UPDATE_BILLBOARD_RENT_STATE, { state, billboardId })
end

db.DeleteBanner = function(bannerIdx)
	if not bannerIdx then return end

	local state = db.DoesBannerExist(bannerIdx)
	local retval = false

	if state then
		local wasDeletedState = MySQL.Sync.execute(Queries.DELETE_BANNER, {
			['@id'] = bannerIdx
		})

		if wasDeletedState then
			retval = true
			dbg.debug('Deleting banner from db, since it was found in db [%s]', bannerIdx)
		end
	end

	return retval
end

db.FetchAllBillboards = function()
	return MySQL.Sync.fetchAll(Queries.FETCH_ALL_BILLBOARDS, {})
end

db.FetchServiceFeeForBillboard = function(billboardId)
	if not billboardId then return end
	return MySQL.Sync.fetchScalar(Queries.FETCH_SERVICE_FEE_FOR_BILLBOARD, { billboardId })
end

db.InsertServiceFee = function(billboardId, time)
	if not billboardId then return end
	return MySQL.Sync.execute(Queries.INSERT_SERVICE_FEE_FOR_BILLBOARD, { time, billboardId })
end

db.FetchPlacedBanners = function()
	return MySQL.Sync.fetchAll(Queries.FETCH_ALL_PLACED_BANNERS, {})
end

db.FetchServerBannersList = function()
	return MySQL.Sync.fetchAll(Queries.FETCH_ALL_BANNERS_LIST, {})
end

db.RemoveBannerFromServer = function(banner_name)
	if not banner_name then return end

	return MySQL.Async.execute(Queries.DELETE_SERVER_BANNER, {
		['@banner_name'] = banner_name
	})
end

db.InsertFavoriteUserBanners = function(owner, data)
	if not owner then return end
	if not data then return end

	return MySQL.Async.execute(Queries.INSERT_FAVORITE_USER_BANNER, {
		['@owner'] = owner,
		['@banners'] = json.encode(data)
	})
end

--- @return any
db.UpdateFavoriteUserBanners = function(owner, data)
	if not owner then return end
	if not data then return end

	return MySQL.Async.execute(Queries.UPDATE_FAVORITE_USER_BANNER, {
		['@owner'] = owner,
		['@banners'] = json.encode(data)
	})
end


db.FetchFavoriteUserBanners = function()
	local retval = nil
	local data = MySQL.Sync.fetchAll(Queries.FETCH_ALL_FAVORITE_USER_BANNERS, {})

	if data then
		retval = data
	end

	return retval
end

db.FetchBannersByState = function(state)
	if not state then return end

	return MySQL.Sync.fetchAll(Queries.FETCH_BANNERS_BY_STATE, {
		['@disabled'] = state
	})
end


--- @return any
db.UpdateServerBannerState = function(bannerName, state)
	if not bannerName then return end
	if not state then return end

	return MySQL.Sync.execute(Queries.UPDATE_SERVER_BANNER_RENDER_STATE, {
		['@disabled'] = state,
		['@banner_name'] = bannerName
	})
end

db.InsertESXJob = function(businessName, whitelisted)
	return MySQL.Sync.execute(Queries.BUSINESS_JOB_ESX_INSERT,
		{ businessName, firstToUpper(businessName), whitelisted })
end

db.InsertESXJobGrades = function(params)
	return MySQL.Async.prepare(Queries.BUSINESS_JOB_GRADES_ESX_INSERT, params)
end

db.InsertESXAccount = function(businessName)
	return MySQL.Sync.execute(Queries.BUSINESS_JOB_ESX_ADDON_ACCOUNT_INSERT, {
		["@name"] = 'society_' .. businessName
	})
end

db.doesTableExist = function(tableName)
	if CachedDbResults[tableName] then
		return CachedDbResults[tableName]
	end

	local result = MySQL.query.await("SHOW TABLES LIKE @tableName", {
		['@tableName'] = tableName
	})

	local retval = result and next(result) ~= nil

	CachedDbResults[tableName] = retval

	return retval
end

db.IsBusinessRegisteredQBManagement = function(businessName)
    -- if not db.doesTableExist("management_funds") then
    --     dbg.critical('IsBusinessRegisteredQBManagement: management_funds from qb_management doesnt exist: %s', Config.Society)
    --     return false
    -- end

    -- local result = MySQL.query.await("SELECT 1 FROM `management_funds` WHERE `job_name` = @businessName LIMIT 1", {
    --     ['@businessName'] = businessName
    -- })

    -- if result and result[1] then
    --     return true
    -- else
    --     return false
    -- end
end


db.RegisterBusinessQBManagement = function(businessName, amount)
    -- if not db.doesTableExist("management_funds") then
    --     dbg.critical('RegisterBusinessQBManagement: management_funds from qb_management doesnt exist: %s', Config.Society)
    --     return false
    -- end
	
    -- local queryResult = MySQL.query.await("SELECT `type` FROM `management_funds` LIMIT 1")
    -- local fundType = "job"

    -- if queryResult and #queryResult > 0 then
    --     fundType = queryResult[1].type
    -- end

    -- local result = MySQL.query.await("INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES (@businessName, @amount, @type)", {
    --     ['@businessName'] = businessName,
    --     ['@amount'] = amount,
    --     ['@type'] = fundType
    -- })

    -- return result
end