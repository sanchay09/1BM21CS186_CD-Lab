%{
#include<stdio.h>
int c=0;
%}
%%
[a-zA-Z0-9]+ {c++;}
\n {printf("The count is: %d\n", c);}
%%
int yywrap()
{
}
int main()
{
printf("Enter the sentence: ");
yylex();
return 0;
}
