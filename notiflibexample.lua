local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/roblox-stuff/main/refs/notifsource.lua"))

notif:notify("Info", "This is an info notification")
notif:warn("Warning", "This is a warning notification")
notif:error("Error", "This is an error notification")
notif:success("Success", "This is a success notification")

notif:custom({
    title = "Custom",
    description = "This is a custom notification",
    duration = 3,
    color = Color3.fromRGB(255, 0, 255),
    icon = "rbxassetid://youriconid"
})