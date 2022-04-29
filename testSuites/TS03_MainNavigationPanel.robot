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
Resource         ../variables/listItems.robot
Resource         ../variables/screenshots.robot
Resource         ../variables/viewPorts.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/mainNavigationPanel.robot

*** Test Cases ***
TC0301 Brand functionality
    [tags]                                                                  testCase                            elements
    Open web browser at domain's homepage and hide cookies popUp            ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check main navigation panel brand functionality                         ${mainNavPanelLogoXPath}            ${electroDropdownXPath}
    ...                                                                     ${householdDropdownXPath}           ${hobbyDropdownXPath}
    ...                                                                     ${sportDropdownXPath}               ${drugstoreDropdownXPath}

TC0302 Link's subSelection visibility during state mouse: hover
    [tags]                                                                  testCase                            subSelection
    Check link's subSelection visibility during state mouse: hover          ${notebookImgXPath}                 ${electroDropdownXPath}

TC0303 Link's subSelection visibility during state mouse: hover
    [tags]                                                                  testCase                            subSelection
    Check link's subSelection visibility during state mouse: hover          ${notebookImgXPath}                 ${electroDropdownXPath}

TC0304 Categories visibility during mobile's viewport size
    [tags]                                                                  testCase                            dropdown
    Check categories visibility during mobile's viewport size               ${mobileViewPortWidth}              ${mainNavPnlDropDownMenuBtnXPath}
    ...                                                                     ${mainNavPnlElectroBtnXPath}        ${mainNavPnlHouseHoldBtnXPath}
    ...                                                                     ${mainNavPnlHobbyBtnXPath}          ${mainNavPnlSportBtnXPath}
    ...                                                                     ${mainNavPnlDrugStoreBtnXPath}      ${screenshotDirectory}

TC0305 Visiblity of dropdown items when button is toggled
    [tags]                                                                  testCase                            dropdown
    Check visiblity of dropdown items when button is toggled                ${mainNavPnlElectroBtnXPath}        ${mainNavPnlHouseHoldBtnXPath}
    ...                                                                     ${mainNavPnlHobbyBtnXPath}          ${mainNavPnlSportBtnXPath}
    ...                                                                     ${mainNavPnlDrugStoreBtnXPath}      ${screenshotDirectory}
    [teardown]                                                              Run keywords                        Close web browser and clear cache
