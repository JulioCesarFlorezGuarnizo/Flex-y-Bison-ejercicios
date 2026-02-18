%{
#include <stdio.h>
#include <string.h>

int lines = 0;
int words = 0;
int chars = 0;
int numbers = 0;
%}

%%
[0-9]+      { numbers++; chars += strlen(yytext); }
[a-zA-Z]+   { words++; chars += strlen(yytext); }
\n          { lines++; chars++; }
.           { chars++; }
%%

int main(void) {
    yylex();
    printf("Lineas: %d\n", lines);
    printf("Palabras: %d\n", words);
    printf("Numeros: %d\n", numbers);
    printf("Caracteres: %d\n", chars);
    return 0;
}

