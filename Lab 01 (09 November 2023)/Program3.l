%{
#include<stdio.h>
int vow_count=0;
int const_count=0;
%}
%%
[aeiouAEIOU] {vow_count++;}
[a-zA-Z] {const_count++;}
\n {printf("Vowel Count: %d, Consonants Count: %d", vow_count, const_count);}
%%
int yywrap()
{
}
int main()
{
printf("Enter the string of Vowels and Consonants: ");
yylex();
return 0;
}
