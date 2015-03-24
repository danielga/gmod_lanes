#ifndef __LANES_DEEP_H__
#define __LANES_DEEP_H__ 1

/*
 * public 'deep' API to be used by external modules if they want to implement Lanes-aware userdata
 * said modules will have to link against lanes (it is not really possible to separate the 'deep userdata' implementation from the rest of Lanes)
 */


#include "lua.h"

enum eDeepOp
{
	eDO_new,
	eDO_delete,
	eDO_metatable,
	eDO_module,
};

typedef void* (*luaG_IdFunction)( lua_State* L, enum eDeepOp op_);

extern int luaG_newdeepuserdata( lua_State* L, luaG_IdFunction idfunc);
extern void* luaG_todeep( lua_State* L, luaG_IdFunction idfunc, int index);
extern void luaG_pushdeepversion( lua_State* L);

#endif // __LANES_DEEP_H__
