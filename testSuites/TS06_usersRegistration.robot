*** Settings ***
Documentation    A test suite testing cookies popUp element functionality.
...
...              This test has a workflow that is created using keywords &
...              variables in the imported resource files.
Library          SeleniumLibrary  run_on_failure=Nothing
Library          Collections
Resource         ../variables/urls.robot
Resource         ../variables/browser.robot
Resource         ../variables/drivers.robot
Resource         ../variables/radios.robot
Resource         ../variables/links.robot
Resource         ../variables/buttons.robot
Resource         ../variables/comboBoxes.robot
Resource         ../variables/formElements.robot
Resource         ../keyWords/preConditions.robot
Resource         ../keyWords/postConditions.robot
Resource         ../keyWords/usersRegistration.robot

*** Test Cases ***
TC0601 Registration form type selection via radio
    [tags]                                                                  testCase                            elements
    ...                                                                     radio
    Open web browser at domain's homepage and hide cookies popUp         ${browser}                          ${urlHomePage}
    ...                                                                     ${driverPath}                       ${popUpBtnAgreeXPath}
    Check registration form type selection via radio funcionality              ${userAccountLogoLinkXPath}        ${userLoginPopUpRegistrationLinkXPath}
    ...                                                                     ${commonRegElementNames}        ${companyRegElementNames}
    ...                                                                     ${customerRadioXPath}             ${companyRadioXPath}
    ...                                                                     ${regFormBtnXPath}

TC0602 Country selection via comboBox
    [tags]                                                                  testCase                            comboBox
    Check country selection via comboBox functionality                       ${regFormCountriesCmbBoxXPath}
    [teardown]                                                              Close web browser and clear cache