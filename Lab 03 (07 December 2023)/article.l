%option noyywrap
%{
  #include<stdio.h>
  int a=0;
%}

%%
[A|a|AN|An|THE|The] {a=1;}
[a-zA-Z]* {}
\n {return 0;}
%%

void main()
{
 printf("Enter a sentence \n");
 a=0;
 yylex();
 if(a==1)
 {
  printf("The sentence STARTS with an ARTICLE");
 }
 else
 {
 printf("The sentence DOES NOT start with an Article");
 }
}
