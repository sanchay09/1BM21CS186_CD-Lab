%{
#include <math.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct tree_node
{
    char val[20];
    int lc;
    int rc;
};

int ind;
struct tree_node syn_tree[100];

extern int yylex(void);
int yyerror(const char *s);
void my_print_tree(int cur_ind);
int mknode(int lc, int rc, const char* val);
%}

%token digit

%%

S: E { my_print_tree($1); }
;

E: E '+' T { $$ = mknode($1, $3, "+"); }
 | T { $$ = $1; }
;

T: T '*' F { $$ = mknode($1, $3, "*"); }
 | F { $$ = $1; }
;

F: '(' E ')' { $$ = $2; }
 | digit { char buf[20]; sprintf(buf, "%d", yylval); $$ = mknode(-1, -1, buf); }
;

%%

int main()
{
    ind = 0;
    printf("Enter an expression\n");
    yyparse();
    return 0;
}

int yyerror(const char *s)
{
    printf("NITW Error: %s\n", s);
}

int mknode(int lc, int rc, const char* val)
{
    if (strlen(val) < sizeof(syn_tree[ind].val))
    {
        strcpy(syn_tree[ind].val, val);
    }
    else
    {
        fprintf(stderr, "Error: Value too large for tree node\n");
        exit(EXIT_FAILURE);
    }

    syn_tree[ind].lc = lc;
    syn_tree[ind].rc = rc;
    ind++;
    return ind - 1;
}

/* my_print_tree function to print the syntax tree in DLR fashion */
void my_print_tree(int cur_ind)
{
    if (cur_ind == -1)
        return;
    if (syn_tree[cur_ind].lc == -1 && syn_tree[cur_ind].rc == -1)
        printf("Digit Node -> Index: %d, Value: %s\n", cur_ind, syn_tree[cur_ind].val);
    else
        printf("Operator Node -> Index: %d, Value: %s, Left Child Index: %d, Right Child Index: %d\n",
               cur_ind, syn_tree[cur_ind].val, syn_tree[cur_ind].lc, syn_tree[cur_ind].rc);
    my_print_tree(syn_tree[cur_ind].lc);
    my_print_tree(syn_tree[cur_ind].rc);
}

