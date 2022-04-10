*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://reqres.in
${user}     2

*** Test Cases ***
GET_coba
    create session  mysession   ${base_url}
    ${response}=    get request  mysession  /api/users/${user}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #Validations
    ${status_code}=     convert to string  ${response.status_code}
    should be equal     ${status_code}      200

    ${body}=        convert to string   ${response.content}
    should contain     ${body}     2

    ${contentTypeValue}=    get from dictionary    ${response.headers}     Content-Type
    should be equal     ${contentTypeValue}     application/json; charset=utf-8

