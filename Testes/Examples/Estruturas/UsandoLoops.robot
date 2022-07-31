*** Settings ***
Documentation   Suíte para exemplificar o uso de LOOPS nos testes
...             Os LOOPS devem ser pouco utilizados, mas tem hora que não tem jeito
...             e precisamos dele mesmo, então vamos ver como é!
...             LOOPS: use com moderação!
...             Infelizmente o Loop FOR ainda não tem uma estrutura keyword-driven
...             Mas o criador do Robot já disse que estão estudando uma solução!

*** Variable ***
# Indíce da lista     0         1         2          3          4        5
@{FRUTAS}            maça    abacaxi    banana    morango    laranja    uva

*** Test Case ***
Caso de teste exemplo 01
    Usando FOR com RANGE
    Usando FOR com LISTA
    Usando FOR IN ENUMERATE
    Saindo de um FOR
    Usando a keyword REPEAT

*** Keywords ***
Usando FOR com RANGE
    FOR    ${COUNT}    IN RANGE    0    6
        Log To Console    Meu contador atual é: ${COUNT}. O range será de 1 a 5!
        Run Keyword If    ${COUNT} == 5    Log To Console    Acabou o loop!!!
    END

Usando FOR com LISTA
    Log To Console    ${\n}
    FOR    ${ITEM}    IN    @{FRUTAS}
        Log To Console    Minha fruta é: ${ITEM}
        Run Keyword If    '${ITEM}' == 'uva'    Log To Console    Acabou o loop!!!
    END

Saindo de um FOR
    Log To Console    ${\n}
    FOR    ${ITEM}    IN    @{FRUTAS}
        Exit For Loop If    '${ITEM}' == 'uva'
        Log To Console      Minha fruta é: ${ITEM}
    END
Usando a keyword REPEAT
    Log To Console    ${\n}
    Repeat Keyword    4    Log To Console    Vamos logar essa frase 4 vezes!!!

Usando FOR IN ENUMERATE
    Log To Console    ${\n}
    FOR    ${INDICE}    ${ITEM}    IN ENUMERATE    @{FRUTAS}
        Log To Console    Minha fruta é: ${INDICE} --> ${ITEM}
        Run Keyword If    '${ITEM}' == 'uva'    Log To Console    Acabou o loop!!!
    END