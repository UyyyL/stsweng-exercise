#UY, Lorene C.  STSWENG S14
*** Settings ***
Documentation   A test suite for Exercise: SeleniumIDE & RobotFramework Practice
...             
Resource        resources.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    [Teardown]  Close Browser

Locked Out Login
    Open Browser To Login Page
    Input Username      ${LOCKED OUT USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Locked User Error Message Should Be Shown
    [Teardown]  Close Browser

Wrong Password
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${INVALID PASSWORD}
    Click Login
    Wrong Password Error Message Should Be Shown
    [Teardown]  Close Browser

Problem Login
    Open Browser To Login Page
    Input Username      ${PROBLEM USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    Wrong Picture Should Be Shown
    [Teardown]  Close Browser

Sort A to Z
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    Sort A-Z
    [Teardown]  Close Browser

Sort Z to A
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    Sort Z-A
    [Teardown]  Close Browser

Sort Price Low to High
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    Sort Low-High
    [Teardown]  Close Browser

Sort Price High to Low
    Open Browser To Login Page
    Input Username      ${VALID USER}
    Input Pw            ${VALID PASSWORD}
    Click Login
    Home Page Should Be Open
    Sort High-Low
    [Teardown]  Close Browser