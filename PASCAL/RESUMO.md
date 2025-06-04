# Resumo: Analisador Léxico para trecho Pascal usando JFlex

- reconhecer automaticamente as partes fundamentais (tokens) de um trecho de código Pascal.
- preparar o texto para etapas futuras de compilação ou análise.

- Elementos do código que precisariam ser reconhecidos:
  - Palavras reservadas: `if`, `then`, `else`, `begin`, `end`, `writeln`
  - Identificadores: nomes de variáveis e funções como `delta`, `b`, `a`, `sqrt`
  - Operadores: `:=`, `*`, `-`, `+`, `/`, `<`
  - Símbolos: `(`, `)`, `;`, `,`, `.`
  - Números: `2`, `4` (mesmo que não apareçam no trecho, previmos suporte)
  - Strings: `'Nao tem raizes reais'`
  - Espaços e quebras de linha (para ignorar)
  - Caracteres inválidos (para tratar como erro)

- Definimos expressões regulares para cada token.
- Para cada padrão reconhecido, associamos uma ação (por exemplo: imprimir o tipo do token, seu texto e sua posição).

- **pascal.flex:** Arquivo JFlex com todas as regras (diretivas, macros, ações).
- **Token.java:** Classe Java que representa um token, contendo: linha, coluna, lexema (texto) e tipo.
- **entrada_pascal.txt:** Arquivo de teste com o trecho Pascal.

- Geramos o analisador léxico com o comando `jflex pascal.flex`.
- Compilamos os arquivos Java com `javac token/Token.java ScannerPascal.java`.
- Executamos o analisador com `java ScannerPascal entrada_pascal.txt`.

- Para cada token encontrado, o programa imprime uma linha do tipo:
  ```
  [linha][coluna] texto: TIPO.
  ```
  - Exemplo: `[0][0] delta: ID.` significa:  
    Na linha 0, coluna 0, o texto "delta" foi classificado como identificador (ID).
- Se um caractere inválido for encontrado, uma mensagem de erro é gerada.
