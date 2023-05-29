#include <GarrysMod/Lua/Interface.h>

extern "C"
{
	#include <lanes.h>

	int luaopen_io( lua_State * )
	{
		return 0;
	}

	int luaopen_ffi( lua_State * )
	{
		return 0;
	}
}

GMOD_MODULE_OPEN( )
{
	LUA->Pop( 1 );
	LUA->PushString( "lanes.core" );

	LUA->GetField( GarrysMod::Lua::INDEX_GLOBAL, "lanes" );
	if( luaopen_lanes_core( LUA->GetState( ) ) >= 1 )
		LUA->SetField( -2, "core" );

	return 0;
}

GMOD_MODULE_CLOSE( )
{
	LUA->GetField( GarrysMod::Lua::INDEX_GLOBAL, "lanes" );
	LUA->PushNil( );
	LUA->SetField( -2, "core" );
	return 0;
}
