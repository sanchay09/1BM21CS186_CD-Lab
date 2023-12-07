%{
#include<stdio.h>
#include<stdlib.h>
int flag,c,j;
%}

%%
[0-9]+ {c=atoi(yytext);
	if(c==2)
	{
		printf("\n Prime number");
	}
	else if(c==0 || c==1)
	{
		printf("\n Not a Prime number");
	}
	else
	{
		for(j=2;j<c;j++)
		{
			if(c%j==0)
			flag=1;
		}
	if(flag==1)
	printf("\n Not a prime number");
	else if(flag==0)
	printf("\n Prime number");
	}
}
%%

int yywrap()
{
}

int main()
{
yylex();
return 0;
}
