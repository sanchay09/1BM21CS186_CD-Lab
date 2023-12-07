%{
#include<stdio.h>
#include<stdlib.h>
%}

%%
^[0-9]* {printf("digit");}
^[^0-9]|[0-9]*[a-zA-Z] {printf("not a digit");}
.;
%%

int yywrap()
{
}

int main()
{
yylex();
return 0;
}
