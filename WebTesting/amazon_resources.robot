*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]


*** Keywords ***
Abrir o Navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o Navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To   url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}