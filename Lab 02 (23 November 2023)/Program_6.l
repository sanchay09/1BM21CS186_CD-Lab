%{
#include<stdio.h>
char fname[25];
%}

alpha[a-zA-Z]
digit[0-9]

%%
(float|int) {printf("\nkeyword");}
{alpha}({digit}|{alpha})* {printf("\nidentifier");}
{digit}({digit}|{alpha})* {printf("\ninvalid token");}
%%

int yywrap()
{
}

int main()
{
printf("Enter Filename: ");
scanf("%s",fname);
yyin=fopen(fname,"r");
yylex();
return 0;
fclose(yyin);
}
