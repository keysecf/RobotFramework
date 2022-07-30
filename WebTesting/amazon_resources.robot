*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                   https://www.amazon.com.br/
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***

Abrir o Navegador
    [Documentation]  UTILIZADA EM:    Test Setup    
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    [Documentation]  UTILIZADA EM:    Test Teardown
    Close Browser

Acessar a home page do site Amazon.com.br
    [Documentation]  UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
...                                   Caso de Teste 02 - Pesquisa de um Produto
    Go To   url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    [Documentation]  UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    [Documentation]   UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
    Wait Until Page Contains         text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    [Documentation]   UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    [Documentation]   UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${NOME_PRODUTO}" no campo de pesquisa
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Element Should Be Visible    locator=//input[contains(@aria-label,'Pesquisa')]
    Input Text    locator=//input[contains(@aria-label,'Pesquisa')]    text=${NOME_PRODUTO}

Clicar no botão de pesquisa
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Click Element    locator=//input[contains(@type,'submit')]
    
Veirificar o resultado da pesquisa, listando o ${NOME_PRODUTO} pesquisado
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Element Should Contain    locator=//span[contains(.,'${NOME_PRODUTO}')]    expected=${NOME_PRODUTO}