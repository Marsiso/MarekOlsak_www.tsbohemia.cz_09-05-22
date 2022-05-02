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
Resource         ../variables/drivers.robot
Resource         ../variables/paragraphs.robot
Resource         ../variables/browser.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/cookiesPopUp.robot

*** Test Cases ***
TC0101 PopUp visibility during domain's visit
    [tags]   testCase   container   cookies
    Open web browser and visit domain's homepage   ${browser}   ${urlHomePage}   ${driverPath}
    Check popUp visibility during domain's visit   ${cookiesAgreeBtnXPath}   ${cookiesDescriptionText0}
    ...   ${cookiesLearnMoreLinkXPath}   ${popUpBtnSettingsXPath}
    [teardown]   Run keywords   Close web browser and clear cache

TC0102 Hypertext link learn more
    [tags]   testCase   link   cookies
    Open web browser and visit domain's homepage   ${browser}   ${urlHomePage}   ${driverPath}
    Check link learn more   ${cookiesLearnMoreLinkXPath}   ${cookiesDescriptionText1}   ${cookiesDescriptionText2}

TC0103 Button agree functionality
    [tags]   testCase   button   cookies
    Check button agree functionality   ${cookiesDivXPath}   ${cookiesAgreeBtnXPath}
    [teardown]   Run keywords   Close web browser and clear cache