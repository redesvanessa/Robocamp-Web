***Settings***
Documentation       Exclusão de produtos
...                 Sendo um administrador de catálogo que possui produtos indesejados
...                 Quero deletar esses produtos
...                 Para que eu possa manter o catálogo organizado

Resource            ../resources/actions.robot

Suite Setup         Login Session  vanessaredes@yahoo.com.br    123456
Suite Teardown      Close Session

Test Teardown       After Test

***Test Cases***
Apagar produto
    [Tags]      delete_product
    Dado que "mario.json" é um produto indesejado
    Quando eu solicito a Exclusão
    E confirmo a solicitação
    Então não devo ver esse item no catálogo

Desistir da remoção
    Dado que "zelda.json" é um produto indesejado
    Quando eu solicito a Exclusão
    Mas cancelo a solicitação
    Então devo ver este item na lista