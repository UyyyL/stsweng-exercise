*** Settings ***
Documentation   A resource file
...
...             This test follows the example using keywords from
...             the SeleniumLibrary
Library         SeleniumLibrary

*** Variables ***
${SERVER}               www.saucedemo.com
${BROWSER}              chrome
${VALID USER}           standard_user
${LOCKED OUT USER}      locked_out_user
${PROBLEM USER}         problem_user
${VALID PASSWORD}       secret_sauce
${INVALID PASSWORD}     not_secret_sauce
${LOGIN URL}            https://${SERVER}/   
${HOME URL}             https://${SERVER}/inventory.html   

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Page Should Contain Element     login-button

Home Page Should Be Open
    Element Text Should Be  class:title     PRODUCTS

Input Username
    [Arguments]     ${username}
    Input Text  user-name   ${username}

Input Pw
    [Arguments]     ${password}
    Input Text  password    ${password}

Click Login
    Click Button   login-button

Locked User Error Message Should Be Shown
    Element Text Should Be  xpath://*[@id="login_button_container"]/div/form/div[3]/h3      Epic sadface: Sorry, this user has been locked out.
    
Wrong Password Error Message Should Be Shown
    Element Text Should Be  xpath://*[@id="login_button_container"]/div/form/div[3]/h3      Epic sadface: Username and password do not match any user in this service

Wrong Picture Should Be Shown
    Page Should Contain Image   /static/media/sl-404.168b1cce.jpg

Sort A-Z
    Select From List By Value   class:product_sort_container    az
    Element Text Should Be  class:active_option     NAME (A TO Z)

Sort Z-A    
    Select From List By Value   class:product_sort_container    za
    Element Text Should Be  class:active_option     NAME (Z TO A)

Sort Low-High    
    Select From List By Value   class:product_sort_container    lohi
    Element Text Should Be  class:active_option     PRICE (LOW TO HIGH)

Sort High-Low    
    Select From List By Value   class:product_sort_container    hilo
    Element Text Should Be  class:active_option     PRICE (HIGH TO LOW)