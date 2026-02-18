%{
#include <stdio.h>

int words = 0;
%}

%%
[^\t\n ]+   { words++; }
[\t\n ]     ;
%%

int main(void) {
    yylex();
    printf("Palabras: %d\n", words);
    return 0;
}

