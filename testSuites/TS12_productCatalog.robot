*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Library          OperatingSystem
Library          String
Library          DateTime
Resource         ../variables/urls.robot
Resource         ../variables/browser.robot
Resource         ../variables/drivers.robot
Resource         ../variables/buttons.robot
Resource         ../variables/urls.robot
Resource         ../variables/sliders.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/containers.robot
Resource         ../variables/screenshots.robot
Resource         ../variables/comboBoxes.robot
Resource         ../variables/links.robot
Resource         ../variables/lists.robot
Resource         ../variables/formElements.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/productCatalog.robot

*** Test Cases ***
TC1201 Price slider interactability
     [tags]   testCase   slider
     Open web browser at domain's homepage and hide cookies popUp   ${browser}   ${notebooksURL}   ${driverPath}
     ...   ${popUpBtnAgreeXPath}
     ${status}=   Run keyword and return status   Check price slider interactability   ${priceSliderXPath}
     ...   ${catalogItemsCounterXPath}
     [teardown]   Cease following testcase evaluation when testcase fails   ${status}

TC1202 Lower and upper price bounds
     [tags]   testCase   data
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Check lower and upper price limitations data updates   ${priceSliderXPath}   ${priceSliderLowerPriceXPath}
     ...   ${priceSliderUpperPriceXPath}   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1203 Lower limit over upper
     [tags]   testCase   data
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Try to pass the upper limit by raising the lower limit   ${priceSliderXPath}   ${priceSliderLowerPriceXPath}
     ...   ${priceSliderUpperPriceXPath}   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1204 Catalog update when price limitation changed
     [tags]   testCase   data   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Check catalog data updates when price limit changed   ${priceSliderXPath}
     ...   ${notebooksCatalogDivXPath}   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1205 Catalog data update when price localization changed
     [tags]   testCase   data   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Check catalog data updates when localization changed   ${catalogItemsDivsXPath}
     ...   ${currencyMenuLogoDivXPath}   ${currencySelectionXPath}   ${localizationFormSaveBtnXPath}
     ...   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1206 Sort by price in ascending order
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by price in ascending order and compare their values  ${catalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}   ${sortPriceAscendingFilterValue}
     [teardown]   Close web browser and clear cache

TC1207 Sort by price in descending order
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by price in descending order and compare their values  ${catalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}   ${sortPriceDescendingFilterValue}
     [teardown]   Close web browser and clear cache

TC1208 Sort catalog data by name in alphabetical order AZ and compare their values
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by name in alphabetical order AZ and compare their values  ${catalogItemsNamesLinksXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByNameAplhabeticallyAZFilterValue}
     [teardown]   Close web browser and clear cache

TC1209 Sort catalog data by name in alphabetical order ZA
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by name in alphabetical order ZA and compare their values  ${catalogItemsNamesLinksXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByNameAplhabeticallyZAFilterValue}
     [teardown]   Close web browser and clear cache

TC1210 Sort catalog data by age in ascending order
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by id in ascending order and compare their values  ${catalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}   ${sortByAgeFilterValue}
     [teardown]   Close web browser and clear cache

TC1211 Sort catalog data by availibility on branch office
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by availability on branch office  ${branchListXPath}   ${branchListItemsXPath}   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1212 Sort catalog data by manufacturer and parameters
     [tags]   testCase   data   sort   filter
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Sort catalog data by manufacturer and parameters  ${manufacturersAndParametersToogleDivXPath}
     ...   ${manufacturersAndParametersGuideDivXPath}   ${manufacturersAndParametersAcerXPath}   ${filterListDivXPath}
     ...   ${catalogItemsNamesLinksXPath}   ${catalogItemsNotes}   ${manufacturersAndParametersDisplayBtnDivXPath}
     ...   ${catalogItemsCounterXPath}
     [teardown]   Close web browser and clear cache

TC1213 Display catalog items as list
     [tags]   testCase   data   display
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Display catalog items as list or icons and take screenshot   ${showStyleCatalogListActiveItemXPath}
     ...   ${showStyleCatalogListInactiveItemXPath}   ${catalogItemsDivsXPath}   ${screenshotDirectory}
     ...   TS12_Catalog_items_as_list.png
     [teardown]   Close web browser and clear cache

TC1214 Display catalog items as icons
     [tags]   testCase   data   display
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Display catalog items as list or icons and take screenshot   ${showStyleCatalogListActiveItemXPath}
     ...   ${showStyleCatalogListInactiveItemXPath}   ${catalogItemsDivsXPath}   ${screenshotDirectory}
     ...   TS12_Catalog_items_as_icons.png
     [teardown]   Close web browser and clear cache

TC1215 Navigate through catalog using pages and verify page has unique data
     [tags]   testCase   data   navigation
     Open web browser at domain's homepage and hide cookies popUp
     ...   ${browser}   ${notebooksURL}   ${driverPath}   ${popUpBtnAgreeXPath}
     Navigate through catalog pages and verify page has unique data   ${pageNavLinksXPath}   ${catalogItemsDivsXPath}
     ...   ${sortFilterSelectionXPath}
     [teardown]   Close web browser and clear cache