*** Settings ***
Library     RequestsLibrary
Library     Collection

*** Variables ***
${base_url}=        https://reqres.in/

*** Test Cases ***
Delete_coba
    create session  mysession     ${base_url}
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    delete request    mysession   api/users/2         headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     204