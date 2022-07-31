*** Settings ***

Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon_resources.robot
Test Setup       Abrir o Navegador
Test Teardown    Fechar o Navegador    

*** Variables ***
${PRODUTO}        Xbox Series S

*** Test Cases ***

# Pratique automatizando mais esses 02 cenários:

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "${PRODUTO}" no carrinho
    Então o produto deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "${PRODUTO}" no carrinho
    Quando remover o produto "${PRODUTO}" do carrinho
    Então o carrinho deve ficar vazio

# Perguntas dessa tarefa
# Mostre para nós os testes que conseguiu automatizar no site da Amazon.com.br e cole o 
# código de um desses testes aqui + o código da implementação das keywords desse teste.