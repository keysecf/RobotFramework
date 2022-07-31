*** Settings ***
Documentation   
...        **Instruções da tarefa**
...    1. um arquivo de teste novo;
...    2. Cria uma nova keyword, onde ela nos produzirá um e-mail customizado com as seguintes regras:
...      - Essa **keyword** deve receber por argumento o **nome** e **sobrenome** de uma pessoa
...      - Essa **keyword** deve gerar **uma palavra aleatória** que será usada na composição do e-mail(DICA: olhe na documentação da **Library String** ou **Library Faker** para achar uma keyword que gere essa palavra aleatória)
...      - Junte o **nome + sobrenome + palavra aleatória + @testerobot.com** e retorne esse e-mail montado ao final da keyword. **Exemplo: MayFernandesWedd34Dd@testerobot.com**
...    3. Crie um teste que vai chamar essa keyword, passar os argumentos esperados e armazenar o valor retornado em uma nova variável simples;
...    4. Faça um Log To Console para imprimir essa variável simples.
Library         String

*** Variable ***

${NOME}              Keyse
${SOBRENOME}         Carvalho 


*** Test Cases ***

GERAÇÃO DE E-MAIL:
    Dado que é informado o "${NOME}" e "${SOBRENOME}" de uma pessoa
    Quando concatenado "${NOME}" e "${SOBRENOME}" com a palavra gerada randomicamente
    Então é gerado um "${EMAIL}" automatico

*** Keywords ***

Dado que é informado o "${NOME}" e "${SOBRENOME}" de uma pessoa
    Log To Console    ${\N}
    Log To Console    Nome Recebido: ${NOME}
    Log To Console    Sobrenome Recebido: ${SOBRENOME}
   
Quando concatenado "${NOME}" e "${SOBRENOME}" com a palavra gerada randomicamente
    ${PALAVRA_RANDON}     Generate Random String
    # ${EMAIL}  Set Variable
    # ${EMAIL}.convert_to_lower_case
    [Return]        ${EMAIL}

Então é gerado um "${EMAIL}" automatico
    Log To Console    ${EMAIL}


