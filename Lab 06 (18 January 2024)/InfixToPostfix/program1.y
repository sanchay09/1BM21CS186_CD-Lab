%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

int yylex(void);  // Declaration of yylex

// Declaration of yyerror
int yyerror(const char *s);
%}

%token digit

%%
S: E {printf("\n\n");}
;
E: E '+' T { printf("+");}
 | T
 ;
T: T '*' F { printf("*");}
 | F
 ;
F: '(' E ')' 
 | digit {printf("%d", $1);}
 ;

%%

int main()
{
    printf("Enter infix expression: ");
    yyparse();
    return 0;
}

int yyerror(const char *s)
{
    printf("Error: %s\n", s);
    return 0;
}

