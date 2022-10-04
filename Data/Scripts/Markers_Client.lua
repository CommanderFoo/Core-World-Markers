---@type Folder
local ROOT = script:GetCustomProperty("Root"):WaitForObject()

local CONTAINER = script:GetCustomProperty("Container"):WaitForObject()
local OFFSET = ROOT:GetCustomProperty("EdgeOffset")
local WORLD_OFFSET = ROOT:GetCustomProperty("WorldOffset")
local WORLD_MARKERS = require(script:GetCustomProperty("WorldMarkers"))

local LOCAL_PLAYER = Game.GetLocalPlayer()

local markers = {}

local function remove_marker(key)
	if(markers[key]) then
		markers[key].marker:Destroy()
		markers[key] = nil
	end
end

local function add_marker(key)
	local row = WORLD_MARKERS[key]

	if(row == nil) then
		return
	end

	local marker = World.SpawnAsset(row.Icon, { parent = CONTAINER })

	markers[key] = { marker = marker, target = row.Target:GetObject() }
end

function Tick(dt)
	for key, row in pairs(markers) do
		local target_pos = row.target:GetWorldPosition() + (Vector3.UP * WORLD_OFFSET)
		local screen = UI.GetScreenSize()
		local screen_pos = UI.GetScreenPosition(target_pos)

		if(screen_pos ~= nil) then
			screen_pos.x = screen_pos.x - screen.x / 2
			screen_pos.y = screen_pos.y - screen.y / 2

			row.marker.x = CoreMath.Clamp(screen_pos.x, -screen.x / 2 + OFFSET, screen.x / 2 - OFFSET)
			row.marker.y = CoreMath.Clamp(screen_pos.y, -screen.y / 2 + OFFSET, screen.y / 2 - OFFSET)
		else
			local player_pos = LOCAL_PLAYER:GetWorldPosition()
			local point = (target_pos - player_pos)

			local view_rot = LOCAL_PLAYER:GetViewWorldRotation()
			local view_right = Quaternion.New(view_rot):GetRightVector()
			local dir = point:GetNormalized()

			row.marker.x = (view_right .. dir) * (screen.x - OFFSET) / 2
			row.marker.y = screen.y / 2 - OFFSET
		end
	end
end

for key, row in pairs(WORLD_MARKERS) do
	add_marker(key)
end

Events.Connect("Marker.Remove", remove_marker)
Events.Connect("Marker.Add", add_marker)
