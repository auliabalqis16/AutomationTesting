*** Settings ***
Library     RequestsLibrary
Library     Collection

*** Variables ***
${base_url}=    https://reqres.in/api/users

*** Test Cases ***
POST_coba
    create session  mysession     ${base_url}
    ${body}=    create dictionary   name=morpheus       job=leader
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request    mysession   /api/users  data=${body}        headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    ${status_code}=     convert to string  ${response.status_code}
    should be equal  ${status_code}     201
    ${res_body}=    convert to string  ${response.content}
    should contain      ${res_body}     morpheus



#Quick Get Request Test
#    ${response}=    GET  https://www.google.com
#
#Quick Get Request With Parameters Test
#    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200
#
#Quick Get A JSON Body Test
#    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
#    Should Be Equal As Strings    1  ${response.json()}[id]