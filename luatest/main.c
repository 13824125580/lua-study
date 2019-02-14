#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LUA_SIGNATURE     "\x1bLua"
#define LUAC_VERSION      0x53 
#define LUAC_FORMAT       0
#define LUAC_DATA         "\x19\x93\r\n\x1a\n"
#define CINT_SIZE         4 
#define CSIZET_SIZE       8 
#define INSTRUCTION_SIZE  4 
#define LUA_INTEGER_SIZE  8 
#define LUA_NUMBER_SIZE   8 
#define LUAC_INT          0x5678
#define LUAC_NUM          370.5

void load_functions(unsigned char *function)
{
        
	return;
}
int main(int argc, char **argv)
{
    FILE *fp = NULL;

    fp = fopen(argv[1], "rb");
    if (NULL == fp)
    {
        printf("File open fail!\n");
        return -1;
    }
    fseek(fp, 0L, SEEK_END);
    
    int len = ftell(fp);
    fseek(fp, 0L, SEEK_SET);

    unsigned char* fbuf = malloc(len);
    if(fbuf == NULL) return -1;
    
    memset(fbuf, 0x00,len);
    fread(fbuf, 1, len, fp);
    fclose(fp);
    fp = NULL;

    if(memcmp(fbuf, LUA_SIGNATURE, 4) != 0)
    {
        printf("error of header.\n");
	return -1;
    }

    if(fbuf[4] != LUAC_VERSION)
    {
        printf("error of header.\n");
	return -1;
    }

    if(fbuf[5] != LUAC_FORMAT)
    {
        printf("error of header.\n");
	return -1;
    }

    if(memcmp(fbuf + 6, LUAC_DATA, 6) != 0)
    {
        printf("error of header.\n");
	return -1;
    }

    if(fbuf[12] != CINT_SIZE)
    {
        printf("error of header.\n");
	return -1;
    }

    if(fbuf[13] != CSIZET_SIZE)
    {
        printf("error of header.\n");
	return -1;
    }
    if(fbuf[14] != INSTRUCTION_SIZE)
    {
        printf("error of header.\n");
	return -1;
    }

    if(fbuf[15] != LUA_INTEGER_SIZE)
    {
        printf("error of header.\n");
	return -1;
    }
    if(fbuf[16] != LUA_NUMBER_SIZE)
    {
        printf("error of header.\n");
	return -1;
    }

    unsigned long *p = (unsigned long*)(fbuf + 17);
    if(*p != LUAC_INT) 
    {
        printf("error of header.\n");
	return -1;
    }

    double *d = (double *)(fbuf + 25);
    if(*d != LUAC_NUM) 
    {
        printf("error of header.\n");
	return -1;
    }

    printf("upvalue num %d.\n", fbuf[33]);
    load_functions(fbuf + 34);
    return 0;
}

