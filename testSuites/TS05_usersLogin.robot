*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Resource         ../variables/urls.robot
Resource         ../variables/links.robot
Resource         ../variables/containers.robot
Resource         ../variables/buttons.robot
Resource         ../variables/browser.robot
Resource         ../variables/accounts.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/drivers.robot
Resource         ../variables/inputs.robot
Resource         ../variables/labels.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/usersLogin.robot

*** Test Cases ***
TC0501 PopUp visibility after link click
    [tags]                                                                  testCase                            link
    ...                                                                     popUp
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check popUp visibility after link click                                 ${userAccountLogoLinkXPath}         ${userLoginPopUpXPath}
    ...                                                                     ${userLoginPopUpNameInputXPath}     ${userLoginPopUpPasswdInputXPath}
    ...                                                                     ${userLoginPopUpLoginXPath}         ${userLoginPopUpRegistrationLinkXPath}
    ...                                                                     ${userLoginPopUpForgotPasswdLinkXPath}
    [teardown]                                                              Close web browser and clear cache

TC0502 Valid user name and password validation
    [tags]                                                                  testCase                            login
    ...                                                                     popUp
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    ${result}=      Validate users credentials                              ${userLoginPopUpNameInputXPath}     ${validUserName}
    ...                                                                     ${userLoginPopUpPasswdInputXPath}   ${validPassword}
    ...                                                                     ${userAccountLogoLinkXPath}         ${userLoginPopUpLoginXPath}
    ...                                                                     ${accountIsNotLoggedInXPath}        ${accountIsLoggedInXPath}
    Should be equal                                                         ${result}                           ${True}
    [teardown]                                                              Close web browser and clear cache

TC0503 Valid user name and invalid password validation
    [tags]                                                                  testCase                            login
    ...                                                                     popUp
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    ${result}=      Validate users credentials                              ${userLoginPopUpNameInputXPath}     ${validUserName}
    ...                                                                     ${userLoginPopUpPasswdInputXPath}   ${invalidPassword}
    ...                                                                     ${userAccountLogoLinkXPath}         ${userLoginPopUpLoginXPath}
    ...                                                                     ${accountIsNotLoggedInXPath}        ${accountIsLoggedInXPath}
    Should be equal                                                         ${result}                           ${False}
    [teardown]                                                              Close web browser and clear cache