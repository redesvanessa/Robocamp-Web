***Settings***
Documentation       Aqui teremos todas a palavras de ação dos testes autoamtizados

Library     SeleniumLibrary
Library     libs/database.py
Library     OperatingSystem

Resource    pages/BasePage.robot
Resource    helpers.robot


***Keywords***
########## Steps ##########
Dado que acesso a página login
    Go To       ${base_url}/login

Quando submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With      ${email}      ${pass}

Então devo ser autenticado
    Wait Until Element Is Visible       ${LOGGED_USER}
    Wait Until Element Contains         ${LOGGED_USER}      Vanessa
    
Então devo ver a mensagem de alerta "${expect_alert}"
    Wait Until Element Is Visible       ${ALERT}
    Element Text Should Be              ${ALERT}     ${expect_alert}

########## Cadastro de Produtos ##########

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

Quando tento cadastrar esse produto
    ProductPage.Create New Product      ${product_json}

Então devo ver este item na lista
    Table Should Contain        class:table                 ${product_json['title']}  

Então devo ver a mensagem de erro    
    [Arguments]                         ${expect_alert} 
    Wait Until Element Contains         ${ALERT_DANGER}     ${expect_alert} 

########## Exclusão ##########

Dado que "${json_file}" é um produto indesejado  
#Implementando com o conceito de Shared Steps
    #Dado que eu tenho um novo produto       ${json_file}
    #Quando faço o cadastro deste produto

#Implemetando chamando as Keywords
    ${product_json}=       Get Product Json   ${json_file}
    
    Remove Product by Title     ${product_json['title']}
    
    ProductPage.Go To Add Form
    ProductPage.Create New Product      ${product_json}
    
    Set Test Variable           ${product_json}

Quando eu solicito a Exclusão
    ProductPage.Request Removal     ${product_json['title']}

E confirmo a solicitação
    ProductPage.Confirm Removal

Então não devo ver esse item no catálogo
    Wait Until Element Does Not Contain     class:table     ${product_json['title']}

Mas cancelo a solicitação
    Cancel Removal

Então devo ver uma mensagem informativa    
    [Arguments]                         ${expect_alert} 
    Wait Until Element Contains         ${ALERT_INFO}     ${expect_alert} 
   # Go To                               http://pixel-web:3000/admin/products