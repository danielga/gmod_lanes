#include <GarrysMod/Lua/Interface.h>
extern "C"
{
	#include <lanes.h>
}

GMOD_MODULE_OPEN( )
{
	LUA->Pop( 1 );
	LUA->PushString( "lanes_core" );
	LUA->PushSpecial( GarrysMod::Lua::SPECIAL_GLOB );
	LUA->GetField( -1, "lanes" );
	if( luaopen_lanes_core( state ) >= 1 )
		LUA->SetField( -2, "core" );

	return 0;
}

GMOD_MODULE_CLOSE( )
{
	(void)state;
	return 0;
}