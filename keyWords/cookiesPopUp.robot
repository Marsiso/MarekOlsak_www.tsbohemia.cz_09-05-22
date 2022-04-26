*** Keywords ***
Check popUp visibility during domain's visit
    [arguments]                                 ${containerXPath}           ${titleXPath}               ${descriptionXPath}
    ...                                         ${linkXPath}                ${agreeBtnXPath}            ${settingsBtnXPath}

    Page should contain element                 ${containerXPath}
    Page should contain element                 ${titleXPath}
    Page should contain element                 ${descriptionXPath}
    Page should contain element                 ${linkXPath}
    Page should contain element                 ${agreeBtnXPath}
    Page should contain element                 ${settingsBtnXPath}

    ${url}=                                     Get location
    Go to                                       ${url}

    Element should be visible                   ${containerXPath}
    Element should be visible                   ${titleXPath}
    Element should be visible                   ${descriptionXPath}
    Element should be visible                   ${linkXPath}
    Element should be visible                   ${agreeBtnXPath}
    Element should be visible                   ${settingsBtnXPath}

    Wait until element is visible               ${containerXPath}
    Click Button                                ${agreeBtnXPath}
    Go to                                       ${url}

    Page should not contain element             ${containerXPath}

Check link learn more
    [arguments]                                 ${linkXPath}

    ${url}=                                     Get location
    Wait until element is visible               ${linkXPath}
    Click link                                  ${linkXPath}
    Location should be                          ${url}cookies.htm

Check button agree functionality
    [arguments]                                 ${containerXPath}           ${btnXPath}

    Wait until element is visible               ${btnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Click element                               ${btnXPath}
    Page should not contain element             ${containerXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    @{diff}=                                    Create list
    FOR                                         ${cookieNew}                IN                          &{cookiesNew}
       ${match}=                                Set variable                False
       FOR                                      ${cookiePrev}               IN                          &{cookiesPrev}
           IF                                   "${cookieNew}" == "${cookiePrev}"
              ${match}=                         Set variable                True
              BREAK
           END
       END
       IF                                       "${match}" == "False"
          Append to list                        ${diff}                     ${cookieNew}
       END
    END

    Log list                                    list_=${diff}               level=INFO