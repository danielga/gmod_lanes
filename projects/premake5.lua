newoption({
	trigger = "gmcommon",
	description = "Sets the path to the garrysmod_common (https://github.com/danielga/garrysmod_common) directory",
	value = "path to garrysmod_common directory"
})

local gmcommon = _OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON")
if gmcommon == nil then
	error("you didn't provide a path to your garrysmod_common (https://github.com/danielga/garrysmod_common) directory")
end

include(gmcommon)

local LANES_DIRECTORY = "../lanes/src"

CreateWorkspace({name = "lanes.core"})
	CreateProject({serverside = true})
		includedirs(LANES_DIRECTORY)
		IncludeLuaShared()
		links("lanes")

	CreateProject({serverside = false})
		includedirs(LANES_DIRECTORY)
		IncludeLuaShared()
		links("lanes")

	project("lanes")
		kind("StaticLib")
		warnings("Off")
		includedirs(LANES_DIRECTORY)
		files({LANES_DIRECTORY .. "/*.c", LANES_DIRECTORY .. "/*.h"})
		vpaths({
			["Source files/*"] = LANES_DIRECTORY .. "/*.c",
			["Header files/*"] = LANES_DIRECTORY .. "/*.h"
		})
		IncludeLuaShared()
