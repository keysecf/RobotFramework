*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               chrome 
${URL}                   https://www.amazon.com.br/
${MENU_ELETRONICOS}      //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]

*** Keywords ***

Abrir o Navegador
    [Documentation]  UTILIZADA EM:    Test Setup    
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o Navegador
    [Documentation]  UTILIZADA EM:    Test Teardown
    Capture Page Screenshot    
    Close Browser


#  ======== TESTES PROCEDURAIS   ======== 
Acessar a home page do site Amazon.com.br
    [Documentation]  UTILIZADA EM:    Caso de Teste 01 - Acesso ao menu "Eletrônicos
...                                   Caso de Teste 02 - Pesquisa de um Produto
    Go To   url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu ${ELETRONICOS}
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

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Element Should Be Visible    locator=twotabsearchtextbox
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Click Element    locator=nav-search-submit-button
    
Veirificar o resultado da pesquisa, listando o produto "${NOME_PRODUTO}" pesquisado
    [Documentation]   UTILIZADA EM:    Caso de Teste 02 - Acesso ao menu "Eletrônicos
    Wait Until Element Contains    locator=//span[contains(.,'${NOME_PRODUTO}')]    text=${NOME_PRODUTO}
    
#  ======== TESTES GHERKIN BDD   ======== 
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

 E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Veirificar o resultado da pesquisa, listando o produto "Xbox Series S" pesquisado