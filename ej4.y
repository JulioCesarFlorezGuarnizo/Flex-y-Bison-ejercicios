%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right '^'
%right UMINUS

%%

input:
      /* vacío */
    | input line
    ;

line:
      '\n'
    | expr '\n'   { printf("= %d\n", $1); }
    ;

expr:
      NUMBER
    | expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | expr '^' expr   {
          int r = 1;
          for(int i = 0; i < $3; i++)
              r *= $1;
          $$ = r;
      }
| '-' expr %prec UMINUS { $$ = -$2; }

    | '(' expr ')'    { $$ = $2; }
    ;

%%

int main(void) {
    return yyparse();
}

int yyerror(const char *s) {
    return 0;
}

