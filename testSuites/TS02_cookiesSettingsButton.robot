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
Resource         ../variables/drivers.robot
Resource         ../variables/browser.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/cookiesSettingsButton.robot

*** Test Cases ***
TC0201 New popUp window visibility
    [tags]                                                  testCase                            elements
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    ...                                                     ${driverPath}
    Check new popUp window visibility                       ${cookiesPopUpDivXPath}             ${settingsPopUpDivXPath}
    ...                                                     ${popUpBtnSettingsXPath}            ${popUpBtnDeclineCookiesXPath}
    ...                                                     ${popUpBtnSaveSettingsXPath}

TC0202 Button save settings functionality
    [tags]                                                  testCase                            button
    Check button save settings functionality                ${popUpBtnSaveSettingsXPath}
    [teardown]                                              Run keywords                        Close web browser and clear cache

TC0203 Preference cookies deselection
    [tags]                                                  testCase                            cookies
    ...                                                     checkbox
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    ...                                                     ${driverPath}
    Check preference cookies deselection functionality      ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    [teardown]                                              Run keywords                        Close web browser and clear cache

TC0204 Analytic cookies selection
    [tags]                                                  testCase                            cookies
    ...                                                     checkbox
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    ...                                                     ${driverPath}
    Check analytic cookies selection functionality          ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    [teardown]                                              Run keywords                        Close web browser and clear cache

TC0205 Marketing cookies selection
    [tags]                                                  testCase                            cookies
    ...                                                     checkbox
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    ...                                                     ${driverPath}
    Check marketing cookies selection functionality         ${popUpBtnSaveSettingsXPath}        ${popUpBtnSettingsXPath}
    [teardown]                                              Run keywords                        Close web browser and clear cache

TC0206 Button decline cookies functionality
    [tags]                                                  testCase                            cookies
    ...                                                     checkbox
    Open web browser and visit domain's homepage            ${browser}                          ${urlHomePage}
    ...                                                     ${driverPath}
    Check button decline cookies functionality              ${popUpBtnDeclineCookiesXPath}      ${popUpBtnSettingsXPath}
    [teardown]                                              Run keywords                        Close web browser and clear cache