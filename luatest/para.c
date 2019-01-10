#include "lua.h"  
#include "lauxlib.h"  
#include "lualib.h"  
#include <string.h>
#include <stdio.h>
void main()  
{  
    //1.创建一个state  
    lua_State *L = luaL_newstate();  
       
    //2.入栈操作  
    lua_pushstring(L, "I am so cool~");   
    lua_pushnumber(L,20);  
  
    printf("%d\n",lua_gettop(L));
    //3.取值操作  
    if( lua_isstring(L,1)){             //判断是否可以转为string  
       printf("%s\n", lua_tostring(L,1));  //转为string并返回  
    }  
    printf("%d\n",lua_gettop(L));
    if( lua_isnumber(L,2)){  
       printf("%f.\n", lua_tonumber(L,2));
    }  
   
    printf("%d\n",lua_gettop(L));
    lua_pushvalue(L, 2);
    printf("%f.\n", lua_tonumber(L,3));
    printf("%f.\n", lua_tonumber(L,2));
    printf("%s\n", lua_tostring(L,1));  //转为string并返回  
    printf("%d\n",lua_gettop(L));
    lua_settop(L, 0);
    printf("%d\n",lua_gettop(L));
    //4.关闭state  
    lua_close(L);  
    return ;  
}
