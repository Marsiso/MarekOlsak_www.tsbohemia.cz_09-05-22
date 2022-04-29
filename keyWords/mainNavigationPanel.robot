*** Keywords ***
Check main navigation panel brand functionality
    [arguments]                                             ${logoXPath}                        ${electroDropdownXPath}
    ...                                                     ${householdDropdownXPath}           ${hobbyDropdownXPath}
    ...                                                     ${sportDropdownXPath}               ${drugstoreDropdownXPath}

    # Check main navigation panel structure & visibility
    Wait until element is visible                           ${logoXPath}
    Wait until element is visible                           ${electroDropdownXPath}
    Wait until element is visible                           ${householdDropdownXPath}
    Wait until element is visible                           ${hobbyDropdownXPath}
    Wait until element is visible                           ${sportDropdownXPath}
    Wait until element is visible                           ${drugstoreDropdownXPath}

    # HomePage --> ElectroPage
    ${homePageUrl}=                                         Get location
    Click element                                           ${electroDropdownXPath}
    ${electroUrl}=                                          Get location
    Run keyword if                                          "${homePageUrl}"=="${electroUrl}"   Fail

    # ElectroPage --> HomePage
    Click element                                           ${logoXPath}
    Location should be                                      ${homePageUrl}

    # HomePage --> HomePage
    Click element                                           ${logoXPath}
    Location should be                                      ${homePageUrl}

Check link's subSelection visibility during state mouse: hover
    [arguments]                                             ${notebookImgXPath}                 ${electroDropdownXPath}

    Element should not be visible                           ${notebookImgXPath}

    # Check if category is visible in visible subSelection
    Mouse over                                              ${electroDropdownXPath}
    Wait until element is visible                           ${notebookImgXPath}

    # Check if category is not visible in hidden subSelection
    Mouse out                                               ${electroDropdownXPath}
    Wait until element is not visible                       ${notebookImgXPath}

Check subSelection visibility on linked webPage
    [arguments]                                             ${notebookImgXPath}                 ${electroDropdownXPath}

    # Check if category is visible on separate page
    Click element                                           ${electroDropdownXPath}
    Wait until element is visible                           ${notebookImgXPath}

Check categories visibility during mobile's viewport size
    [arguments]                                             ${mobileViewPortWidth}              ${menuBtnXPath}
    ...                                                     ${electroBtnXPath}                  ${houseHoldBtnXPath}
    ...                                                     ${hobbyBtnXPath}                    ${sportBtnXPath}
    ...                                                     ${drugStoreBtnXPath}                ${screenShotDirectory}


    # Check if viewPort's width and height are not already mobile device's display size
    ${maxWidth}  ${maxHeight}=                              Get window size
    IF                                                      ${maxWidth}>=${mobileViewPortWidth}
        # Menu button should not be toggled yet
        Wait until element is not visible                   ${menuBtnXPath}
        Set window size                                     ${mobileViewPortWidth}              ${maxHeight}
    END

    ${date}=                                                Get Current Date                    result_format=datetime
    SeleniumLibrary.Set Screenshot Directory                ${screenShotDirectory}

    # Check if menu button is displayed
    Wait until element is visible                           ${menuBtnXPath}

    # Capture & verify page's screenshot
    ${path}=                                                Capture page screenshot            filename=${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_TS02_Mobile_ViewPort_MainMenu.png
    File should exist                                       ${path}

    # Toggle menu / Display dropdown items
    Click element                                           ${menuBtnXPath}

    # Check if category buttons are displayed
    Wait until element is visible                           ${electroBtnXPath}
    Wait until element is visible                           ${houseHoldBtnXPath}
    Wait until element is visible                           ${hobbyBtnXPath}
    Wait until element is visible                           ${sportBtnXPath}
    Wait until element is visible                           ${drugStoreBtnXPath}

    # Capture & verify page's screenshot
    ${path}=                                                Capture page screenshot          filename=${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_TS02_Mobile_ViewPort_ToggledMainMenu.png
    File should exist                                       ${path}

Check visiblity of dropdown items when button is toggled
    [arguments]                                             ${electroBtnXPath}                  ${houseHoldBtnXPath}
    ...                                                     ${hobbyBtnXPath}                    ${sportBtnXPath}
    ...                                                     ${drugStoreBtnXPath}                ${screenShotDirectory}

    Click element                                           ${drugStoreBtnXPath}

    ${date}=                                                Get Current Date                    result_format=datetime
    SeleniumLibrary.Set Screenshot Directory                ${screenShotDirectory}

    Scroll element into view                                ${sportBtnXPath}
    ${path}=                                                Capture page screenshot            filename=${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_TS02_Mobile_ViewPort_Sport.png
    File should exist                                       ${path}

