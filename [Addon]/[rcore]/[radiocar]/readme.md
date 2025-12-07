# rcore_radiocar

## instalation guide + how to use in game

https://documentation.rcore.cz/paid-resources/rcore_radiocar#installation-guide

## quick troubleshoot

i recommend use this script only if you have onesync enabled.

if you see error:  Bad binary format or syntax error near </1>

Read this guide: 
https://documentation.rcore.cz/cfx-auth-system/error-syntax-error-near-less-than-1-greater-than

i see "you lack the entitelment to run this resource"
Follow thid guide: https://documentation.rcore.cz/cfx-auth-system/you-lack-the-entitlement


------------
**Server side functions (all those below are from export)**

 - GiveRadioToCar(LicensePlate, typeRadio)<br>will add to the car the radio.
 
 - HasCarRadio(LicensePlate)<br>will return true/false
 
 - HasCarRadioType(LicensePlate, TypeRadio)<br>will return true/false
 
 - RemoveRadioFromCar(LicensePlate)<br>will remove radio from the car (wont stop music)
 
------------


for VIP access only

- add_ace group.vip radiocar.use allow