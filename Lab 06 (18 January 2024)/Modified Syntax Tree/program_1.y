%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"

extern int yylex();
extern void yyerror(const char *s);

struct tree_node
{
    char val[10];
    int lc;
    int rc;
};
int ind;
struct tree_node syn_tree[100];
void my_print_tree(int cur_ind);
int mknode(int lc, int rc, const char *val);
%}
%token digit
%right '^'
%left '*' '/'
%left '+' '-'
%%
S: E { my_print_tree($1); }
  ;

E: E '+' T { $$ = mknode($1, $3, "+"); }
  | E '-' T { $$ = mknode($1, $3, "-"); }
  | T { $$ = $1; }
  ;

T: T '*' F { $$ = mknode($1, $3, "*"); }
  | T '/' F { $$ = mknode($1, $3, "/"); }
  | F { $$ = $1; }
  ;

F: '(' E ')' { $$ = $2; }
  | digit { char buf[10]; sprintf(buf, "%d", yylval); $$ = mknode(-1, -1, buf); }
  | F '^' F { $$ = mknode($1, $3, "^"); }
  ;

%%
int main()
{
    ind = 0;
    printf("Enter an expression\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("NITW Error: %s\n", s);
    exit(EXIT_FAILURE);
}

int mknode(int lc, int rc, const char *val)
{
    strcpy(syn_tree[ind].val, val);
    syn_tree[ind].lc = lc;
    syn_tree[ind].rc = rc;
    ind++;
    return ind - 1;
}

void my_print_tree(int cur_ind)
{
    if (cur_ind == -1)
        return;
    if (syn_tree[cur_ind].lc == -1 && syn_tree[cur_ind].rc == -1)
        printf("Digit Node -> Index : %d, Value : %s\n", cur_ind, syn_tree[cur_ind].val);
    else
        printf("Operator Node -> Index : %d, Value : %s, Left Child Index : %d, Right Child Index : %d \n", cur_ind,
               syn_tree[cur_ind].val, syn_tree[cur_ind].lc, syn_tree[cur_ind].rc);
    my_print_tree(syn_tree[cur_ind].lc);
    my_print_tree(syn_tree[cur_ind].rc);
}

