SDK_FOLDER = "E:/Programming/source-sdk-2013/mp/src"
GARRYSMOD_MODULE_BASE_FOLDER = "../gmod-module-base"
SOURCE_FOLDER = "../Source"
PROJECT_FOLDER = os.get() .. "/" .. _ACTION

solution("gm_lanes_core")
	language("C++")
	location(PROJECT_FOLDER)
	warnings("Extra")
	flags({"NoPCH", "StaticRuntime"})
	platforms({"x86"})
	configurations({"Release", "Debug"})

	filter("platforms:x86")
		architecture("x32")

	filter("configurations:Release")
		optimize("On")
		vectorextensions("SSE2")
		objdir(PROJECT_FOLDER .. "/Intermediate")
		targetdir(PROJECT_FOLDER .. "/Release")

	filter({"configurations:Debug"})
		flags({"Symbols"})
		objdir(PROJECT_FOLDER .. "/Intermediate")
		targetdir(PROJECT_FOLDER .. "/Debug")

	project("gmsv_lanes_core")
		kind("SharedLib")
		defines({"GMMODULE", "LANES_SERVER"})
		includedirs({
			SOURCE_FOLDER,
			GARRYSMOD_MODULE_BASE_FOLDER .. "/include"
		})
		files({SOURCE_FOLDER .. "/*.h", SOURCE_FOLDER .. "/*.c", SOURCE_FOLDER .. "/*.cpp"})
		vpaths({
			["Header files"] = SOURCE_FOLDER .. "/**.h",
			["Source files"] = {
				SOURCE_FOLDER .. "/**.cpp",
				SOURCE_FOLDER .. "/**.c",
			}
		})

		targetprefix("")
		targetextension(".dll")

		filter("system:windows")
			libdirs({GARRYSMOD_MODULE_BASE_FOLDER})
			links({"lua_shared"})
			targetsuffix("_win32")

		filter("system:linux")
			defines({"POSIX", "GNUC", "_LINUX"})
			linkoptions({GARRYSMOD_MODULE_BASE_FOLDER .. "/lua_shared_srv.so"})
			buildoptions({"-std=c++11"})
			targetsuffix("_linux")

		filter({"system:macosx"})
			libdirs({GARRYSMOD_MODULE_BASE_FOLDER})
			links({"lua_shared"})
			buildoptions({"-std=c++11"})
			targetsuffix("_mac")

	project("gmcl_lanes_core")
		kind("SharedLib")
		defines({"GMMODULE", "LANES_CLIENT"})
		includedirs({
			SOURCE_FOLDER,
			GARRYSMOD_MODULE_BASE_FOLDER .. "/include"
		})
		files({SOURCE_FOLDER .. "/*.h", SOURCE_FOLDER .. "/*.c", SOURCE_FOLDER .. "/*.cpp"})
		vpaths({
			["Header files"] = SOURCE_FOLDER .. "/**.h",
			["Source files"] = {
				SOURCE_FOLDER .. "/**.cpp",
				SOURCE_FOLDER .. "/**.c",
			}
		})

		targetprefix("")
		targetextension(".dll")

		filter("system:windows")
			libdirs({GARRYSMOD_MODULE_BASE_FOLDER})
			links({"lua_shared"})
			targetsuffix("_win32")

		filter("system:linux")
			defines({"POSIX", "GNUC", "_LINUX"})
			linkoptions({GARRYSMOD_MODULE_BASE_FOLDER .. "/lua_shared_srv.so"})
			buildoptions({"-std=c++11"})
			targetsuffix("_linux")

		filter({"system:macosx"})
			libdirs({GARRYSMOD_MODULE_BASE_FOLDER})
			links({"lua_shared"})
			buildoptions({"-std=c++11"})
			targetsuffix("_mac")
