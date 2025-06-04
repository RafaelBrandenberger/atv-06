/* analisador léxico para trecho em linguagem c */
import token.Token; // igual ao exemplo.flex

%%

%standalone
%line
%column
%class ScannerC // nome da classe mudou

%{
  Token token; // igual ao exemplo.flex
%}

/* macros */
ID        = [a-zA-Z_][a-zA-Z_0-9]*
NUM       = [0-9]+
ESPACO    = [ \t\r\n]+

%%

/* palavras reservadas */
"int"         { token = new Token(yyline, yycolumn, yytext(), "INT"); token.imprimir(); }
"main"        { token = new Token(yyline, yycolumn, yytext(), "MAIN"); token.imprimir(); }
"while"       { token = new Token(yyline, yycolumn, yytext(), "WHILE"); token.imprimir(); }
"return"      { token = new Token(yyline, yycolumn, yytext(), "RETURN"); token.imprimir(); }
"printf"      { token = new Token(yyline, yycolumn, yytext(), "PRINTF"); token.imprimir(); }

/* operadores compostos primeiro */
"+="          { token = new Token(yyline, yycolumn, yytext(), "SOMA ATRIB"); token.imprimir(); } // soma e atribuição
"<="          { token = new Token(yyline, yycolumn, yytext(), "LE"); token.imprimir(); } // menor ou igual
"++"          { token = new Token(yyline, yycolumn, yytext(), "INCREMENTO"); token.imprimir(); } // incremento

/* operadores simples */
"="           { token = new Token(yyline, yycolumn, yytext(), "ATRIB"); token.imprimir(); }
"+"           { token = new Token(yyline, yycolumn, yytext(), "ADD"); token.imprimir(); }
"-"           { token = new Token(yyline, yycolumn, yytext(), "SUB"); token.imprimir(); }
"*"           { token = new Token(yyline, yycolumn, yytext(), "MULT"); token.imprimir(); }
"/"           { token = new Token(yyline, yycolumn, yytext(), "DIV"); token.imprimir(); }

/* símbolos */
"("           { token = new Token(yyline, yycolumn, yytext(), "APAR"); token.imprimir(); }
")"           { token = new Token(yyline, yycolumn, yytext(), "FPAR"); token.imprimir(); }
"{"           { token = new Token(yyline, yycolumn, yytext(), "ACHAVE"); token.imprimir(); } // chave aberta
"}"           { token = new Token(yyline, yycolumn, yytext(), "FCHAVE"); token.imprimir(); } // chave fechada
";"           { token = new Token(yyline, yycolumn, yytext(), "PVIRG"); token.imprimir(); }

/* tipos básicos */
{NUM}         { token = new Token(yyline, yycolumn, yytext(), "NUM"); token.imprimir(); }
{ID}          { token = new Token(yyline, yycolumn, yytext(), "ID"); token.imprimir(); }

/* ignora espaços */
{ESPACO}      { /* ignora espaços */ }

/* erro */
.             { token = new Token(yyline, yycolumn, yytext(), "CARACTER INVÁLIDO"); token.dispararExcecao(); }