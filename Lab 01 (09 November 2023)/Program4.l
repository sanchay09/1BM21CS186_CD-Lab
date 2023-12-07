%option noyywrap
%{
#include<stdio.h>
%}
%%
int|char|float {printf("\n%s -> Keyword", yytext);}
,|; {printf("\n%s -> Separator", yytext);}
[a-zA-Z0-9]* {printf("\n%s -> Identifier", yytext);}
%%
int wrap()
{
}
int main()
{
printf("Enter: ");
yylex();
return 0;
}
