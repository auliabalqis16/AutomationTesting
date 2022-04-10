*** Settings ***
Library     RequestsLibrary
Library     Collection

*** Variables ***
${base_url}=        https://reqres.in/

*** Test Cases ***
PUT_coba
    create session  mysession     ${base_url}
    ${body}=    create dictionary   name=narmiyah       job=leader
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    put request    mysession   api/users/2      data=${body}     headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     200
    ${res_body}=    convert to string  ${response.content}
    should contain      ${res_body}     narmiyah