%{
#include <stdio.h>
extern FILE* yyin;
int yylex(void);
%}

%%
("Var") 	        printf(" Key_word ");
[0-9]+ 		        printf(" Constant ");
([a-zA-Z])+ 	        printf(" Identifier ");
(\[)                    printf(" Open_square_bracket ");
(\])                    printf(" Close_square_bracket ");
(\*){1} 		printf(" Multiply ");
(\/){1} 		printf(" Divide ");
(\,){1} 		printf(" Comma ");
(\=){1} 		printf("Assign ");
(\-){1} 		printf(" Minus ");
(\+){1} 		printf(" Plus ");
(\(){1} 		printf(" Open_bracket ");
(\)){1} 		printf(" Close_bracket ");
(\;){1} 		printf(" Delimiter ");
\n
[ \t]+
%%

int yywrap()
{
    return 1;
}

int main()
{
    yyin = fopen("example.txt","r");
    yylex();
    fclose(yyin);
    return 0;
} 
