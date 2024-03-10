# ScriptPersonal
For people want to use my script

# HttpSpy
logging other people link

```lua
shared.HttpSpy = {}
shared.HttpSpy.Notifications = true -- enable this to make it send notification if detect link
shared.HttpSpy.AntiHttpGet = true -- enable this to make the script that have library inside like loadstring etc not execute
shared.HttpSpy.AntiRequest = true -- enable this to make the request sender like discord etc not working
shared.HttpSpy.AntiKick = true -- enable this to disabled the script from kick you or shutdown your game
shared.HttpSpy.AntiFPS = true -- enable this to make the script that set your fps like 0 or change your set fps setting to other thing will make it not working
loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/ScriptPersonal/main/HttpSpy.lua", true))()
```
