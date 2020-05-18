***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary
Library     libs/database.py

Resource    pages/BasePage.robot
Resource    pages/SideBar.robot
Resource    pages/LoginPage.robot
Resource    pages/ProductPage.robot

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

#### Cadastro de Produtos

Dado que eu tenho um novo produto
    [Arguments]     ${json_file}

    ${string_file}=        Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=       Evaluate    json.loads($string_file)     json

    Remove Product by Title     ${product_json['title']}

    Set Test Variable      ${product_json}

Quando eu cadastro deste produto
    Wait Until Element Is Visible   ${ADD_PRODUCT}
    Click Element                   ${ADD_PRODUCT}

    Input Text      css:input[placeholder$="produto?"]      ${product_json['title']}
    
    #Seleciona Categoria
    Click Element   css:input[placeholder^=Gat]       

    Wait Until Element Is Visible   ${ADD_GATORIA}
    Click Element                   ${ADD_GATORIA}

    Input Text      css:input[name=price]            ${product_json['price']}

    Click Element   id:create-product

Então devo ver este item na lista
    Table Should Contain        class:table          ${product_json['title']}  
