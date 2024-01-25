#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int i = 0;

bool A(char *s)
{
    if(s[i] != 'a')
        return false;
    if(s[i] == 'a')
        i++;
    if(i < strlen(s) && s[i] == 'b')
        i++;
    return true;
}

bool S(char *s)
{
    if(strlen(s) == 0)
        return false;
    if(s[i] == 'c')
    {
        i++;
        if(!A(s))
            return false;
        if(i == strlen(s))
            return false;
        if(s[i] == 'd')
            i++;
        if(i == strlen(s))
            return true;
    }
    return false;
}

int main()
{
    char s[100];
    printf("Enter the string: ");
    scanf("%99s", s);
    if(S(s))
        printf("Input matched\n");
    else
        printf("Input did not match\n");
}


