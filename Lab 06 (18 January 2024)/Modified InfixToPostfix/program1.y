%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex();  // Declare the yylex function
extern void yyerror(char *s);  // Declare the yyerror function

%}

%token digit

%left '+' '-'
%left '*' '/'
%right '^'

%%

S: E { printf("\n\n"); }
  ;

E: E '+' T { printf("+"); }
  | E '-' T { printf("-"); }
  | T
  ;

T: T '*' F { printf("*"); }
  | T '/' F { printf("/"); }
  | F
  ;

F: F '^' G { printf("^"); }
  | G
  ;

G: '(' E ')' 
  | digit { printf("%d", $1); }
  ;

%%

int main() {
    printf("Enter infix expression: ");
    yyparse();
}

void yyerror(char *s) {
    printf("Error: %s\n", s);
    // You can add more error handling if needed
}

