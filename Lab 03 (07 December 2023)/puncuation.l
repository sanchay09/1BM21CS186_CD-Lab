%option noyywrap
%{
  #include<stdio.h>
  int a=0;
%}

%%
[a-zA-Z]+[?|.|!] {a=1;}
\n {return 0;}
%%

void main() 		
{
 printf("Enter a sentence: ");
 a=0;
 yylex();
 if(a==1)
 {
  printf("\nSentence ends with a punctuation mark\n");
 }
 else
 {
 printf("\nSentence does not end with a punctuation mark\n");
 }
}
