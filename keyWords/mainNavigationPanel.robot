*** Keywords ***
Check main navigation panel brand functionality
    [arguments]                                             ${logoXPath}                        ${categoriesListXPath}

    # Check main navigation panel structure & visibility
    Wait until element is visible                           xpath=${logoXPath}
    ${x}=                                                   Set Variable                        ${1}
    WHILE    ${x} < 6
        Wait until element is visible                       xpath=${categoriesListXPath}/*[${x}]
        ${x}=                                               Evaluate                            ${x} + 1
    END

    # HomePage --> ElectroPage
    ${homePageUrl}=                                         Get location
    Click element                                           xpath=${categoriesListXPath}/*[1]
    ${electroUrl}=                                          Get location
    Run keyword if                                          "${homePageUrl}"=="${electroUrl}"   Fail

    # ElectroPage --> HomePage
    Click element                                           ${logoXPath}
    Location should be                                      ${homePageUrl}

    # HomePage --> HomePage
    Click element                                           ${logoXPath}
    Location should be                                      ${homePageUrl}

Check link's subSelection visibility during state mouse: hover
    [arguments]                                             ${notebookImgXPath}                 ${categoriesListXPath}

    Element should not be visible                           ${notebookImgXPath}

    # Check if category is visible in visible subSelection
    Mouse over                                              xpath=${categoriesListXPath}/*[1]
    Wait until element is visible                           ${notebookImgXPath}

    # Check if category is not visible in hidden subSelection
    Mouse over                                              xpath=${categoriesListXPath}/*[2]
    Wait until element is not visible                       ${notebookImgXPath}

Check subSelection visibility on linked webPage
    [arguments]                                             ${notebookImgXPath}                 ${categoriesListXPath}


    Element should not be visible                           ${notebookImgXPath}

    # Check if category is visible on separate page
    Click element                                           xpath=${categoriesListXPath}/*[1]
    Wait until element is visible                           ${notebookImgXPath}

Check categories visibility during mobile's viewport size
    [arguments]                                             ${mobileViewPortWidth}              ${menuBtnXPath}
    ...                                                     ${categoriesListXPath}              ${screenShotDirectory}
    ...                                                     ${DATETIME}


    # Check if viewPort's width and height are not already mobile device's display size
    ${maxWidth}  ${maxHeight}=                              Get window size
    IF                                                      ${maxWidth}>=${mobileViewPortWidth}
        # Menu button should not be toggled yet
        Wait until element is not visible                   ${menuBtnXPath}
        Set window size                                     ${mobileViewPortWidth}              ${maxHeight}
    END

    SeleniumLibrary.Set Screenshot Directory                ${screenShotDirectory}\\${DATETIME}

    # Check if menu button is displayed
    Wait until element is visible                           ${menuBtnXPath}

    # Capture & verify page's screenshot
    ${path}=                                                Capture page screenshot            filename=TS03_Mobile_ViewPort_MainMenu.png
    File should exist                                       ${path}

    # Toggle menu / Display dropdown items
    Click element                                           ${menuBtnXPath}

    # Check if category buttons are displayed
    ${x}=                                                   Set Variable                        ${1}
    WHILE    ${x} < 6
        Wait until element is visible                       xpath=${categoriesListXPath}/*[${x}]
        ${x}=                                               Evaluate                            ${x} + 1
    END

    # Capture & verify page's screenshot
    ${path}=                                                Capture page screenshot             filename=TS03_Mobile_ViewPort_ToggledMainMenu.png
    File should exist                                       ${path}

Check visiblity of dropdown items when menu item is toggled
    [arguments]                                             ${categoriesListXPath}              ${screenShotDirectory}
    ...                                                     ${DATETIME}
    ...                                                     ${mobileViewPortWidth}              ${menuBtnXPath}

    # Check if viewPort's width and height are not already mobile device's display size
    ${maxWidth}  ${maxHeight}=                              Get window size
    IF                                                      ${maxWidth}>=${mobileViewPortWidth}
        # Menu button should not be toggled yet
        Wait until element is not visible                   ${menuBtnXPath}
        Set window size                                     ${mobileViewPortWidth}              ${maxHeight}
    END

    # Check if menu button is displayed
    Wait until element is visible                           ${menuBtnXPath}

    # Toggle menu / Display dropdown items
    Click element                                           ${menuBtnXPath}

    SeleniumLibrary.Set Screenshot Directory                ${screenShotDirectory}\\${DATETIME}

    Scroll element into view                                xpath=${categoriesListXPath}/*[3]
    Click element                                           xpath=${categoriesListXPath}/*[3]
    ${path}=                                                Capture page screenshot            filename=TS03_Mobile_ViewPort_Hobby.png
    File should exist                                       ${path}

Check visiblity of dropdown items when previous menu item is toggled
    [arguments]                                             ${categoriesListXPath}              ${screenShotDirectory}
    ...                                                     ${DATETIME}
    ...                                                     ${mobileViewPortWidth}              ${menuBtnXPath}

    # Check if viewPort's width and height are not already mobile device's display size
    ${maxWidth}  ${maxHeight}=                              Get window size
    IF                                                      ${maxWidth}>=${mobileViewPortWidth}
        # Menu button should not be toggled yet
        Wait until element is not visible                   ${menuBtnXPath}
        Set window size                                     ${mobileViewPortWidth}              ${maxHeight}
    END

    # Check if menu button is displayed
    Wait until element is visible                           ${menuBtnXPath}

    # Toggle menu / Display dropdown items
    Click element                                           ${menuBtnXPath}


    SeleniumLibrary.Set Screenshot Directory                ${screenShotDirectory}\\${DATETIME}

    Scroll element into view                                xpath=${categoriesListXPath}/*[4]
    Click element                                           xpath=${categoriesListXPath}/*[4]
    Scroll element into view                                xpath=${categoriesListXPath}/*[1]
    ${path}=                                                Capture page screenshot            filename=TS03_Mobile_ViewPort_Sport.png
    File should exist                                       ${path}
