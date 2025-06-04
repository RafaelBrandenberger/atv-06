/* analisador léxico para trecho em linguagem java */
import token.Token; // igual ao exemplo.flex

%%

%standalone
%line
%column
%class ScannerJava // nome da classe mudou

%{
  Token token; // igual ao exemplo.flex
%}

/* macros */
ID        = [a-zA-Z_][a-zA-Z_0-9]*
NUM       = [0-9]+
STRING    = \"([^\"\\]|\\.)*\" // string entre aspas duplas
ESPACO    = [ \t\r\n]+

%%

/* palavras reservadas */
"public"      { token = new Token(yyline, yycolumn, yytext(), "PUBLIC"); token.imprimir(); }
"class"       { token = new Token(yyline, yycolumn, yytext(), "CLASS"); token.imprimir(); }
"static"      { token = new Token(yyline, yycolumn, yytext(), "STATIC"); token.imprimir(); }
"void"        { token = new Token(yyline, yycolumn, yytext(), "VOID"); token.imprimir(); }
"main"        { token = new Token(yyline, yycolumn, yytext(), "MAIN"); token.imprimir(); }
"String"      { token = new Token(yyline, yycolumn, yytext(), "STRING_TIPO"); token.imprimir(); } // tipo String
"int"         { token = new Token(yyline, yycolumn, yytext(), "INT"); token.imprimir(); }
"for"         { token = new Token(yyline, yycolumn, yytext(), "FOR"); token.imprimir(); }

/* operadores e símbolos compostos */
":"           { token = new Token(yyline, yycolumn, yytext(), "DOIS_PONTOS"); token.imprimir(); } // dois pontos para for-each

/* operadores simples */
"="           { token = new Token(yyline, yycolumn, yytext(), "ATRIB"); token.imprimir(); }
","           { token = new Token(yyline, yycolumn, yytext(), "VIRG"); token.imprimir(); }
"."           { token = new Token(yyline, yycolumn, yytext(), "PONTO"); token.imprimir(); }
";"           { token = new Token(yyline, yycolumn, yytext(), "PVIRG"); token.imprimir(); }
"["           { token = new Token(yyline, yycolumn, yytext(), "ACOL"); token.imprimir(); } // colchete aberto
"]"           { token = new Token(yyline, yycolumn, yytext(), "FCOL"); token.imprimir(); } // colchete fechado
"{"           { token = new Token(yyline, yycolumn, yytext(), "ACHAVE"); token.imprimir(); } // chave aberta
"}"           { token = new Token(yyline, yycolumn, yytext(), "FCHAVE"); token.imprimir(); } // chave fechada
"("           { token = new Token(yyline, yycolumn, yytext(), "APAR"); token.imprimir(); }
")"           { token = new Token(yyline, yycolumn, yytext(), "FPAR"); token.imprimir(); }

/* tipos básicos */
{NUM}         { token = new Token(yyline, yycolumn, yytext(), "NUM"); token.imprimir(); }
{ID}          { token = new Token(yyline, yycolumn, yytext(), "ID"); token.imprimir(); }
{STRING}      { token = new Token(yyline, yycolumn, yytext(), "STRING"); token.imprimir(); }

/* ignora espaços */
{ESPACO}      { /* ignora espaços */ }

/* erro */
.             { token = new Token(yyline, yycolumn, yytext(), "CARACTER INVÁLIDO"); token.dispararExcecao(); }