*** Settings ***
Library    SeleniumLibrary



*** Keywords ***
Abrir o Navegador
    Open Browser    browser=chrome

Fechar o Navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    https://www.amazon.com.br/