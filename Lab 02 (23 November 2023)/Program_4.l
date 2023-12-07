%{
#include<stdio.h>
%}

alpha [a-zA-Z0-9]*

%%
[0-9]* {printf("%s IS DIGIT\n",yytext);}
[a-zA-Z]* {printf("\n%s is character\n",yytext);}
{alpha} {printf("\nInvalid String\n");}
%%

int yywrap()
{
}

int main()
{
printf("Enter input: ");
yylex();
return 0;
}
