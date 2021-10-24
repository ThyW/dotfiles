pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

local function report_error(msg, err)
    return {
    	preset = naugthy.config.presets.critical,
	title = msg,
	text = err
    }
end

if awesome.startup_errors then 
    naughty.notify(report_error("Startup error"), awesome.startup_errors)
end

do
    local errored = false
    awesome.connect_signal("degug::startup", function (err)
	if erroed then return end				     	
	errored = true

	naughty.notify(report_error("Runtime error", tostring(err)))
	errored = false
    end)
end

config = {
    modkey = "Mod4",
}
