# rcore_banners

**Follow the installation guide in documentation link below, please!**

## **Documentation**
If you have any questions, please take a look into our rich documentation containing all features, settings and more!

**📚 Documentation https://documentation.rcore.cz/paid-resources/rcore_banners** <br/><br/>

If you still have any questions after reading documentation, feel free to reach out to us on our discord!

📧 https://discord.gg/F28PfsY

***

**Commands**

/banners - Command used for opening main dashboard, where are all banners.
/banners_debug -  Command used for admins, which allows to see info about closest banners around ped if any found.
/billboardHide - Command used for hiding billboards - it will enable tool, which allows to select billboards to hide!.
/billboardHideMarker - Command used for hiding billboards interaction marker
/set_business_job - Command used for setting player job (only standalone servers without framework)
/debug_banners_visible - commnd used for helping with issue when billboards/posters not visible.
/debug_banners_player - commnd used for helping with issue with accessing billboard

**Hosting banner images**

We can recommend to use [Gyazo](gyazo.com) for hosting your banner images.

*Imgur*
Imgur cannot be used since restrictions were set in place by - [read more](https://github.com/citizenfx/fivem/pull/2407)

*Discord*
Discord cannot be used since restrictions were set in place by - [read more](https://www.reddit.com/media?url=https%3A%2F%2Fpreview.redd.it%2Fnot-sure-if-this-is-real-v0-t2yhv60cj3rb1.jpg%3Fauto%3Dwebp%26s%3D00cedeec15b58db36a1ea444957fcb11decbba55)
*Note* Creating banners using images hosted on discord CDN was internally disabled in our frontend.

**Banners/Billboards  not visible**

To help you resolve this issue type this command into your txAdmin live console: debug_banners_visible 

**Cannot access billboards why?**

Type this client command in your F8 which will help to find out with resolution step - type this into your in-game chat /debug_banners_player or in your F8 debug_banners_player.