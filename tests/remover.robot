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
    Dado que eu tenho o produto "mario.json"
    Quando eu solicito a Exclusão
    E confirmo a solicitação
    Então não devo ver esse item no catálogo

Desistir da remoção
    Dado que eu tenho o produto "zelda.json"
    Quando eu solicito a Exclusão
    Mas cancelo a solicitação
    Então devo ver este item na lista