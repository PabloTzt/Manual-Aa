local checkbox = ui.new_checkbox
local combobox = ui.new_combobox
local reference = ui.reference
local getui = ui.get
local visibility = ui.set_visible
local setui = ui.set
local slider = ui.new_slider
local multi = ui.new_multiselect
local hotkey = ui.new_hotkey
local indicator = renderer.indicator
local colorpicker = ui.new_color_picker
local text = renderer.text

local w, h = client.screen_size()

local enableCheckbox = checkbox("AA", "Anti-aimbot angles", "Manual AA")
local directionCombobox = combobox("AA", "Anti-aimbot angles", "Direction", "Left", "Right", "Back")

local pitchComboboxL = combobox("AA", "Anti-aimbot angles", "Pitch", "Off", "Default", "Up", "Down", "Minimal", "Random")
local yawbaseComboboxL = combobox("AA", "Anti-aimbot angles", "Yaw base", "Local view", "At targets", "Movement direction")
local yawComboboxL = combobox("AA", "Anti-aimbot angles", "Yaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair")
local yawAngleSliderL = slider("AA", "Anti-aimbot angles", "Yaw angle", -180, 180, 0, true)
local yawJitterComboboxL = combobox("AA", "Anti-aimbot angles", "Yaw jitter", "Off", "Offset", "Center", "Random")
local jitterAngleSliderL = slider("AA", "Anti-aimbot angles", "Yaw jitter angle", -180, 180, 0, true)
local bodyYawComboboxL = combobox("AA", "Anti-aimbot angles", "Body yaw", "Off", "Opposite", "Jitter", "Static")
local bodyYawAngleSliderL = slider("AA", "Anti-aimbot angles", "Body yaw angle", -180, 180, 0, true)
local fakeYawLimitSliderL = slider("AA", "Anti-aimbot angles", "Fake yaw limit", 0, 60, 60, true)
local freestandingMultiL = multi("AA", "Anti-aimbot angles", "Freestanding", "Default", "Edge")

local pitchComboboxR = combobox("AA", "Anti-aimbot angles", "Pitch", "Off", "Default", "Up", "Down", "Minimal", "Random")
local yawbaseComboboxR = combobox("AA", "Anti-aimbot angles", "Yaw base", "Local view", "At targets", "Movement direction")
local yawComboboxR = combobox("AA", "Anti-aimbot angles", "Yaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair")
local yawAngleSliderR = slider("AA", "Anti-aimbot angles", "Yaw angle", -180, 180, 0, true)
local yawJitterComboboxR = combobox("AA", "Anti-aimbot angles", "Yaw jitter", "Off", "Offset", "Center", "Random")
local jitterAngleSliderR = slider("AA", "Anti-aimbot angles", "Yaw jitter angle", -180, 180, 0, true)
local bodyYawComboboxR = combobox("AA", "Anti-aimbot angles", "Body yaw", "Off", "Opposite", "Jitter", "Static")
local bodyYawAngleSliderR = slider("AA", "Anti-aimbot angles", "Body yaw angle", -180, 180, 0, true)
local fakeYawLimitSliderR = slider("AA", "Anti-aimbot angles", "Fake yaw limit", 0, 60, 60, true)
local freestandingMultiR = multi("AA", "Anti-aimbot angles", "Freestanding", "Default", "Edge")

local pitchComboboxB = combobox("AA", "Anti-aimbot angles", "Pitch", "Off", "Default", "Up", "Down", "Minimal", "Random")
local yawbaseComboboxB = combobox("AA", "Anti-aimbot angles", "Yaw base", "Local view", "At targets", "Movement direction")
local yawComboboxB = combobox("AA", "Anti-aimbot angles", "Yaw", "Off", "180", "Spin", "Static", "180 Z", "Crosshair")
local yawAngleSliderB = slider("AA", "Anti-aimbot angles", "Yaw angle", -180, 180, 0, true)
local yawJitterComboboxB = combobox("AA", "Anti-aimbot angles", "Yaw jitter", "Off", "Offset", "Center", "Random")
local jitterAngleSliderB = slider("AA", "Anti-aimbot angles", "Yaw jitter angle", -180, 180, 0, true)
local bodyYawComboboxB = combobox("AA", "Anti-aimbot angles", "Body yaw", "Off", "Opposite", "Jitter", "Static")
local bodyYawAngleSliderB = slider("AA", "Anti-aimbot angles", "Body yaw angle", -180, 180, 0, true)
local fakeYawLimitSliderB = slider("AA", "Anti-aimbot angles", "Fake yaw limit", 0, 60, 60, true)
local freestandingMultiB = multi("AA", "Anti-aimbot angles", "Freestanding", "Default", "Edge")

local pitch = reference("AA", "Anti-aimbot angles", "Pitch")
local yawBase = reference("AA", "Anti-aimbot angles", "Yaw base")
local yaw, yawAngle = reference("AA", "Anti-aimbot angles", "Yaw")
local yawJitter, yawJitterAngle = reference("AA", "Anti-aimbot angles", "Yaw jitter")
local bodyYaw, bodyYawAngle = reference("AA", "Anti-aimbot angles", "Body yaw")
local fakeYawLimit = reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local freestanding = reference("AA", "Anti-aimbot angles", "Freestanding")

local indicatorCombobox = combobox("AA", "Anti-aimbot angles", "Indicator type", "Off", "Indicator", "Text", "Crosshair text", "Crosshair icon")
local indicatorColor = colorpicker("AA", "Anti-aimbot angles", "Indicator type", 255, 255, 255, 255)

local lrHk = hotkey("AA", "Anti-aimbot angles", "Left / right", false)
local bHk = hotkey("AA", "Anti-aimbot angles", "Back", false)

local function on_paint(ctx)
	if getui(enableCheckbox, true) then
		visibility(directionCombobox, true)
		visibility(pitch, false)
		visibility(yawBase, false)
		visibility(yaw, false)
		visibility(yawAngle, false)
		visibility(yawJitter, false)
		visibility(yawJitterAngle, false)
		visibility(bodyYaw, false)
		visibility(bodyYawAngle, false)
		visibility(fakeYawLimit, false)
		visibility(freestanding, false)

		visibility(indicatorCombobox, true)
		visibility(indicatorColor, true)

		if getui(directionCombobox) == "Left" then
			visibility(pitchComboboxL, true)
			visibility(yawbaseComboboxL, true)
			visibility(yawComboboxL, true)
			visibility(yawAngleSliderL, true)
			visibility(yawJitterComboboxL, true)
			visibility(jitterAngleSliderL, true)
			visibility(bodyYawComboboxL, true)
			visibility(bodyYawAngleSliderL, true)
			visibility(fakeYawLimitSliderL, true)
			visibility(freestandingMultiL, true)

			setui(pitch, getui(pitchComboboxL))
			setui(yawBase, getui(yawbaseComboboxL))
			setui(yaw, getui(yawComboboxL))
			setui(yawAngle, getui(yawAngleSliderL))
			setui(yawJitter, getui(yawJitterComboboxL))
			setui(yawJitterAngle, getui(jitterAngleSliderL))
			setui(bodyYaw, getui(bodyYawComboboxL))
			setui(bodyYawAngle, getui(bodyYawAngleSliderL))
			setui(fakeYawLimit, getui(fakeYawLimitSliderL))
			setui(freestanding, getui(freestandingMultiL))

			if getui(yawComboboxL) == "Off" then
				visibility(yawAngleSliderL, false)
			end

			if getui(yawJitterComboboxL) == "Off" then
				visibility(jitterAngleSliderL, false)
			end

			if getui(bodyYawComboboxL) == "Opposite" then
				visibility(bodyYawAngleSliderL, false)
			end

			if getui(bodyYawComboboxL) == "Off" then
				visibility(bodyYawAngleSliderL, false)
				visibility(fakeYawLimitSliderL, false)
			end

			local r, g, b, a = getui(indicatorColor)

			if getui(indicatorCombobox) == "Off" then

			elseif getui(indicatorCombobox) == "Indicator" then
				indicator(r, g, b, a, "Left")
			elseif getui(indicatorCombobox) == "Text" then
				text(5, h / 2, 255, 255, 255, 255, "", 0, "Anti-aimbot direction:")
				text(120, h / 2, r, g, b, a, "", 0, "Left")
			elseif getui(indicatorCombobox) == "Crosshair text" then
				text(w / 2, h / 2 + 17, r, g, b, a, "c", 0, "Left")
			elseif getui(indicatorCombobox) == "Crosshair icon" then
				text(w / 2 - 20, h / 2 - 3, r, g, b, a, "c+", 0, "⯇")
			end
		else
			visibility(pitchComboboxL, false)
			visibility(yawbaseComboboxL, false)
			visibility(yawComboboxL, false)
			visibility(yawAngleSliderL, false)
			visibility(yawJitterComboboxL, false)
			visibility(jitterAngleSliderL, false)
			visibility(bodyYawComboboxL, false)
			visibility(bodyYawAngleSliderL, false)
			visibility(fakeYawLimitSliderL, false)
			visibility(freestandingMultiL, false)
		end

		if getui(directionCombobox) == "Right" then
			visibility(pitchComboboxR, true)
			visibility(yawbaseComboboxR, true)
			visibility(yawComboboxR, true)
			visibility(yawAngleSliderR, true)
			visibility(yawJitterComboboxR, true)
			visibility(jitterAngleSliderR, true)
			visibility(bodyYawComboboxR, true)
			visibility(bodyYawAngleSliderR, true)
			visibility(fakeYawLimitSliderR, true)
			visibility(freestandingMultiR, true)

			setui(pitch, getui(pitchComboboxR))
			setui(yawBase, getui(yawbaseComboboxR))
			setui(yaw, getui(yawComboboxR))
			setui(yawAngle, getui(yawAngleSliderR))
			setui(yawJitter, getui(yawJitterComboboxR))
			setui(yawJitterAngle, getui(jitterAngleSliderR))
			setui(bodyYaw, getui(bodyYawComboboxR))
			setui(bodyYawAngle, getui(bodyYawAngleSliderR))
			setui(fakeYawLimit, getui(fakeYawLimitSliderR))
			setui(freestanding, getui(freestandingMultiR))

			if getui(yawComboboxR) == "Off" then
				visibility(yawAngleSliderR, false)
			end

			if getui(yawJitterComboboxR) == "Off" then
				visibility(jitterAngleSliderR, false)
			end

			if getui(bodyYawComboboxR) == "Opposite" then
				visibility(bodyYawAngleSliderR, false)
			end

			if getui(bodyYawComboboxR) == "Off" then
				visibility(bodyYawAngleSliderR, false)
				visibility(fakeYawLimitSliderR, false)
			end

			local r, g, b, a = getui(indicatorColor)

			if getui(indicatorCombobox) == "Off" then

			elseif getui(indicatorCombobox) == "Indicator" then
				indicator(r, g, b, a, "Right")
			elseif getui(indicatorCombobox) == "Text" then
				text(5, h / 2, 255, 255, 255, 255, "", 0, "Anti-aimbot direction:")
				text(120, h / 2, r, g, b, a, "", 0, "Right")
			elseif getui(indicatorCombobox) == "Crosshair text" then
				text(w / 2, h / 2 + 17, r, g, b, a, "c", 0, "Right")
			elseif getui(indicatorCombobox) == "Crosshair icon" then
				text(w / 2 + 20, h / 2 - 3, r, g, b, a, "c+", 0, "⯈")
			end
		else
			visibility(pitchComboboxR, false)
			visibility(yawbaseComboboxR, false)
			visibility(yawComboboxR, false)
			visibility(yawAngleSliderR, false)
			visibility(yawJitterComboboxR, false)
			visibility(jitterAngleSliderR, false)
			visibility(bodyYawComboboxR, false)
			visibility(bodyYawAngleSliderR, false)
			visibility(fakeYawLimitSliderR, false)
			visibility(freestandingMultiR, false)
		end

		if getui(directionCombobox) == "Back" then
			visibility(pitchComboboxB, true)
			visibility(yawbaseComboboxB, true)
			visibility(yawComboboxB, true)
			visibility(yawAngleSliderB, true)
			visibility(yawJitterComboboxB, true)
			visibility(jitterAngleSliderB, true)
			visibility(bodyYawComboboxB, true)
			visibility(bodyYawAngleSliderB, true)
			visibility(fakeYawLimitSliderB, true)
			visibility(freestandingMultiB, true)

			setui(pitch, getui(pitchComboboxB))
			setui(yawBase, getui(yawbaseComboboxB))
			setui(yaw, getui(yawComboboxB))
			setui(yawAngle, getui(yawAngleSliderB))
			setui(yawJitter, getui(yawJitterComboboxB))
			setui(yawJitterAngle, getui(jitterAngleSliderB))
			setui(bodyYaw, getui(bodyYawComboboxB))
			setui(bodyYawAngle, getui(bodyYawAngleSliderB))
			setui(fakeYawLimit, getui(fakeYawLimitSliderB))
			setui(freestanding, getui(freestandingMultiB))

			if getui(yawComboboxB) == "Off" then
				visibility(yawAngleSliderB, false)
			end

			if getui(yawJitterComboboxB) == "Off" then
				visibility(jitterAngleSliderB, false)
			end

			if getui(bodyYawComboboxB) == "Opposite" then
				visibility(bodyYawAngleSliderB, false)
			end

			if getui(bodyYawComboboxB) == "Off" then
				visibility(bodyYawAngleSliderB, false)
				visibility(fakeYawLimitSliderB, false)
			end

			local r, g, b, a = getui(indicatorColor)

			if getui(indicatorCombobox) == "Off" then

			elseif getui(indicatorCombobox) == "Indicator" then
				indicator(r, g, b, a, "Back")
			elseif getui(indicatorCombobox) == "Text" then
				text(5, h / 2, 255, 255, 255, 255, "", 0, "Anti-aimbot direction:")
				text(120, h / 2, r, g, b, a, "", 0, "Back")
			elseif getui(indicatorCombobox) == "Crosshair text" then
				text(w / 2, h / 2 + 17, r, g, b, a, "c", 0, "Back")
			elseif getui(indicatorCombobox) == "Crosshair icon" then
				text(w / 2, h / 2 + 20, r, g, b, a, "c+", 0, "⯆")
			end
		else
			visibility(pitchComboboxB, false)
			visibility(yawbaseComboboxB, false)
			visibility(yawComboboxB, false)
			visibility(yawAngleSliderB, false)
			visibility(yawJitterComboboxB, false)
			visibility(jitterAngleSliderB, false)
			visibility(bodyYawComboboxB, false)
			visibility(bodyYawAngleSliderB, false)
			visibility(fakeYawLimitSliderB, false)
			visibility(freestandingMultiB, false)
		end

		if getui(lrHk) then
			setui(directionCombobox, "Left")
		else
			setui(directionCombobox, "Right")
		end

		if getui(bHk) then
			setui(directionCombobox, "Back")
		end
	else
		visibility(directionCombobox, false)
		visibility(pitch, true)
		visibility(yawBase, true)
		visibility(yaw, true)
		visibility(yawAngle, true)
		visibility(yawJitter, true)
		visibility(yawJitterAngle, true)
		visibility(bodyYaw, true)
		visibility(bodyYawAngle, true)
		visibility(fakeYawLimit, true)
		visibility(freestanding, true)

		visibility(indicatorCombobox, false)
		visibility(indicatorColor, false)

		visibility(pitchComboboxL, false)
		visibility(yawbaseComboboxL, false)
		visibility(yawComboboxL, false)
		visibility(yawAngleSliderL, false)
		visibility(yawJitterComboboxL, false)
		visibility(jitterAngleSliderL, false)
		visibility(bodyYawComboboxL, false)
		visibility(bodyYawAngleSliderL, false)
		visibility(fakeYawLimitSliderL, false)
		visibility(freestandingMultiL, false)

		visibility(pitchComboboxR, false)
		visibility(yawbaseComboboxR, false)
		visibility(yawComboboxR, false)
		visibility(yawAngleSliderR, false)
		visibility(yawJitterComboboxR, false)
		visibility(jitterAngleSliderR, false)
		visibility(bodyYawComboboxR, false)
		visibility(bodyYawAngleSliderR, false)
		visibility(fakeYawLimitSliderR, false)
		visibility(freestandingMultiR, false)

		visibility(pitchComboboxB, false)
		visibility(yawbaseComboboxB, false)
		visibility(yawComboboxB, false)
		visibility(yawAngleSliderB, false)
		visibility(yawJitterComboboxB, false)
		visibility(jitterAngleSliderB, false)
		visibility(bodyYawComboboxB, false)
		visibility(bodyYawAngleSliderB, false)
		visibility(fakeYawLimitSliderB, false)
		visibility(freestandingMultiB, false)
	end
end

client.set_event_callback('paint', on_paint)
