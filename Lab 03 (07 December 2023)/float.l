%option noyywrap
%{
  #include<stdio.h>
  int a=0;
%}

%%
[+-]?[0-9]*[.][0-9]* {printf("floating number");}
[+-]?[0-9]* {printf("not a floating number");}
%%

int main() 		
{
 printf("Enter a Number \n");
 yylex();
 return 0;
}
