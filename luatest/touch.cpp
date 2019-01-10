#include <iostream>  
#include <string.h>  
using namespace std;  
   
extern "C"  
{  
    #include "lua.h"  
    #include "lauxlib.h"  
    #include "lualib.h"  
}  

lua_State* L;  
static int __attribute((noinline)) average(lua_State *L)  
{  
    /* 得到参数个数 */  
    int n = lua_gettop(L);  
    double sum = 0;  
    int i;  
   
    /* 循环求参数之和 */  
    for (i = 1; i <= n; i++)  
    {  
        /* 求和 */  
        sum += lua_tonumber(L, i);  
    }  
    /* 压入平均值 */  
    lua_pushnumber(L, sum / n);  
    /* 压入和 */  
    lua_pushnumber(L, sum);  
    /* 返回返回值的个数 */  
    printf("asdfasfasfd\n");
    return 2;  
}  

static int zilong_version(lua_State *L)
{
    lua_pushstring(L, "melisversion");
    return 1;
}

static int zilong_success(lua_State *L)
{
    lua_pushstring(L, "successzilong");
    return 1;
}
int main()  
{  
    //1.创建Lua状态  
    lua_State *L = luaL_newstate();  
    if (L == NULL)  
    {  
        return -1;  
    }  
   
    luaL_openlibs(L);  
    lua_register(L, "average", average);  

    printf("stk:%d\n",lua_gettop(L));

    //lua_getglobal(L, "zilong");
    lua_newtable(L);
    lua_pushvalue(L, -1);
    lua_setglobal(L, "zilong");

    lua_pushcfunction(L, zilong_version);
    lua_setfield(L, -2, "version");
    lua_pushcfunction(L, zilong_success);
    lua_setfield(L, -2, "success");
   
    //2.加载Lua文件  
    int bRet = luaL_loadfile(L,"hello.lua");  
    if(bRet)  
    {  
        cout<<"load file error"<<endl;  
        return -1;  
    }  
    
    printf("stk:%d\n",lua_gettop(L));
    //3.运行Lua文件  
    bRet = lua_pcall(L,0,0,0);  
    if(bRet)  
    {  
        cout<<"pcall error"<<endl;  
	return -1;  
    }  
   
    printf("stk:%d\n",lua_gettop(L));
    //4.读取变量  
    lua_getglobal(L,"str");  
    printf("stk:%d\n",lua_gettop(L));
    string str = lua_tostring(L,-1);  
    cout<<"str = "<<str.c_str()<<endl;        //str = I am so cool~  
    printf("stk:%d\n",lua_gettop(L));
   
    //5.读取table  
    lua_getglobal(L,"tbl");   
    printf("stk:%d\n",lua_gettop(L));
    lua_getfield(L,-1,"name");  
    printf("stk:%d\n",lua_gettop(L));
    str = lua_tostring(L,-1);  
    cout<<"tbl:name = "<<str.c_str()<<endl; //tbl:name = shun  
   
    printf("stk:%d\n",lua_gettop(L));
    //6.读取函数  
    lua_getglobal(L, "add");        // 获取函数，压入栈中  
    lua_pushnumber(L, 10);          // 压入第一个参数  
    lua_pushnumber(L, 20);          // 压入第二个参数  
    int iRet= lua_pcall(L, 2, 3, 0);// 调用函数，调用完成以后，会将返回值压入栈中，2表示参数个数，1表示返回结果个数。  
    printf("stkd:%d\n",lua_gettop(L));
    if (iRet)                       // 调用出错  
    {  
        const char *pErrorMsg = lua_tostring(L, -1);  
        cout << pErrorMsg << endl;  
        lua_close(L);  
        return -1;  
    }  
    if (lua_isnumber(L, -1))        //取值输出  
    {  
        double fValue = lua_tonumber(L, -1);  
        cout << "Result is " << fValue << endl;  
    }  

    if (lua_isnumber(L, -2))        //取值输出  
    {  
        double fValue = lua_tonumber(L, -2);  
        cout << "Result is " << fValue << endl;  
    }  

    if (lua_isnumber(L, -3))        //取值输出  
    {  
        double fValue = lua_tonumber(L, -3);  
        cout << "Result is " << fValue << endl;  
    }  
    //lua_pop(L, 1);
    //lua_pop(L, 1);
    //lua_pop(L, 1);
    //至此，栈中的情况是：  
    //=================== 栈顶 ===================   
    //  索引  类型      值  
    //   4   int：      30   
    //   3   string：   shun   
    //   2   table:     tbl  
    //   1   string:    I am so cool~  
    //=================== 栈底 ===================   
   
    //7.关闭state  
    lua_close(L);  
    return 0 ;  
}
