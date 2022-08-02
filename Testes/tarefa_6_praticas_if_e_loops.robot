*** Settings ***
Documentation   
...        # Instruções da tarefa
...    **Siga os seguintes passos:**
...    1. Declare uma variável do tipo lista com vários números
...    2. Crie uma keyword que percorra essa lista usando o **FOR**
...    3. Dentro do **FOR**, faça um bloco **IF** que imprima no Log a frase "Eu sou o número 5!" e "Eu sou o número 10!", ou seja, só pode imprimir quando o número atual da lista for 5 ou 10.
...    4. Use o **ELSE** para imprimir no Log a frase "Eu não sou o número 5 e nem o 10!"

*** Variable ***

@{VAR_LISTA}    1    2    3    4    5    6    7    8    9    10


*** Test Cases ***

Casos de testes com LISTA, FOR e IF:    
    Percorrer lista usando FOR
    

*** Keywords ***

Percorrer lista usando FOR
    FOR    ${INDICE}    IN    @{VAR_LISTA}
        IF   ${INDICE} == 5
            Log To Console    Eu sou o número ${INDICE}!
        ELSE IF    ${INDICE} == 10
            Log To Console    Eu sou o número ${INDICE}!
        ELSE
             Log To Console    Eu não sou o número 5 e nem o 10!
        END
    END

    


