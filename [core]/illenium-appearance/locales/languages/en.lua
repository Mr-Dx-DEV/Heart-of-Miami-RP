Locales["en"] = {
	UI = {
		header = {
			title = "Appearance Editor",
			alt_text = "Hmm, very distinguished style.",
		},
		actions = {
			save = "Save",
			cancel = "Cancel",
		},
		common_words = {
			component = "Component",
			fade = "Fade",
			opacity = "Opacity",
			hair = "Hair",
			variant = "Variant",
			color = "Color",
			primary = "Primary",
			secondary = "Secondary",
			select = "Select",
			highlight = "Highlight",
			base = "Base",
			face = "Face",
			skin = "Skin",
			face_and_skin = "Face & Skin",
			import = "Import",
			export = "Export",
			copy = "Copy",
			non_freemode = "Non-Freemode",
			ped_variants = "Ped Variant",
		},
		export_panel = {
			title = "Export & Import Panel",
			description = "Simplifies character data management.",
			paste_json_placeholder = "Paste your JSON here...",
			paste_xml_placeholder = "Paste your XML here...",
			messages = {
				ped_model_not_allowed = "This ped model is not allowed.",
				missing_key = "Missing key: %s",
				type_missmatch = "Type mismatch for key: %s",
				unexpected_key = "Unexpected key: %s",
				unexpected_error = "An error occurred, check console (F8) for details.",
				success = "Character imported successfully!",
				empty_value = "Value cannot be empty!",
				invalid_xml = "Invalid XML format!",
				invalid_model = "Invalid model hash",
				missing_section = "Missing section: %s",
				success_copy = "%s data copied successfully!"
			}
		},
		tabs = {
			characters = {
				title = "Characters",
				sections = {
					ped = "Characters",
					custom_ped = "Custom Ped",
				},
			},
			face = {
				title = "Face",
				sections = {
					mixes = {
						face = "Face Mix",
						skin = "Skin Mix",
						secondary = "Secondary Mix",
					},
				},
			},
			features = {
				title = "Features",
				components = {
					nose = {
						title = "Nose",
						properties = {
							width = "Width",
							peakHeight = "Bridge Height",
							peakSize = "Bridge Size",
							peakLowering = "Bridge Lowering",
							boneHeight = "Bone Height",
							boneTwist = "Bone Twist",
						},
					},
					eyebrows = {
						title = "Eyebrows",
						properties = {
							height = "Height",
							depth = "Depth",
						},
					},
					cheeks = {
						title = "Cheeks",
						properties = {
							boneHeight = "Bone Height",
							boneWidth = "Bone Width",
							width = "Width",
						},
					},
					eyesAndMouth = {
						title = "Eyes & Mouth",
						properties = {
							eyesOpening = "Eye Opening",
							lipThickness = "Lip Thickness",
							color = "Color",
						},
					},
					jaw = {
						title = "Jaw",
						properties = {
							boneWidth = "Bone Width",
							backBoneSize = "Back Depth",
						},
					},
					chin = {
						title = "Chin",
						properties = {
							boneLowering = "Bone Lowering",
							boneLength = "Bone Length",
							boneSize = "Bone Size",
							holeSize = "Cleft Size",
						},
					},
					neck = {
						title = "Neck",
						properties = {
							thickness = "Thickness",
						},
					},
				},
			},
			skin = {
				title = "Skin",
				components = {
					blemishes = {
						title = "Blemishes",
					},
					body_blemishes = {
						title = "Body Blemishes",
					},
					ageing = {
						title = "Ageing",
					},
					complexion = {
						title = "Complexion",
					},
					sun_damage_and_scars = {
						title = "Sun Damage & Scars",
					},
					moles_and_freckles = {
						title = "Moles & Freckles",
					},
				},
			},
			hair = {
				title = "Hair",
				components = {
					facial_hair = {
						title = "Beard / Mustache",
					},
					eyebrows = {
						title = "Eyebrows",
					},
					chest_hair = {
						title = "Chest Hair",
					},
				},
			},
			makeup = {
				title = "Makeup",
				components = {
					makeup = {
						title = "Makeup",
					},
					blush = {
						title = "Blush",
					},
					lipstick = {
						title = "Lipstick",
					},
				},
			},
			clothing = {
				title = "Clothing",
				components = {
					jacket = {
						title = "Jacket",
					},
					undershirt = {
						title = "Undershirt",
					},
					arms_and_gloves = {
						title = "Arms & Gloves",
					},
					pants = {
						title = "Pants",
					},
					shoes = {
						title = "Shoes",
					},
					decals = {
						title = "Decals",
					},
				},
			},
			accessories = {
				title = "Accessories",
				components = {
					mask = {
						title = "Mask",
					},
					scarfs_and_necklaces = {
						title = "Scarves & Necklaces",
					},
					vest = {
						title = "Vest",
					},
					bag = {
						title = "Bag",
					},
					hat = {
						title = "Hat",
					},
					glasses = {
						title = "Glasses",
					},
					earring = {
						title = "Earring",
					},
					watch = {
						title = "Watch",
					},
					bracelet = {
						title = "Bracelet",
					},
				},
			},
			tattoos = {
				title = "Tattoos",
				components = {
					ZONE_HEAD = {
						title = "Head",
					},
					ZONE_LEFT_ARM = {
						title = "Left Arm",
					},
					ZONE_LEFT_LEG = {
						title = "Left Leg",
					},
					ZONE_RIGHT_ARM = {
						title = "Right Arm",
					},
					ZONE_RIGHT_LEG = {
						title = "Right Leg",
					},
					ZONE_TORSO = {
						title = "Torso",
					},
				},
			},
		},
	},
	outfitManagement = {
		title = "Outfit Management",
		jobText = "Manage outfits for job",
		gangText = "Manage outfits for gang",
	},
	cancelled = {
		title = "Customization Cancelled",
		description = "Customization not saved",
	},
	outfits = {
		import = {
			title = "Enter Outfit Code",
			menuTitle = "Import Outfit",
			description = "Import an outfit via a share code",
			name = {
				label = "Name the Outfit",
				placeholder = "A nice outfit",
				default = "Imported Outfit",
			},
			code = {
				label = "Outfit Code",
			},
			success = {
				title = "Outfit Imported",
				description = "You can now switch to this outfit via the outfit menu",
			},
			failure = {
				title = "Import Failed",
				description = "Invalid outfit code",
			},
		},
		generate = {
			title = "Generate Outfit Code",
			description = "Generate a share code for this outfit",
			failure = {
				title = "An Error Occurred",
				description = "Failed to generate outfit code",
			},
			success = {
				title = "Code Generated",
				description = "Here is your outfit code",
			},
		},
		save = {
			menuTitle = "Save Current Outfit",
			menuDescription = "Save your current outfit as outfit %s",
			description = "Save your current outfit",
			title = "Name Your Outfit",
			managementTitle = "Outfit Management Details",
			name = {
				label = "Outfit Name",
				placeholder = "Very stylish outfit",
			},
			gender = {
				label = "Gender",
				male = "Male",
				female = "Female",
			},
			rank = {
				label = "Minimum Rank",
			},
			failure = {
				title = "Save Failed",
				description = "An outfit with this name already exists",
			},
			success = {
				title = "Success",
				description = "Outfit %s has been saved",
			},
		},
		update = {
			title = "Update Outfit",
			description = "Save your current clothing to an existing outfit",
			failure = {
				title = "Update Failed",
				description = "This outfit does not exist",
			},
			success = {
				title = "Success",
				description = "Outfit %s has been updated",
			},
		},
		change = {
			title = "Change Outfit",
			description = "Choose from your %s saved outfits",
			pDescription = "Choose from your saved outfits",
			failure = {
				title = "An Error Occurred",
				description = "The selected outfit has no base appearance",
			},
		},
		delete = {
			title = "Delete Outfit",
			description = "Delete a saved %s outfit",
			mDescription = "Delete one of your saved outfits",
			item = {
				title = 'Delete "%s"',
				description = "Model: %s%s",
			},
			success = {
				title = "Success",
				description = "Outfit deleted",
			},
		},
		manage = {
			title = "👔 | Manage %s Outfits",
		},
	},
	jobOutfits = {
		title = "Job Outfits",
		description = "Choose from your job outfits",
	},
	menu = {
		returnTitle = "Return",
		title = "Wardrobe",
		outfitsTitle = "Player Outfits",
		clothingShopTitle = "Clothing Store",
		barberShopTitle = "Barber",
		tattooShopTitle = "Tattoo Shop",
		surgeonShopTitle = "Plastic Surgeon",
	},
	clothing = {
		title = "Buy Clothing - $%d",
		titleNoPrice = "Change Clothing",
		options = {
			title = "👔 | Clothing Store Options",
			description = "Choose from a wide selection of items to wear",
		},
		outfits = {
			title = "👔 | Outfit Options",
			civilian = {
				title = "Civilian Outfit",
				description = "Put your own clothes back on",
			},
		},
	},
	commands = {
		reloadskin = {
			title = "Reload your character",
			failure = {
				title = "Error",
				description = "You cannot use reloadskin right now",
			},
		},
		clearstuckprops = {
			title = "Remove all props attached to the entity",
			failure = {
				title = "Error",
				description = "You cannot use clearstuckprops right now",
			},
		},
		pedmenu = {
			title = "Open / Give Clothing Menu",
			failure = {
				title = "Error",
				description = "The player is not online",
			},
		},
		joboutfits = {
			title = "Open Job Outfits Menu",
		},
		gangoutfits = {
			title = "Open Gang Outfits Menu",
		},
		bossmanagedoutfits = {
			title = "Open Boss Managed Outfits Menu",
		},
	},
	textUI = {
		clothing = "Clothing Store - Price: $%d",
		barber = "Barber - Price: $%d",
		tattoo = "Tattoo Shop - Price: $%d",
		surgeon = "Plastic Surgeon - Price: $%d",
		clothingRoom = "Wardrobe",
		playerOutfitRoom = "Outfits",
	},
	migrate = {
		success = {
			title = "Success",
			description = "Migration completed. %s skins migrated",
			descriptionSingle = "Skin migrated",
		},
		skip = {
			title = "Information",
			description = "Skin skipped",
		},
		typeError = {
			title = "Error",
			description = "Invalid type",
		},
	},
	purchase = {
		tattoo = {
			success = {
				title = "Success",
				description = "Tattoo %s purchased for $%s",
			},
			failure = {
				title = "Tattoo Application Failed",
				description = "You don’t have enough money!",
			},
		},
		store = {
			success = {
				title = "Success",
				description = "Gave $%s to %s!",
			},
			failure = {
				title = "Exploit!",
				description = "You didn’t have enough money! Attempted system exploit!",
			},
		},
	},
}
