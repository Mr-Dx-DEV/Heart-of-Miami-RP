You are able to use this script but do don't reupload it or sell it.
If you got any questions feel free to ask me at discord luthanirgi#4471.

This script allow you to sleep or having sex with a girlfriend/boyfriend on the bed. And also allow you to having pregnant!

How to install:
1. Unzip and Rename to SleepOrSex
2. Add SQL to your databse
3. Configure the config.lua
4. Configure the language on locales/en.lua
5. Add the image for new items put this on your inventory
6. Put the items on the shop or what u want
7. Drag SleepOrSex in your resources folder
8. Make sure you have bed props on the server and edit Config.Bed on config.lua (using ymap or maybe mlo?) 
example: https://www.youtube.com/watch?v=5rNsgfxzVVo
9. ensure SleepOrSex on your server.cfg
10. Have sex!

Q&A

Q: There is no option for sleep/sex
A: Make sure the bed is recognize as a props dont use gta v default because beds is spawn as interior not a props (point 8)

Q: Script wont start, error in the console (lack of.....)
A: Make sure you using the same keymaster email with cfx.re

Q: Script wont start, error in the console (qtarget/qb-target.....)
A: Make sure you run SleepOrSex after PolyZone and qtarget/qb-target

Q: Script wont start, error in the console (RegisterCommand.....)
A: Dont false RegisterCommand in the config!

Q: I want to change any clothes in standalone version, how to do it?
A: This one is example:
    1. Search first on your any clothing script what cloth do you want.
    2. Example, you want using torso 200 and texture 4
    3. Then you change this function on config.lua
    SetPedComponentVariation(GetPlayerPed(-1), 11, 109, 1, 0)--torso
    into
    SetPedComponentVariation(GetPlayerPed(-1), 11, 200, 4, 0)--torso
 
Q: Pregnant function not working
A: Make sure value for Config.AllowPregnant is true