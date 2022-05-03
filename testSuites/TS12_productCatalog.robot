*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Fatal error
Library          Collections
Library          OperatingSystem
Library          String
Resource         ../variables/urls.robot
Resource         ../variables/browser.robot
Resource         ../variables/drivers.robot
Resource         ../variables/buttons.robot
Resource         ../variables/urls.robot
Resource         ../variables/sliders.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/containers.robot
Resource         ../variables/comboBoxes.robot
Resource         ../variables/links.robot
Resource         ../variables/formElements.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/productCatalog.robot

*** Test Cases ***
#TC1201 Price slider interactability
 #    [tags]   testCase   slider
 #    Open web browser at domain's homepage and hide cookies popUp   ${browser}   ${urlHomePage}   ${driverPath}
 #    ...   ${popUpBtnAgreeXPath}
 #    ${status}=   Run keyword and return status   Check price slider interactability   ${notebooksURL}   ${notebooksPriceSliderXPath}   ${notebooksCatalogItemsCounterMsgXPath}
 #    [teardown]   Cease following testcase evaluation when testcase fails   ${status}
 #
 #TC1202 Lower and upper price bounds
 #    [tags]   testCase   data
 #    ${status}=   Run keyword and return status   Check lower and upper price limitations data updates   ${notebooksPriceSliderXPath}
 #    ...   ${notebooksPriceSliderLowerPriceXPath}   ${notebooksPriceSliderUpperPriceXPath}   ${notebooksCatalogItemsCounterMsgXPath}
 #    [teardown]   Cease following testcase evaluation when testcase fails   ${status}
 #
 #TC1203 Lower limit over upper
 #    [tags]   testCase   data
 #    Try to pass the upper limit by raising the lower limit   ${notebooksPriceSliderXPath}
 #    ...   ${notebooksPriceSliderLowerPriceXPath}   ${notebooksPriceSliderUpperPriceXPath}   ${notebooksCatalogItemsCounterMsgXPath}
 #    [teardown]   Close web browser and clear cache
 #
 #TC1204 Catalog update when price limitation changed
 #    [tags]   testCase   data   filter
 #    Open web browser at domain's homepage and hide cookies popUp   ${browser}   ${urlHomePage}   ${driverPath}
 #    ...   ${popUpBtnAgreeXPath}
 #    ${status}=   Run keyword and return status   Check catalog data updates when price limit changed   ${notebooksURL}
 #    ...   ${notebooksPriceSliderXPath}   ${notebooksCatalogDivXPath}   ${notebooksCatalogItemsCounterMsgXPath}
 #    [teardown]   Cease following testcase evaluation when testcase fails   ${status}
 #
 #TC1205 Catalog data update when price localization changed
 #    [tags]   testCase   data   filter
 #    Check catalog data updates when localization changed   ${notebooksCatalogItemsDivsXPath}
 #    ...   ${currencyMenuLogoDivXPath}   ${currencySelectionXPath}   ${localizationFormSaveBtnXPath}
 #    ...   ${notebooksCatalogItemsCounterMsgXPath}
 #    [teardown]   Close web browser and clear cache

TC1206 Sort by price in ascending order
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp   ${browser}   ${urlHomePage}   ${driverPath}
     ...   ${popUpBtnAgreeXPath}
     Sort catalog data by price in ascending order and compare their values  ${notebooksURL}
     ...   ${notebooksCatalogItemsDivsXPath}   ${sortFilterSelectionXPath}   ${sortPriceAscendingFilterValue}

TC1207 Sort by price in descending order
     [tags]   testCase   data   sort   filter
     Sort catalog data by price in descending order and compare their values  ${notebooksCatalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}   ${sortPriceDescendingFilterValue}

TC1208 Sort catalog data by name in alphabetical order AZ and compare their values
     [tags]   testCase   data   sort   filter
     Sort catalog data by name in alphabetical order AZ and compare their values  ${notebooksCatalogItemsNamesLinksXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByNameAplhabeticallyAZFilterValue}

TC1209 Sort catalog data by name in alphabetical order ZA
     [tags]   testCase   data   sort   filter
     Sort catalog data by name in alphabetical order ZA and compare their values  ${notebooksCatalogItemsNamesLinksXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByNameAplhabeticallyZAFilterValue}

TC1210 Sort by age in ascending order
     [tags]   testCase   data   sort   filter
     Sort catalog data by id in ascending order and compare their values  ${notebooksCatalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByAgeFilterValue}

TC1211 Sort by availibility
     [tags]   testCase   data   sort   filter
     Sort catalog data by id in ascending order and compare their values  ${notebooksCatalogItemsDivsXPath}
     ...   ${shopListXPath}
     [teardown]   Close web browser and clear cache