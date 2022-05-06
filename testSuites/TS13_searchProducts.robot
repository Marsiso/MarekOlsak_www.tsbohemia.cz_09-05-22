*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Library          String
Resource         ../variables/urls.robot
Resource         ../variables/browser.robot
Resource         ../variables/drivers.robot
Resource         ../variables/buttons.robot
Resource         ../variables/urls.robot
Resource         ../variables/sliders.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/containers.robot
Resource         ../variables/links.robot
Resource         ../variables/inputs.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/searchProducts.robot


*** Test Cases ***
TC1301 Toogle search window
     [tags]   testCase   data
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Toogle and verify search window component structure   ${searchPnlFormDivXPath}   ${searchTextFieldInputXPath}
     ...   ${searchSubmitInputXPath}   ${searchPnlContentsDivsXPath}   ${mainNavPanelLogoLinkXPath}
     [teardown]   Close web browser and clear cache

TC1302 Search bar case sensitivity
     [tags]   testCase   data
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Search bar case sensitivity   ${searchTextFieldInputXPath}   ${searchPnlMatchesLinksXPath}
     [teardown]   Close web browser and clear cache

TC1303 Search bar autocomplete
     [tags]   testCase   data
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Search bar autocomplete validation   ${searchTextFieldInputXPath}   ${searchPnlMatchesLinksXPath}
     [teardown]   Close web browser and clear cache