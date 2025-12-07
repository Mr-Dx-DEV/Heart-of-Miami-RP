Locales['en'] = {
    USER_NOT_AT_ANY_BANNER = "You are not close to any banner!",

    BANNER_REMOVED = "Banner '%s' was removed from favorites.",
    BANNER_REMOVED_ERR = "Failed to remove banner '%s' from favorites.",

    NOT_BOSS_GRADE = 'You need to have boss grade!',

    MODEL_HIDE_SAVED = "Success, the target billboard was hidden!",

    YOU_DONT_HAVE_PERMISSION = "You are missing permission '%s' to do this!",
    YOU_DONT_HAVE_REQUIRED_ITEM = "You do not have item [%s].",
    YOU_CANNOT_REMOVE_BANNER_WHEN_REMOVING_ONE = "You are already removing a banner, please wait!",
    NOT_IN_BANNER_JOB = "You tried to deleted a banner which is associated to different business!",

    YOU_RESTORE_BANNER_FROM_ARCHIVE = "You restored banner '%s' from archive!",
    YOU_STORED_BANNER_TO_ARCHIVE = "You stored banner '%s' to the archive!",
    YOU_REMOVED_BANNER_FROM_SERVER = "You removed banner '%s' from the server",

    SAVE_FAVORITE_BANNER = "Banner '%s' was added to your favorites!",
    SAVE_FAVORITE_BANNER_ERR = "Failed to mark this banner as favorite!",

    DB_NOT_RUNNING = "Please wait before executing /banners, the script is loading. (~10sec)",
    DB_NOT_DEFINED_TABLES = "Script database tables are not defined, please ensure rcore_banners_billboards.sql!",

    EDITOR_IS_ALREADY_OPENED = "Editor is already opened!",
    OPEN_DASHBOARD_ERROR_SINCE_EDITOR_OPENED = "Please close the editor to open the dashboard!",
    BANNER_WAS_REMOVED = "Banner was removed.",
    CUSTOM_BANNER_SUCC_MESSAGE = "New banner was successfully created '%s'",

    BILLBOARD_MAP_SETTING_WAYPOINT = "Setting a waypoint to the billboard.",
    CANNOT_INTERACT_WHILE_IN_VEHICLE_ERR = "You can't do that while being in a vehicle!",
    FRONTEND_NOT_LOADED = "The script is loading, please try again!",

    PRINTER_LABEL = "Printer: ",

    CURRENCY = "%s $",

    MANAGEMENT_MENU = {
        TITLE =  "Business management",
        BOSS_MENU_TITLE = "Boss menu",
        WORKSTATION_MENU_TITLE = "Workstations",
    },

    MINIGAME = {
        CONTROL_DRAG = "Drag the point",
        CONTROL_UNDRAG = "Stop dragging",
        GUIDE = "Drag point from the start to the end.",
    },

    BILLBOARD_SIDES = {
        A = "A",
        B = "B",
        BOTH = "Both sides",
        NONE = "None",
    },

    ID = 'Your playerId: %s',
    
    SET_BUSINESS_JOB_USE_CASE = 'Usage: /set_business_job [playerID] [jobName] [jobGrade]',
    SET_BUSINESS_INVALID_JOB = 'You need to type one of these: printers or gov',
    SET_BUSINESS_INVALID_GRADE = 'This grade doesnt exist in this job',

    NOT_ENOUGH_PERMS_TO_ACCESS = 'Your rank (%s) doesnt have access to this!',

    NOTIFY = {
        GENERAL = "General",
    },

    BILLBOARD_BUY_MENU = {
        LABEL_HELPKEYS = "To open billboard menu",
        LABEL = "Billboards - Buy [%s]",
        LOADING_LABEL = "Loading data, please wait.",
        BUY_BUTTON_LABEL = "Buy the billboard",
        BUY_BUTTON_DESC = "Do you want to buy this billboard for %s?",
        HELPKEY_INTERACT_BUY_BILLBOARD = "To buy the billboard",
        HELPKEY_INTERACT_CLOSE_MENU = "Exit menu",
        BILLBOARD_NOT_FOUND = "Billboard at this location is not defined in the database!",
    },

    BILLBOARD_BUSINESS = {
        TITLE_LABEL = 'Billboards',
        YOU_DONT_HAVE_PERMISSION = "You don't have permission to buy this billboard! (%s)",
        SET_BILLBOARD_IMAGE_NOT_ANY_SIDE_ACTIVE = "Failed to set image, since there is not any side active!",
        SET_BILLBOARD_IMAGE_NOT_VALID_SIDE = "You cannot set image to this side as it is not defined!",
        YOU_ARE_NOT_AUTHRORIZED = "You don't have access!",
        SET_BILLBOARD_IMAGE_NOT_OWNER = "You are not the owner of this billboard!",
        UNK_BUSINESS = "This business does not exist!",
        SELL_BACK_TO_CITY = "Billboard sold for %s!",
        TRANSFER_BILLBOARD_NOT_YOURSELF = "You cannot transfer billboard to yourself!",
        BUY_BUSINESS_BILLBOARD_SUCC = "You bought the billboard for %s!",
        BUY_BUSINESS_BILLBOARD_RECEIVED_OWNERSHIP = "You received billboard ownership!",
        BUY_BUSINESS_BILLBOARD_NOT_ENOUGH_MONEY = "Business does not have enough money to buy the billboard! %s",
        BUY_BUSINESS_BILLBOARD_NOT_VALID = "Your business is not allowed to buy a billboard!",
        BUY_BUSINESS_BILLBOARD_IS_OWNED = "This billboard is already owned.",
        BILLBOARD_HAS_BEEN_UPDATED = "Billboard has been updated.",
        SET_BILLBOARD_IMAGE_SUCC = "Billboard image has been set to billboard: %s",
        YOU_DONT_HAVE_PERMISSION_TO_BUY_THIS_BILLBOARD = "You are not authorised to buy billboards!",
    },

    BILLBOARD_MENU = {
        HELPKEY_OPEN_BILLBOARD = "To open billboard settings",
        BILLBOARD_IMAGE_MENU_LABEL = "Place billboard image",

        HELPKEY_CLOSE_MENU = "Exit menu",
        HELPKEY_BACKSPACE_CLOSE_MENU = "Exit menu",
        HELPKEY_EMPTY_BILLBOARD = "Buttons are disabled, because billboard is not defined.",

        SELECT_BANNER_MENU_TITLE = "Select editor side",
        SELECT_BANNER_MENU_DESC = "Choose side of the billboard you want to edit",

        ALTER_BILLBOARD_TITLE = "Save changes",
        ALTER_BILLBOARD_DESC = "Apply changes to the billboard.",

        PLACEHOLDER_BANNER_TITLE = "Billboard text",
        PLACEHOLDER_INPUT_TITLE = "Type text to display on the billboard",
        PLACEHOLDER_BANNER_DESC = "You can set text of your advert here.",

        PLACEHOLDER_CONTACT_TITLE = "Billboard contact",
        PLACEHOLDER_CONTACT_INPUT_TITLE = "Type contact to display on the billboard.",
        PLACEHOLDER_CONTACT_DESC = "This will set contact on the billboard",

        BILLBOARD_MANAGEMENT_LABEL = "Billboard management",
        BILLBOARD_MANAGEMENT_DSC = "Billboard management",
        BILLBOARD_MANAGEMENT_DSC_TRANSFER = "Are you sure you want to transfer this billboard to %s",

        ARE_YOU_SURE = "Are you sure?",

        PLACER_HOLDER_TEXT_IS_EMPTY = "Your advert can't be empty!",
        PLACER_HOLDER_CONTACT_IS_EMPTY = "Your contact can't be empty!",
    },

    BILLBOARD_HIDE_COMMAND_MARKER = {
        INVALID_BILLBOARD_ID = "Please provide a valid billboard ID!",
        INVALID_BILLBOARD_STATE = "Please provide a valid state! (1 = true, 0 = false)",
        SUCCESS_SHOW = "Billboard marker is now visible!",
        SUCCESS_HIDE = "Billboard marker is now hidden!",
        UNKNOWN_BILLBOARD_ID = "Billboardd with this ID doesnt exist!",
    },

    BILLBOARD_MANAGEMENT = {
        MENU_SELECT_ONLY_ONE_OPTION = "You can only select one option.",
        MENU_TITLE = "Billboards",
        MENU_TITLE_SERVICE_FEE_DATE = "Next recurring payment",
        MENU_TITLE_SERVICE_FEE_DATE_DSC =
        "Your next payment for the service fee is scheduled to date %s -> it amounts to %s. This recurring fee ensures the ongoing maintenance and services for your billboard.",
        MENU_SELL_BANNER_TO_CITY = "Sell billboard",
        MENU_SELL_BANNER_TO_CITY_DESC = "Sell this billboard for %s of the market price, you'll receive %s.",
        MENU_SELL_BANNER_TO_CITY_FEE_DESC = "Sell this banner to %s for %s of the market price. You will receive %s.",
        MENU_TRANSFER_OWNERSHIP_STATE_TITLE = "Transfer",
        MENU_TRANSFER_OWNERSHIP_STATE_DESC = "To confirm the billboard transfer please press this button.",
        MENU_TRANSFER_OWNERSHIP_FEE_TITLE = "Transfer fee",

        MENU_TRANSFER_TO_TITLE = "Transfer to",
        MENU_TRANSFER_TO_DESC = "If you want to transfer this billboard to a different owner, select business from list.",

        HELPKEY_CLOSE_MENU = "Exit menu",
        HELPKEY_GO_TO_MAIN_MENU = "Go to main menu",
    },

    KEYS = {
        LEAVE_MENU = "Leave menu",
        CONFIRM_INPUT = "Confirm & start",
        CONFIRM_JOB_INPUT_CANCEL = "Confirm & stop the job",
    },

    BILLBOARD = {
        EXIT_BILLBOARD_PREVIEW = "Exit preview",
        PLACE_BILLBOARD = "Place banner",
        CHANGE_BILLBOARD_BANNER = "Change banner",
        CONTACT = "Contact",
    },

    BILLBOARD_STATES = {
        FOR_SALE = "Billboard for rent.",
        FOR_RENT = "Advertising space for sale",
    },

    UI = {
        FAVORITE_PAGE_LABEL = "Favorite banners",

        RESTORE_BUTTON_LABEL = "Restore",
        DELETE_BUTTON_LABEL = "Delete",

        BILLBOARD_LEGEND_OWNED_LABEL = "Owned",
        BILLBOARD_LEGEND_AVAILABLE_LABEL = "Available",
        BILLBOARD_LEGEND_NOT_AVAILABLE_LABEL = "Not Available",
        BILLBOARD_LEGEND_USER_MARKER_LABEL = "Your position",

        STATION_IDLE = "Not active",
        STATION_PREPARING_PRINTER = "Preparing machine",
        STATION_READY_AWAITING_PRINTER = "Waiting for printer",
        STATION_ACTIVE = "Active",
        STATION_FINISHED = "Heated, cooling",

        STATIONS = "Stations",
        MINIGAME = "Minigame",
        INVENTORY = "Inventory",
        PRODUCTION = "Production",
        BANNERS = "Banners",
        ERROR = "Error",

        REMOVE_BANNER_CONFIRM_TITLE = "Do you really want to remove this banner?",
        REMOVE_BANNER_DESC = "Are you sure?",

        STOP_PRODUCTION_CONFIRM_TITLE = "Do you really want to stop the production?",
        STOP_PRODUCTION_DESC = "Are you sure?",

        STOP_PRODUCTION_CONFIRM_LABEL = "Yes",
        STOP_PRODUCTION_EXIT_LABEL = "No",

        REMOVE_BANNER_CONFIRM_LABEL = "Yes",
        REMOVE_BANNER_EXIT_LABEL = "No",

        STATIONS_MANAGEMENT_BANNER_NAME_UNK = "None",

        BANNER_NAME = "",


        ASPECT_RATIO = "To get a better fitting image for this billboard, you should prepare image with aspect ratio:",

        BILLBOARD_LABEL = "Billboard:",
        BILLBOARD_OWNER = "Billboard owner: ",
        BILLBOARD_AVAILABLE_STATE = "Rent state: Available to rent",
        BILLBOARD_NOT_AVAILABLE_STATE = "Rent state: Not available to rent",
        BILLBOARD_OWNED = "Rent state: Owned",
        BILLBOARD_SET_WAYPOINT_LABEL = "Set waypoint",

        CUSTOM_BANNER_DEFINED_MSG = "Added a new banner with name: ",
        CUSTOM_BANNER_NOT_IMAGE_SHOWN = "Please render preview of the banner image first!",

        PAGE_CREATE_BANNER = "Banner from dictionary (YTD)",
        PAGE_CUSTOM_BANNER = "Banner from URL",

        BANNER_TYPE_SELECTOR_TITLE = "Select banner type",
        BANNER_TYPE_PAGE_YTD = "Banner from dictionary (YTD)",
        BANNER_TYPE_PAGE_CUSTOM = "Banner from URL",

        SAVE_BANNER_BUTTON_LABEL_FORMS = "Save banner",
        RENDER_PREVIEW_BUTTON_LABEL_FORMS = "Render preview",

        PRODUCE_LABEL_BUTTON = "Produce",
        REMOVE_BANNER_LABEL_BUTTON = "Remove banner",

        PRODUCTION_HOME_PAGE_NO_BANNERS_DEFINED_TITLE = "No job banners available",
        PRODUCTION_HOME_PAGE_NO_BANNERS_DEFINED_MESSAGE = "You need to create job banners you can print out for your job",
        PRODUCTION_HOME_PAGE_NO_BANNERS_DEFINED_BUTTON_CREATE_BANNER = "Create banner",

        PRODUCTION_HOME_PAGE_ERROR_TITLE = "We found nothing...",
        PRODUCTION_HOME_PAGE_ERROR_MESSAGE = "Try searching for something else",

        START_PRODUCTION_TITLE_POPUP_TITLE = "Start production",
        START_PRODUCTION_TITLE_POPUP_MESSAGE = "Are you sure you want to start production?",
        START_PRODUCTION_POPUP_CONFIRM_LABEL = "Start",
        START_PRODUCTION_POPUP_CLOSE_LABEL = "Exit",

        -- INVENTORY

        YOU_DONT_HAVE_ITEM = "You are missing an item: ",

        -- Banner forms

        DICTIONARY_YTD_FILE_LABEL = "YTD File",
        DICTIONARY_YTD_FILE_PLACEHOLDER = "Write name of the YTD file...",
        DICTIONARY_TEXT_INPUT_BANNER_IMAGE_PLACEHOLDER_ = "Write texture name",
        DICTIONARY_TEXT_INPUT_BANNER_IMAGE_DESC_ = "You will find this texture name inside your YTD file.",

        CUSTOM_TEXT_INPUT_BANNER_IMAGE_PLACEHOLDER_ = "Write image file name...",
        CUSTOM_TEXT_INPUT_BANNER_IMAGE_DESC = "Make sure your image link ends with .jpeg or .png",

        FORMS_IMAGE_PREVIEW_LABEL = "Preview",
        FORMS_BANNER_IMAGE_LABEL = "Your banner",
        FORMS_BANNER_NAME_LABEL = "Banner name",
        FORMS_BANNER_NAME_PLACEHOLDER = "Write name of banner",

        CUSTOM_BANNER_SUCC_MESSAGE = "You created a new banner: %s",

        VALIDATION_FORM_INPUT_EMPTY = "Banner name can't be empty!",
        VALIDATION_FORM_INPUT_LENGHT_MIN = "Banner name must have at least 3 letters!",
        VALIDATION_FORM_INPUT_LENGHT_MAX = "Banner name must be <= 30 letters!",
        VALIDATION_INPUT_BANNER_ALREADY_EXIST = "Banner with this name already exists",
        VALIDATION_BANNER_IMAGE_INPUT_BANNER_EMPTY = "Banner image cannot be empty",

        VALIDATION_INVALID_YTD_FILE = "Invalid YTD file, try it again!",
        VALIDATION_EMPTY_YTD_FILE = "YTD file is not defined.",

        VALIDATION_INVALID_YTD_TEXTURE = "Invalid YTD texture name!",

        VALIDATION_IMAGE_EXIST_URL_EMPTY = "URL cannot be empty",
        VALIDATION_IMAGE_BASE_64 = "Base64 images are not supported",
        VALIDATION_IMAGE_INVALLID_CONTENT_TYPE = "This image is not supported! Please use gif, jpeg, png, or jpg!",
        VALIDATION_IMAGE_DISCORD = "Discord images are not supported!",
        VALIDATION_IMAGE_FILE_SIZE = "Max size: ",
        VALIDATION_IMAGE_FILE_SIZE_UNIT = "MB",
        VALIDATION_IMAGE_SUCC_RESULT = "Valid",
        VALIDATION_IMAGE_FILE_SIZE_LENGHT = "Failed to get image size!",
        VALIDATION_IMAGE_VALIDATION_FAILED = "This is not a valid image URL!",

        PRODUCTION_CUSTOM_BANNER = "Custom",

        STATIONS_ERR_NOT_EXIST = "This station doesn't exist.",
        STATIONS_ERR_STOP_PRODUCTION_INACTIVE_STATE = "You cannot stop production when printer is not active!",


        PRODUCTION_POPUP_STOP_PRODUCTION_TITLE = "Stop production",
        PRODUCTION_POPUP_STOP_PRODUCTION_MESSAGE = "Are you sure you want to stop the current production?",
        PRODUCTION_POPUP_STOP_PRODUCTION_CONFIRM_LABEL = "Yes",
        PRODUCTION_POPUP_STOP_PRODUCTION_CANCEL_LABEL = "No",

        PRODUCTION_POPUP_BATCH_UPDATE_PRODUCTION_TITLE = "Batch update",
        PRODUCTION_POPUP_BATCH_UPDATE_PRODUCTION_MESSAGE = "Are you sure you want to update the current batch?",
        PRODUCTION_POPUP_BATCH_UPDATE_CONFIRM_LABEL = "Yes",
        PRODUCTION_POPUP_BATCH_UPDATE_CANCEL_LABEL = "No",

        PRODUCTION_MINIGAME_UPDATE_BATCH_BUTTON_LABEL = "Update batch",
        PRODUCTION_MINIGAME_STOP_PRODUCTION_BUTTON_LABEL = "Stop production",

        PRODUCTION_MINIGAME_STATION_LABEL = "Station name: ",
        PRODUCTION_MINIGAME_STATION_REMAINING_LEVELS_LABEL = "Remaining levels: ",
        PRODUCTION_MINIGAME_STATION_BATCH_STATE_LABEL = "Prints left in current batch: ",
        PRODUCTION_MINIGAME_STATION_TARGET_BANNER_LABEL = "Target production (banner): ",

        PRODUCTION_MINIGAME_ERR_FROM_LINE = "You moved out of the boundaries! Try it again.",
        PRODUCTION_MINIGAME_PROGRESS_NEXT_LEVEL = "You are going to the next level: %s",
        PRODUCTION_MINIGAME_FINISHED_RESULT = "Congratulations! You've finished production!",


        PRODUCTION_MINIGAME_STOP_PRODUCTION = "You don't have permission to stop the production!",
        PRODUCTION_MINIGAME_UPDATE_BATCH_PRODUCTION = "You don't have permission to update banner batch!",

        PRODUCE_AMOUNT_MUST_BE_GREATER_THAN_ZERO = "Produce amount must be greater than 0",
        PRODUCE_DATA_FAILED_TO_FIND = "Failed to find any production data!",

        NEW_STATION_NAME_TITLE = "Printer name",
        NEW_STATION_NAME_DESC = "Define new station name.",
        NEW_STATION_NAME_CONFIRM_LABEL = "Update",
        NEW_STATION_NAME_EXIT_LABEL = "Exit",
        NEW_STATION_NAME_ERR_INVALID = "This printer name is not valid!",


        UPDATE_STATION_BATCH_TITLE = "Current batch",
        UPDATE_STATION_BATCH_DESC = "Define the amount of current batch",
        UPDATE_STATION_BATCH_CONFIRM_LABEL = "Update",
        UPDATE_STATION_BATCH_CONFIRM_EXIT_LABEL = "Exit",
        UPDATE_STATION_INVALID = "This amount is invalid!",




        -- CONTENT HEADER

        CONTENT_HEADER_SEARCH_BAR_PLACEHOLDER = "Type what you want to find...",
        CONTENT_HEADER_SEARCH_BAR_BUTTON_LABEL = "Search",


        -- NAVBAR

        SIDEBAR_STASH_BANNER                       = "Archive",
        SIDEBAR_CUSTOM_BANNER                      = "Create banner",
        SIDEBAR_FAVORITE                           = "Favorite",
        SIDEBAR_MAP                                = "Map",
        SIDEBAR_HOME                               = "Home",

        -- HOME PAGE

        PAGE_HOME_OPEN_BANNER_EDITOR               = "Editor",
        PAGE_HOME_UPLOAD_IMAGE_TO_BILLBOARD        = "Set image on billboard",
        PAGE_HOME_STASH_BANNER                     = "Archive",
        HOME_PAGE_NAME                             = "All banners",
        HOME_PAGE_ERR_TITLE                        = "We found nothing...",
        HOME_PAGE_ERR_MESSAGE                      = "Try searching for something else",
        PRODUCTION_HOME_PAGE_NAME                  = "Production",

        SET_BANNER_TO_ARCHIVE_ERR_NOT_ENOUGH_PERMS = "You don't have enough permissions to do this!",

        IMAGE_IS_NOT_ACTIVE                        = "This image is no longer available.",
        -- ARCHIVE PAGE

        ARCHIVE_PAGE_NAME_LABEL                    = "Archive",
        ARCHIVE_PAGE_ERR_TITLE                     = "We found nothing...",
        ARCHIVE_PAGE_ERR_MESSAGE                   = "Looks like not any archived banners are defined.",

        -- STATIONS PAGE

        STATIONS_PAGE_NAME_LABEL                   = "Work stations",
        STATIONS_PAGE_ERR_TITLE                    = "We found nothing...",
        STATIONS_PAGE_ERR_MESSAGE                  = "Looks like not any stations are defined.",

        STATION_PRINTER_NAME_LABEL                 = "Printer name:",
        STATION_PRINTER_STATE_LABEL                = "State:",
        STATION_PRINTER_TARGET_LABEL               = "Target banner:",


        STATIONS_PAGE_BUTTON_BATCH_UPDATE = "Update batch",
        STATIONS_PAGE_BUTTON_STOP_PRODUCTION = "Stop production",
        STATIONS_PAGE_BUTTON_RENAME = "Rename printer",
        STATIONS_PAGE_OPTION_MENU_LABEL = "Options",
    },

    Business = {
        BOSS_MENU = "Open boss menu",
        PRODUCTION_MINIGAME = "Print banner",
    },

    Banners = {
        CLOSE_MENU = "Close menu",
    },

    WorkStation = {
        TITLE_LABEL = 'Work stations',
        IDLE_USER_HAS_PERMISSION_TO_SET_PRINTER = "You are preparing printer for banner production.",
        IDLE_USER_NOT_PERMISSION_TO_SET_PRINTER =
        "You dont have permission to prepare production! Talk to authorized personnel.",
        READY_AWAITING_PRINTER_HAS_PERMISSION_TO_PRODUCE = "You are starting production of banner at this work station.",
        READY_AWAITING_PRINTER_NO_BANNER_SET = "You cannot start production, because there is no banner set.",
        READY_AWAITING_PRINTER_ALREADY_WORKING =
        "You cannot start production, because there is already production in progress.",
        PREPARING_PRINTER_STATION_NOT_READY = "Workstation is not prepared for production.",
        PREPARING_PRINTER_NOT_ENOUGH_ITEMS = "You don't have enough items to prepare printer.",
        PRODUCTION_ACTIVE_NOT_ENOUGH_PERMS_TO_PRODUCE = "You don't have enough permission to process active banner!",
        FINISHED_PRINTER_STATION_PRODUCTION = "Printer machine is heated, please wait: %s before it can be used again!",
        PRINTER_STATION_PRODUCTION_CANNOT_STOP_PRODUCTION =
        "Printer machine is heated, please wait: %s before you can stop the printing!",
        UPDATE_PRINTER_STATION_NAME = "You updated station name to %s",
        UPDATE_PRINTER_TARGET_BATCH = "You updated station target batch to %s",
        STOPPED_CURRENT_PRINTER = "You stopped current production!",
        FINISHED_PRINTER_BATCH = "You finished current batch - remaining: %s/%s",
    },

    POSTER_JOB = {
        BLIP_LABEL = "Poster job",
    },

    Menu = {
        JOB_LOADING_LABEL = "Loading data, please wait.",
        JOB_TITLE = "Poster job",
        JOB_TITLE_START = "Start job",
        JOB_TITLE_CANCEL = "Stop current job",
        JOB_TITLE_CANCEL_DESC = "Do you want to stop the current job?",
        JOB_TITLE_DESC = "Deliver & place posters in the city.",
        JOB_GET_REWARD_TITLE = "Get reward",
        JOB_GET_REWARD_DESC = "Obtain a reward for your work",
    },

    CHAT_SUGGESTIONS = {
        BILLBOARD_ID_LABEL = "Billboard ID",
        BILLBOARD_ID_DESC = "Please type target Billboard ID",
        BILLBOARD_STATE_LABEL = "State",
        BILLBOARD_STATE_DESC = "Please type state of the billboard (1 = true, 0 = false)",
    },

    Commands = {
        DEBUGMATERIAL = 'Command use for debugging material on surface!',
        BANNERS = "Command that is used for opening menu.",
        REMOVEBANNERS = "Command that is used for deleting banners.",
        BANNERSDEBUG = "Command that is used for showing info about nearest banners",
        BILLBOARDHIDE = "Command that is used for hiding billboards",
        BILLBOARDHIDEMARKER = "Command that is used for hiding billboards",
    },

    Job = {
        LABEL = 'Job',
        MISSION_POINT_BLIP_LABEL = "Deliver poster [%s]",
        MISSION_INTERACT_LABEL = "Place & deliver poster.",
        INTERACT_KEYPRESS_LABEL = "Talk to Tonny",
        MISSION_PEOPLE_LIMIT_REACH = "There is enough people currently placing posters, please come later.",
        MISSION_GO_TO_NEXT_POSTER_LOCATION = "Go to next location marked on your map [%s/%s]",
        MISSION_DONE_GET_YOUR_REWARD = "Job is finished, go back to Tonny to get a reward.",
        MISSION_IS_IN_PROGRESS = "You cannot take a poster job, because you have one already in progress.",
        MISSION_ON_COOLDOWN = "You cannot take a poster job, take a break!",
        MISSION_NOT_FINISHED = "Please deliver posters!",
        MISSION_STOPPED_EXIT = "You stopped your current job.",
    },

    RegisterKey = {
        RCORE_BANNERS_EXIT_EDITOR = "Exit Editor",
        RCORE_BANNERS_WHEEL_UP = "Scale banner UP",
        RCORE_BANNERS_WHEEL_DOWN = "Scale banner DOWN",
        RCORE_BANNERS_CREATE_BANNER = "Create banner",
    },

    Production = {
        MENU_TITLE = "Banners production",
        START_PRINT_MENU_LABEL = "Start printing",
        START_PRINT_MENU_DESC = "Start printing banner yourself",
        LEAVE_PRINT_MENU_LABEL = "Leave printing",
        LEAVE_PRINT_MENU_DESC = "Come back later to continue production or let other employee finish it.",
    },

    Editor = {
        INVALID_BANNER_SIZES = "This banner is not valid!",
        EXIT = "Exit the editor",
        PLACE_BANNER = "Place banner",
        ADJUST_BANNER_SIZE_UP = "Increase size",
        ADJUST_BANNER_SIZE_DOWN = "Decrease size",

        BANNER_PLACE_ALLOWED = "✅ You can place banner here",
        OVERLAP_ERR = "❌ There is already a banner placed here.",
        INVALID_MATERIAL_ERR = "❌ You can't place banner on this surface.",
        TOO_FAR_ERR = "❌ The surface is too far.",
        BANNER_HEIGHT_ERR = "❌ You cannot place a banner this high up.",
        BANNER_UNDER_PLAYER_ERR = "❌ You cannot place banner on the ground.",
    }
}
