*** Keywords ***
Open chrome browser
    [arguments]   ${driverPath}
    Create webdriver   Chrome   executable_path=${driverPath}

Open edge browser
    [arguments]   ${driverPath}
    Create webdriver   Edge   executable_path=${driverPath}

Open ie browser
    [arguments]   ${driverPath}
    Create webdriver   IE   executable_path=${driverPath}

Manually manage to bypass captcha
    Sleep   12s   Bypassing captcha

Open web browser and visit domain's homepage
    [arguments]   ${browserName}   ${url}   ${driverPath}
    Run keyword if   "${browserName}" == "Chrome"   Open chrome browser   ${driverPath}
    Run keyword if   "${browserName}" == "Edge"   Open edge browser   ${driverPath}
    Run keyword if   "${browserName}" == "IE"   Open ie browser   ${driverPath}
    Maximize browser window
    Go to   ${url}
    Manually manage to bypass captcha
    Set selenium speed   1 seconds

Open web browser at domain's homepage and hide cookies popUp
    [arguments]   ${browserName}   ${url}   ${driverPath}   ${button}
    Run keyword if   "${browserName}" == "Chrome"   Open chrome browser   ${driverPath}
    Run keyword if   "${browserName}" == "Edge"   Open edge browser   ${driverPath}
    Run keyword if   "${browserName}" == "IE"   Open ie browser   ${driverPath}
    Maximize browser window
    Go to   ${url}
    Manually manage to bypass captcha
    Set selenium speed   1 seconds
    Wait until element is visible   ${button}
    Click button   ${button}
    Wait until element is not visible   ${button}

On test teardown
    Run keyword if test failed    Log   Precondtions have not been met   WARN