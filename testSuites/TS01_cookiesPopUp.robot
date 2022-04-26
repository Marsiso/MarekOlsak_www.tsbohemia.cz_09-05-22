*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Resource         ../variables/containers.robot
Resource         ../variables/urls.robot
Resource         ../variables/links.robot
Resource         ../variables/buttons.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/browser.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/cookiesPopUp.robot

*** Test Cases ***
TC0101 popUp visibility during domain's visit
    [tags]                                              testCase                container
    Open web browser and visit domain's homepage        ${browser}              ${urlHomePage}
    Check popUp visibility during domain's visit        ${popUpDivXPath}        ${popUpTitleXPath}          ${popUpDescriptionXPath}
    ...                                                 ${popUpLinkLearnMore}   ${popUpBtnAgreeXPath}       ${popUpBtnSettingsXPath}
    Close web browser and clear cache

TC0102 hypertext link learn more
    [tags]                                              testCase                link
    Open web browser and visit domain's homepage        ${browser}              ${urlHomePage}
    Check link learn more                               ${popUpLinkLearnMore}

TC0103 Button agree functionality
    [tags]                                              testCase                button
    Check button agree functionality                    ${popUpDivXPath}        ${popUpBtnAgreeXPath}
    Close web browser and clear cache