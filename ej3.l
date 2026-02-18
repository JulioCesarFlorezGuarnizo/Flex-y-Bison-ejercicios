%{
#include <stdio.h>
%}

%%
"colour"    { printf("color"); }
"Colour"    { printf("Color"); }
"COLOUR"    { printf("COLOR"); }

"flavour"   { printf("flavor"); }
"Flavour"   { printf("Flavor"); }
"FLAVOUR"   { printf("FLAVOR"); }

"centre"    { printf("center"); }
"Centre"    { printf("Center"); }
"CENTRE"    { printf("CENTER"); }

.|\n        { ECHO; }
%%

int main(void) {
    yylex();
    return 0;
}

