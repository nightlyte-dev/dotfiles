-- smart_seek_back_playlist.lua
-- An mpv Lua keybinding that makes rewinding seamless across playlist items by switching to playlist-prev when a backward seek would cross time 0 and then seeking from the end of the previous file.

-- LEFT seeks back N seconds; if that would cross 0, jump to previous playlist entry
-- and seek from the end by the remaining amount.

local opts = {
	step = 1.0,
}
local options = require("mp.options")

options.read_options(opts, nil, function() end)

-- local step = 1.0 -- seconds per press (match your LEFT behavior)
local pending_from_end = nil

local function smart_seek_back()
	local pos = mp.get_property_number("time-pos")
	local plpos = mp.get_property_number("playlist-pos", 0)

	-- If time-pos is unknown (streams), just do normal seek.
	if pos == nil then
		mp.commandv("seek", opts.step, "relative")
		return
	end

	if pos < opts.step and plpos > 0 then
		pending_from_end = opts.step - pos
		-- Go to previous playlist entry (weak = do nothing if already first)
		mp.commandv("playlist-prev", "weak")
	else
		mp.commandv("seek", opts.step, "relative")
	end
end

mp.register_event("file-loaded", function()
	if pending_from_end ~= nil then
		-- Negative absolute seek counts from end of file; add exact for precision.
		-- Clamp tiny values to avoid corner cases.
		local t = pending_from_end
		if t < 0.05 then
			t = 0.05
		end
		mp.commandv("seek", -t, "absolute+exact")
		pending_from_end = nil
	end
end)

-- Override LEFT. Change "LEFT" to something else if you don’t want to replace it. You may need to comment out your original LEFT binding in input.conf.
mp.add_key_binding("Ctrl+WHEEL_DOWN", "smart_seek_back_playlist", smart_seek_back, { repeatable = true })

-- mp.add_key_binding("Meta+WHEEL_DOWN", "smart_seek_back_playlist", smart_seek_back, { repeatable = true, step = 6.0 })
mp.add_key_binding("LEFT", "smart_seek_back_playlist", smart_seek_back, { repeatable = true })
