newoption({
	trigger = "gmcommon",
	description = "Sets the path to the garrysmod_common (https://github.com/danielga/garrysmod_common) directory",
	value = "path to garrysmod_common directory"
})

local gmcommon = _OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON")
assert(gmcommon ~= nil, "you didn't provide a path to your garrysmod_common (https://github.com/danielga/garrysmod_common) directory")
include(path.join(gmcommon, "generator.v2.lua"))

local LANES_DIRECTORY = "lanes/src"

CreateWorkspace({name = "lanes.core"})
	CreateProject({serverside = true})
		includedirs(LANES_DIRECTORY)
		links("lanes")
		IncludeLuaShared()

	CreateProject({serverside = false})
		includedirs(LANES_DIRECTORY)
		links("lanes")
		IncludeLuaShared()

	project("lanes")
		kind("StaticLib")
		warnings("Default")
		includedirs(LANES_DIRECTORY)
		files({path.join(LANES_DIRECTORY, "*.c"), path.join(LANES_DIRECTORY, "*.h")})
		vpaths({
			["Source files/*"] = path.join(LANES_DIRECTORY, "*.c"),
			["Header files/*"] = path.join(LANES_DIRECTORY, "*.h")
		})
		IncludeLuaShared()

		filter("system:linux")
			defines("_GNU_SOURCE")
