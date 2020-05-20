***Settings***
Documentation       Aqui teremos todas as palavras chaves de ajuda

***Keywords***

Get Product Json
    [Arguments]         ${json_file}

    ${string_file}=        Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=       Evaluate    json.loads($string_file)     json

    [Return]            ${product_json}