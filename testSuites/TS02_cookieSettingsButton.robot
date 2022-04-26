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
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/cookieSettingsButton.robot

*** Test Cases ***
Cookie settings button visibility
    [tags]                                              testCase                button
    Open web browser and visit domain's homepage        Chrome                  ${urlHomePage}
    Check cookie settings button visibility