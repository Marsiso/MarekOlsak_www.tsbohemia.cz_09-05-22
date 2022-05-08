*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Library          OperatingSystem
Library          Screenshot
Library          DateTime
Resource         ../variables/containers.robot
Resource         ../variables/urls.robot
Resource         ../variables/links.robot
Resource         ../variables/buttons.robot
Resource         ../variables/browser.robot
Resource         ../variables/images.robot
Resource         ../variables/drivers.robot
Resource         ../variables/lists.robot
Resource         ../variables/screenshots.robot
Resource         ../variables/viewPorts.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/mainNavigationPanel.robot

*** Variables ***
${DATETIME}=   ${EMPTY}

*** Test Cases ***
TC0301 Brand functionality
    [tags]                                                                  testCase                            elements
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check main navigation panel brand functionality                         ${mainNavPanelLogoLinkXPath}        ${categoriesListXPath}
    [teardown]                                                              Close web browser and clear cache

TC0302 Link's subSelection visibility during state mouse: hover
    [tags]                                                                  testCase                            subSelection
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check link's subSelection visibility during state mouse: hover          ${notebookImgXPath}                 ${categoriesListXPath}
    [teardown]                                                              Close web browser and clear cache

TC0303 Link's subSelection visibility during state mouse: hover
    [tags]                                                                  testCase                            subSelection
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check link's subSelection visibility during state mouse: hover          ${notebookImgXPath}                 ${categoriesListXPath}
    [teardown]                                                              Close web browser and clear cache

TC0304 Categories visibility during mobile's viewport size
    [tags]                                                                  testCase                            dropdown
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check categories visibility during mobile's viewport size               ${mobileViewPortWidth}              ${mainNavPnlDropDownMenuBtnXPath}
    ...                                                                     ${categoriesListXPath}              ${screenshotDirectory}
    ...                                                                     ${DATETIME}
    [teardown]                                                              Close web browser and clear cache

TC0305 Visiblity of dropdown items when menu item is toggled
    [tags]                                                                  testCase                            dropdown
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check visiblity of dropdown items when menu item is toggled             ${categoriesListXPath}              ${screenshotDirectory}
    ...                                                                     ${DATETIME}
    ...                                                                     ${mobileViewPortWidth}              ${mainNavPnlDropDownMenuBtnXPath}
    [teardown]                                                              Close web browser and clear cache

TC0306 Visiblity of dropdown items when previous menu item is toggled
    [tags]                                                                  testCase                            dropdown
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check visiblity of dropdown items when previous menu item is toggled    ${categoriesListXPath}              ${screenshotDirectory}
    ...                                                                     ${DATETIME}
    ...                                                                     ${mobileViewPortWidth}              ${mainNavPnlDropDownMenuBtnXPath}
    [teardown]                                                              Close web browser and clear cache
