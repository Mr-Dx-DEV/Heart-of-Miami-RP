### rcore_piano

if you see error:  Bad binary format or syntax error near </1>

Read this guide: 
https://documentation.rcore.cz/cfx-auth-system/error-syntax-error-near-less-than-1-greater-than

i see "you lack the entitelment to run this resource"
Follow thid guide: https://documentation.rcore.cz/cfx-auth-system/you-lack-the-entitlement

Missing dependeny server:4752 -> Update your server to version 4752 or greater

---

Do you want to implement this script with some kind of your API?

How to open piano

```LUA
CreateThread(function()
    -- true is to open the piano
    -- false is to close the piano
   
    -- 25 is how far away the piano will sound

    TriggerEvent("rcore_piano:SetDisplayStatus", true, 25)
end)
```

Need to disable certian action when the player use the piano?

Client side
```LUA
Piano = exports.rcore_piano

CreateThread(function()
    -- result is true or false
    print(Piano:IsPlayerUsingInstrument())
end)
```

Server side
```LUA
Piano = exports.rcore_piano

CreateThread(function()
    -- result is true or false
    print(Piano:IsPlayerUsingInstrument(source))
end)
```

How to add / remove default template?

Client
```LUA
CreateThread(function()
    -- this is variable with notes for the piano
    local notes = {
        {
            wait = 125,
            instrument = 'piano',
            keys = {
                {
                    note = 'D',
                    octave = 2
                },
            },
        },
        {
            wait = 250,
            instrument = 'piano',
            keys = {
                {
                    note = 'D',
                    octave = 2
                },
            },
        },    
    }   


    -- This will add a music template to the piano
    -- player will be able to see it once this event
    -- is triggered
    TriggerEvent("rcore_piano:AddMusicTemplate", "The best name for it!", notes)              
    
    -- after 5 seconds
    Wait(5000)

    -- After this event will be triggered the template
    -- will be removed from the piano
    TriggerEvent("rcore_piano:RemoveMusicTemplate", "The best name for it!")
end)
```