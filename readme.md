# gmod\_lanes

Modules for Garry's Mod that add threads through [Lua Lanes][1].  

## General information

This project is composed by the main module (`lanes.lua`) and the internal module (`gm[cl/sv]_lanes_core_[win32/linux/macos].dll`).  
You can also refer to this project as gm_lanes or Lanes for Garry's Mod.  
`lanes.lua` goes into `lua/includes/modules` and `gm[cl/sv]_lanes_core_[win32/linux/macos].dll` goes into `lua/bin`.  

## Requirements

This project requires [garrysmod\_common][2], a framework to facilitate the creation of compilations files (Visual Studio, make, XCode, etc). Simply set the environment variable '**GARRYSMOD\_COMMON**' or the premake option '**gmcommon**' to the path of your local copy of [garrysmod\_common][2].  

  [1]: https://lualanes.github.io/lanes
  [2]: https://github.com/danielga/garrysmod_common
