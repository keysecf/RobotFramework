*** Settings ***
Documentation   TAREFA 4 - PRATICAS COM DICIONÁRIOS
...    **Instruções da tarefa**
...    1. Crie um arquivo de teste novo;
...    2. Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
...    3. Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias.
...    4. Rode os testes e confira se logou tudo certinho!


*** Variable ***


&{JANEIRO}      descricao_mes=JANEIRO        quantidade_de_dias=31
&{FEVEREIRO}    descricao_mes=FEVEREIRO      quantidade_de_dias=28
&{MARCO}        descricao_mes=MARÇO          quantidade_de_dias=31
&{ABRIL}        descricao_mes=ABRIL          quantidade_de_dias=30
&{MAIO}         descricao_mes=MAIO           quantidade_de_dias=31
&{JUNHO}        descricao_mes=JUNHO          quantidade_de_dias=30
&{JULHO}        descricao_mes=JULHO          quantidade_de_dias=31
&{AGOSTO}       descricao_mes=AGOSTO         quantidade_de_dias=31
&{SETMEBRO}     descricao_mes=SETEMBRO       quantidade_de_dias=30
&{OUTUBRO}      descricao_mes=OUTUBRO        quantidade_de_dias=31
&{NOVEMBRO}     descricao_mes=NOVEMBRO       quantidade_de_dias=30
&{DEZEMBRO}     descricao_mes=DEZEMBRO       quantidade_de_dias=31
                
*** Test Cases ***

IMPRIMIR TODOS OS MESES E QUANTIDADE DE DIAS RESPECTIVOS DO ANO:
    Imprimir meses do ano


*** Keywords ***

Imprimir meses do ano
    Log To Console    ${\N}
    Log To Console    ${JANEIRO.descricao_mes} - ${JANEIRO.quantidade_de_dias}    
    Log To Console    ${FEVEREIRO.descricao_mes} - ${FEVEREIRO.quantidade_de_dias}    
    Log To Console    ${MARCO.descricao_mes} - ${MARCO.quantidade_de_dias}    
    Log To Console    ${ABRIL.descricao_mes} - ${ABRIL.quantidade_de_dias}    
    Log To Console    ${MAIO.descricao_mes} - ${MAIO.quantidade_de_dias}    
    Log To Console    ${JUNHO.descricao_mes} - ${JUNHO.quantidade_de_dias}
    Log To Console    ${JULHO.descricao_mes} - ${JULHO.quantidade_de_dias}    
    Log To Console    ${AGOSTO.descricao_mes} - ${AGOSTO.quantidade_de_dias}    
    Log To Console    ${SETMEBRO.descricao_mes} - ${SETMEBRO.quantidade_de_dias}
    Log To Console    ${OUTUBRO.descricao_mes} - ${OUTUBRO.quantidade_de_dias}    
    Log To Console    ${NOVEMBRO.descricao_mes} - ${NOVEMBRO.quantidade_de_dias}    
    Log To Console    ${DEZEMBRO.descricao_mes} - ${DEZEMBRO.quantidade_de_dias}    
    
    


