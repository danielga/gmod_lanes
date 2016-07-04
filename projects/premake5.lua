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

CreateWorkspace({name = "lanes_core"})
	CreateProject({serverside = true})
		includedirs(LANES_DIRECTORY)
		vpaths({["lanes"] = LANES_DIRECTORY .. "/*.c"})
		files(LANES_DIRECTORY .. "/*.c")
		IncludeLuaShared()

	CreateProject({serverside = false})
		includedirs(LANES_DIRECTORY)
		vpaths({["lanes"] = "../lanes/src/*.c"})
		files(LANES_DIRECTORY .. "/*.c")
		IncludeLuaShared()
