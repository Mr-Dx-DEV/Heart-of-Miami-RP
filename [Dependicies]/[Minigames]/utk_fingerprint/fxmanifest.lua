shared_script '@vLife/ai_module_fg-obfuscated.lua'
shared_script '@vLife/shared_fg-obfuscated.lua'
fx_version "adamant"

game "gta5"

files {
    "movies/script.js",
    "movies/style.css",
    "movies/intro.gif",
    "movies/success.gif",
    "movies/fail.gif",
    "movies/blank.png",
    "movies/movie.html",
}

ui_page "movies/movie.html"

client_script "client.lua"

dependency "utk_hackdependency"