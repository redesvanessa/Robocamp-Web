***Settings***
Documentation       Cadastro de produtos
...                 Sendo um administrador de catálogo
...                 Quero cadastrar novos produtos
...                 Para que eu possa disponibiliza-los na loja virtual

Resource            ../resources/actions.robot

Suite Setup         Login Session  vanessaredes@yahoo.com.br    123456
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Novo produto
    [Tags]          new_product
    Dado que eu tenho um novo produto   dk.json
    Quando faço o cadastro deste produto
    Então devo ver este item na lista

Produto duplicado      
    [Tags]          dup
    Dado que eu tenho um novo produto   master.json
    Mas eu ja cadastrei esse item e não tinha lembrado
    Quando faço o cadastro deste produto
    Então devo ver a mensagem de alerta     Oops - Este produto já foi cadastrado!

