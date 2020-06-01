***Settings***
Documentation       Tentativa de cadastro de produtos
...                 Estes cenários enriquecem a história da suite cadastro.robot


Resource            ../../resources/actions.robot

Suite Setup         Product Add Session  vanessaredes@yahoo.com.br    123456
Suite Teardown      Close Session

Test Setup          Go To Route Form
Test Teardown       After Test
Test Template       Tentar cadastrar produtos

***Keywords***
Tentar cadastrar produtos
    [Arguments]               ${json_file}          ${expect_alert}       

    Dado que eu tenho um novo produto               ${json_file}              
    Quando tento cadastrar esse produto
    Então devo ver uma mensagem informativa         ${expect_alert}

***Test Cases***
Nome não informado              no_title.json       Oops - Informe o nome do produto!       
Preço não informado             no_price.json       Oops - Informe o preço também!          
Categoria não selecionada       no_cat.json         Oops - Selecione uma categoria!         


