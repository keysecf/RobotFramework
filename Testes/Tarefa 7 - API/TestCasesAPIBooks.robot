*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Resource        ResourceAPI.robot
Suite Setup     Conectar a minha API
Library         Collections

*** Variable ***

${QTDE_LIVROS}    200

&{BOOK}        id=200
...            title=Book 200
...            description=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.
...            pageCount=20000
...            excerpt=Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.Lorem lorem lorem. Lorem lorem lorem. Lorem lorem lorem.
...            publishDate=2022-08-03T10:34:50.930Z


*** Test Case ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna uma lista com "${QTDE_LIVROS}" livros

Cadastrar um novo livro (POST)
    Cadastrar o livro "&{BOOK}"
    Conferir se retorna todos os dados corretos do livro "&{BOOK}"

Buscar um livro específico (GET em um livro específico)
    Requisitar o livro "&{BOOK}"
    Conferir o status code    200
    Conferir o reason   OK
    Conferir se retorna todos os dados corretos do livro "&{BOOK}"

Alterar um livro (PUT)
    Alterar o livro "&{BOOK}" e conferir se retorna todos os dados alterados do livro


Deletar um livro (DELETE)
    Conferir se deleta o livro "&{BOOK}"
