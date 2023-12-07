%{
#include <stdio.h>
%}

%%

[0-9]+      {printf("%s is digit\n", yytext);}
[a-zA-Z]+   {printf("%s is stream of characters\n",yytext);}
.           { /* Ignore any other characters */ }

%%
int yywrap()
{
}

int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}

