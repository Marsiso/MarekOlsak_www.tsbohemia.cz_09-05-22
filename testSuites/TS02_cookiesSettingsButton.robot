*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Resource         ../variables/containers.robot
Resource         ../variables/urls.robot
Resource         ../variables/buttons.robot
Resource         ../variables/tabs.robot
Resource         ../variables/browser.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/cookieSettingsButton.robot

*** Test Cases ***
TC0201 Cookie settings button visibility
    [tags]                                                  testCase                            elements
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    Check new popUp window visibility                       ${cookiesPopUpDivXPath}             ${settingsPopUpDivXPath}
    ...                                                     ${popUpBtnSettingsXPath}            ${popUpBtnDeclineCookiesXPath}
    ...                                                     ${popUpBtnSaveSettingsXPath}
    ...                                                     ${popUpCookiesSettingsTabXPath}     ${popUpCookiesDeclarationTabXPath}

TC0202 Button save settings functionality
    [tags]                                                  testCase                            button
    Check button save settings functionality                ${popUpBtnSaveSettingsXPath}
    Close web browser and clear cache

TC0203 Preference cookies deselection
    [tags]                                                  testCase                            switch
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    Check preference cookies deselection functionality       ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    Close web browser and clear cache

TC0204 Analytic cookies selection
    [tags]                                                  testCase                            switch
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    Check analytic cookies selection functionality          ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    Close web browser and clear cache

TC0205 Marketing cookies selection
    [tags]                                                  testCase                            switch
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    Check marketing cookies selection functionality         ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    Close web browser and clear cache

TC0206 Button decline cookies functionality
    [tags]                                                  testCase                            switch
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    Check button decline cookies functionality              ${popUpBtnDeclineCookiesXPath}      ${popUpBtnSettingsXPath}
    Close web browser and clear cache