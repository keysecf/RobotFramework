*** Settings ***
Documentation   Arquivo de Testes da Tarefa 3 - Vamos praticar com LISTAS!

*** Variable ***

#Tipo Lista
@{MESES_ANO}    JANEIRO    FEVEREIRO    MARÇO    ABRIL    MAIO    JUNHO    JULHO    AGOSTO    SETEMBRO    OUTUBRO    NOVEMBRO    DEZEMBRO    


*** Test Cases ***
MESES DO ANO:
    Imprimir todos os meses do ano

*** Keywords ***
Imprimir todos os meses do ano
# Lista de Meses do ano baseada nos indices do array
    Log To Console    ${MESES_ANO[0]}
    Log To Console    ${MESES_ANO[1]}
    Log To Console    ${MESES_ANO[2]}
    Log To Console    ${MESES_ANO[3]}
    Log To Console    ${MESES_ANO[4]}
    Log To Console    ${MESES_ANO[5]}
    Log To Console    ${MESES_ANO[6]}
    Log To Console    ${MESES_ANO[7]}
    Log To Console    ${MESES_ANO[8]}
    Log To Console    ${MESES_ANO[9]}
    Log To Console    ${MESES_ANO[10]}
    Log To Console    ${MESES_ANO[11]}