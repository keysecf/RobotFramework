*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Library         RequestsLibrary
Library         Collections
Library         String

*** Variable ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/


*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}     Create Dictionary    content-Type=application/json
    Set Suite Variable    ${HEADERS}

#### Ações
Requisitar todos os livros
    ${RESPOSTA}    GET On Session    fakeAPI    Books    
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o livro "&{BOOK}"
    ${RESPOSTA}    GET On Session    fakeAPI    Books/${BOOK.id}       
    Log To Console    ${URL_API}Books/${BOOK.id}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar o livro "&{BOOK}"
    ${RESPOSTA}    POST On Session   fakeAPI    Books
   ...                        data={"id":${BOOK.id},"title":"${BOOK.title}","description":"${BOOK.description}","pageCount":${BOOK.pageCount},"excerpt":"${BOOK.excerpt}","publishDate":"${BOOK.publishDate}"}
   ...                        headers=${HEADERS}
    Log                       ${RESPOSTA.json}
    Log To Console            ${RESPOSTA.json}
    Set Test Variable         ${RESPOSTA}

#### Conferências
Conferir o status code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
    Length Should Be      ${RESPOSTA.json()}     ${QTDE_LIVROS}

Conferir se retorna todos os dados corretos do livro "&{BOOK}"
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${BOOK.id}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${BOOK.title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${BOOK.pageCount}
    Should Not Be Empty               ${RESPOSTA.json()["description"]}
    Should Not Be Empty               ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty               ${RESPOSTA.json()["publishDate"]}
    
Alterar o livro "&{BOOK}" e conferir se retorna todos os dados alterados do livro
    ${RESPOSTA}   PUT On Session       fakeAPI    Books/${BOOK.id} 
    ...               data={"id":${BOOK.id},"title":"titulo","description":"descricao","pageCount":200,"excerpt":"teste frase","publishDate":"${BOOK.publishDate}"}
    ...               headers=${HEADERS}
    Log               ${RESPOSTA.text}
    Log To Console    ${RESPOSTA.text}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              200
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           titulo
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     descricao
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       200
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         teste frase
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     2022-08-03T10:34:50.93Z

Conferir se deleta o livro "&{BOOK}"
    ${RESPOSTA}   DELETE On Session       fakeAPI    Books/${BOOK.id}
    Status Should Be    200    ${RESPOSTA}
     
     