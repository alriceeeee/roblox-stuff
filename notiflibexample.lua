local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/roblox-stuff/refs/heads/main/notifsource.lua"))

notif:notify("Info", "This is an info notification by alriceeee")
notif:warn("Warning", "This is a warning notification by alriceeee")
notif:error("Error", "This is an error notification by alriceeee")
notif:success("Success", "This is a success notification by alriceeee")

notif:custom({
    title = "Custom by alriceeee",
    description = "This is a custom notification by alriceeee",
    duration = 3,
    color = Color3.fromRGB(255, 0, 255),
    icon = "rbxassetid://youriconid"
})