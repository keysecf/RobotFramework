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
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "${PRODUTO}" pesquisado
    Adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto "${PRODUTO}" pesquisado
    Adicionar o produto "${PRODUTO}" no carrinho
    Verificar se o produto foi adicionado com sucesso
    Remover o produto do carrinho
    Verificar se o carrinho fica vazio

# Perguntas dessa tarefa
# Mostre para nós os testes que conseguiu automatizar no site da Amazon.com.br e cole o código
# de um desses testes aqui + o código da implementação das keywords desse teste.