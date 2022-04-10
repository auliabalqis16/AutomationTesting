*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
LoginTest
    open browser                    https://www.demoblaze.com/index.html                    Chrome
    set selenium speed                                                                      1seconds
    maximize browser window
    click element                   id:login2
    wait until element is visible   id:loginusername
    input text                      id:loginusername                                        etane.gapuro@gmail.com
    wait until element is visible   id:loginpassword
    input text                      id:loginpassword                                        Sandaljapit2
    wait until element is enabled   xpath://*[@id="logInModal"]/div/div/div[3]/button[2]
    click element                   xpath://*[@id="logInModal"]/div/div/div[3]/button[2]
    wait until element is visible   id:logout2
    click element                   id:logout2

ContactTest
    click element                   xpath://*[@id="navbarExample"]/ul/li[2]/a
    wait until element is visible   id:recipient-email
    input text                      id:recipient-email                                       etane.gapuro@gmail.com
    wait until element is visible   id:recipient-name
    input text                      id:recipient-name                                        Justin Bieber
    wait until element is visible   id:message-text
    input text                      id:message-text                                          I love you 1500
    wait until element is enabled   xpath://*[@id="exampleModal"]/div/div/div[3]/button[2]
    click element                   xpath://*[@id="exampleModal"]/div/div/div[3]/button[2]
    close browser
