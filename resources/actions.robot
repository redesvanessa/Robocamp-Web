***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary
Library     libs/database.py
Library     OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/SideBar.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductPage.robot
Resource    helpers.robot

***Keywords***
## steps
Dado que acesso a página login
    Go To       ${base_url}/login

Quando submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With      ${email}      ${pass}

Então devo ser autenticado
    Wait Until Element Is Visible       ${LOGGED_USER}
    Wait Until Element Contains         ${LOGGED_USER}      Vanessa
    
Então devo ver a mensagem de alerta "${expect_alert}"
    Wait Until Element Is Visible       ${DIV_ALERT}
    Element Text Should Be              ${DIV_ALERT}     ${expect_alert}

#### Cadastro de Produtos ####

Dado que eu tenho um novo produto
    [Arguments]     ${json_file}
    ${product_json}=       Get Product Json   ${json_file}

    Remove Product by Title     ${product_json['title']}

    Set Test Variable           ${product_json}

Mas eu ja cadastrei esse item e não tinha lembrado
    ProductPage.Go To Add Form
    ProductPage.Create New Product      ${product_json}

Quando faço o cadastro deste produto
    ProductPage.Go To Add Form
    ProductPage.Create New Product      ${product_json}   

Então devo ver este item na lista
    Table Should Contain        class:table                 ${product_json['title']}  

Então devo ver a mensagem de alerta    
    [Arguments]                         ${expect_alert} 
    Wait Until Element Contains         ${ALERT_DANGER}     ${expect_alert} 

### Exclusão ###

Dado que eu tenho o produto "${json_file}"
    ${product_json}=       Get Product Json   ${json_file}

    
    Remove Product by Title     ${product_json['title']}

    Set Test Variable           ${product_json}


Quando eu solicito a Exclusão
E confirmo a solicitação
Então não devo ver esse item no catálogo