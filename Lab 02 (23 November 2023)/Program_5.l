%{
#include<stdio.h>
%}

alpha[a-zA-Z]
digit[0-9]

%%
(float|int) {printf("\nKeyword\n");}
{alpha}({digit}|{alpha})* {printf("\nIdentifier\n");}
{digit}({digit}|{alpha})* {printf("\nInvalid Token\n");}
%%

int yywrap()
{
}

int main()
{
printf("Enter Input: ");
yylex();
return 0;
}

