all:
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE lua1.c  -llua -ldl -lm
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE -fPIC luamod.c -shared liblua.a -o mytestlib.so
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE -fPIC mLualib.c -shared liblua.a -o mLualib.so
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE luabuiltin.c  -o buin -llua -ldl -lm 
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE ave.c  -o ave -llua -ldl -lm 
	g++ -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE -g -O0 touch.cpp  -o cpplua -llua -ldl -lm 
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE para.c  -llua -ldl -lm -o para
	gcc -DLUA_COMPAT_5_2 -DLUA_USE_LINUX -DLUA_COMPAT_MODULE line.c  -llua -ldl -lm -o line
	luac -o lua.code lib1.lua 
test:
	@echo test1.......
	./buin lib1.lua
	@echo test2.......
	lua luamod.lua
	@echo test3.......
	./a.out
	@echo test4......
	lua ./lua.code
	@echo test5......
	./ave
