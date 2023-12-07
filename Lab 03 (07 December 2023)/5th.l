%option noyywrap
%{
#include<stdio.h>
char fname[25];
int nc=0;
%}

%%
"/*"[a-zA-Z0-9\n\t ]*"*/"  {nc++;}
"//"[a-zA-Z0-9\t ]*"\n"   {nc++;}
%%

void main()
{
printf("Enter filename:\n");
scanf("%s",fname);
yyin=fopen(fname,"r");
yyout=fopen("output.txt","w");
yylex();
printf("The number of comment lines=%d\n",nc);
fprintf(yyout,"%d",nc);
fclose(yyin);
fclose(yyout);
}
