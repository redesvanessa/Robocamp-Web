***Settings***
Documentation       ProductPage
...                 Representa a página de produtos com todos os seus elementos 
...                 E seus elementos


***Variables***
${ADD_PRODUCT}        class:product-add 

***Keywords***
Go To Add Form
    Wait Until Element Is Visible   ${ADD_PRODUCT}
    Click Element                   ${ADD_PRODUCT}

Create New Product
    [Arguments]      ${product_json}

    Input Text      css:input[placeholder$="produto?"]      ${product_json['title']}
    
    #Seleciona Categoria
    Click Element   css:input[placeholder^=Gat]       

    Wait Until Element Is Visible   xpath://li//span[text()='${product_json['cat']}']
    Click Element                   xpath://li//span[text()='${product_json['cat']}']

    Input Text      css:input[name=price]            ${product_json['price']}

    Click Element   id:create-product