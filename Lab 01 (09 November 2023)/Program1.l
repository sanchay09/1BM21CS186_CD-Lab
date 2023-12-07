%option noyywrap
%{
#include<stdio.h>
%}
%%
[0-9]+ {printf("Number: %s\n", yytext);}
[+-] {printf("Operator: %s\n", yytext);}
[\t\n] {/*ignore Whitespaces and newline*/}
[a-zA-Z]* {printf("Invalid Character: %s\n", yytext);}
%%
int main()
{
printf("Enter: ");
yylex();
return 0;
}
