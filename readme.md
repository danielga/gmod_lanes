gmod_lanes
==========

Modules for Garry's Mod that add threads.

Info
-------

This project is composed by the main module (lanes.lua) and the internal module (gm_lanes_core).
You can also refer to this project as gm_lanes or Lanes for Garry's Mod.
lanes.lua goes into lua/includes/modules and gm[cl/sv]\_lanes_core\_[win32/linux/macos].dll goes into lua/bin.

Credits to Lua Lanes developers. I've only adapted it to Garry's Mod.

Mac was not tested at all (sorry but I'm cheap and lazy).

If stuff starts erroring or fails to work, be sure to check the correct line endings (\n and such) are present in the files for each OS.

The required Garry's Mod headers to build modules are already included as externals. Thank me later. You might also find some useful stuff there.