/* analisador léxico para trecho de pascal */
import token.Token; // igual ao exemplo.flex

%%

%standalone
%line
%column
%class ScannerPascal // nome da classe mudou

%{
  Token token; // igual ao exemplo.flex
%}

/* macros */
ID        = [a-zA-Z_][a-zA-Z_0-9]*
NUM       = [0-9]+
STRING    = \'([^']|\\')*\' // padrão para string pascal
ESPACO    = [ \t\r\n]+

%%

/* palavras reservadas */
"if"        { token = new Token(yyline, yycolumn, yytext(), "IF"); token.imprimir(); }
"then"      { token = new Token(yyline, yycolumn, yytext(), "THEN"); token.imprimir(); }
"else"      { token = new Token(yyline, yycolumn, yytext(), "ELSE"); token.imprimir(); }
"begin"     { token = new Token(yyline, yycolumn, yytext(), "BEGIN"); token.imprimir(); }
"end"       { token = new Token(yyline, yycolumn, yytext(), "END"); token.imprimir(); }
"writeln"   { token = new Token(yyline, yycolumn, yytext(), "WRITELN"); token.imprimir(); }

/* operadores */
":="        { token = new Token(yyline, yycolumn, yytext(), "ATRIB"); token.imprimir(); }
"*"         { token = new Token(yyline, yycolumn, yytext(), "MULT"); token.imprimir(); }
"-"         { token = new Token(yyline, yycolumn, yytext(), "SUB"); token.imprimir(); }
"+"         { token = new Token(yyline, yycolumn, yytext(), "ADD"); token.imprimir(); }
"/"         { token = new Token(yyline, yycolumn, yytext(), "DIV"); token.imprimir(); }
"<"         { token = new Token(yyline, yycolumn, yytext(), "LT"); token.imprimir(); }

/* parênteses */
"("         { token = new Token(yyline, yycolumn, yytext(), "APAR"); token.imprimir(); }
")"         { token = new Token(yyline, yycolumn, yytext(), "FPAR"); token.imprimir(); }

/* pontuação */
";"         { token = new Token(yyline, yycolumn, yytext(), "PVIRG"); token.imprimir(); }
","         { token = new Token(yyline, yycolumn, yytext(), "VIRG"); token.imprimir(); }
"."         { token = new Token(yyline, yycolumn, yytext(), "PONTO"); token.imprimir(); }

/* tipos básicos */
{NUM}       { token = new Token(yyline, yycolumn, yytext(), "NUM"); token.imprimir(); }
{ID}        { token = new Token(yyline, yycolumn, yytext(), "ID"); token.imprimir(); }
{STRING}    { token = new Token(yyline, yycolumn, yytext(), "STRING"); token.imprimir(); }

/* ignora espaços */
{ESPACO}    { /* ignora espaços */ }

/* erro */
.           { token = new Token(yyline, yycolumn, yytext(), "CARACTER INVÁLIDO"); token.dispararExcecao(); }