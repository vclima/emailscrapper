
%{
#include <stdio.h>
%}
Anum [A-Za-z0-9]
AnumSpecial [A-Za-z0-9_\-.]
Special [_\-.~]
SpecialFim [_\-~]

%%
{Special}+{Anum}"@"{Anum}+"."{Anum}+ {
}
{Anum}+{AnumSpecial}*{Anum}+"@"{Anum}+{AnumSpecial}*{SpecialFim}+ {
}
{Anum}+{AnumSpecial}*{Anum}+"@"{Anum}+({AnumSpecial}*{Anum})* {
printf("%s\n",yytext);
}
[ \t\n] {}
. {}

%%

int main() {
  yylex();
  return 0;
}
