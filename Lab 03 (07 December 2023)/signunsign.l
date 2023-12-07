%option noyywrap
%{
  #include<stdio.h>
  int a=0;
%}
%%
[+|-] {a=1;}
[0-9]* {}
\n {return 0;}
%%
void main() 		
{
 printf("Enter a Number: ");
 a=0;
 yylex();
 if(a==1)
 {
  printf("Number entered is SIGNED.\n");
 }
 else
 {
  printf("Number entered is NOT SIGNED \n");
 }
}
