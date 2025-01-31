local notif = loadstring(game:HttpGet("https://raw.githubusercontent.com/alriceeeee/roblox-stuff/refs/heads/main/notifsource.lua"))

notif:notify("Info", "This is an info notification by alriceeee")
notif:warn("Warning", "This is a warning notification by alriceeee")
notif:error("Error", "This is an error notification by alriceeee")
notif:success("Success", "This is a success notification by alriceeee")

notifmodule:custom({
    title = "Custom Title",
    description = "Custom Description",
    duration = 5,
    color = Color3.fromRGB(50, 50, 50),
    titlecolor = Color3.fromRGB(255, 0, 0),
    descriptioncolor = Color3.fromRGB(0, 255, 0)
})