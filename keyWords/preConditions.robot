*** Keywords ***
Open chrome browser
    Create webdriver                                Chrome                          executable_path=C:\\Users\\m_ols\\PycharmProjects\\MarekOlsak_www.tsbohemia.cz_09_05_22\\drivers\\chromedriver.exe

Open edge browser
    Create webdriver                                Edge                            executable_path=

Open ie browser
    Create webdriver                                IE                              executable_path=

Manually manage to bypass captcha
    Sleep                                           15

Open web browser and visit domain's homepage
    [arguments]                                     ${browserName}                  ${url}
    Run keyword if                                  "${browserName}" == "Chrome"    Open chrome browser
    Run keyword if                                  "${browserName}" == "Edge"      Open edge browser
    Run keyword if                                  "${browserName}" == "IE"        Open ie browser
    Maximize browser window
    Go to                                           ${url}
    Manually manage to bypass captcha
    Set selenium speed                              0.5

