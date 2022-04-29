*** Keywords ***
Check popUp visibility during domain's visit
    [arguments]                                 ${containerXPath}           ${agreeBtnXPath}            @{elements}

    FOR                                         ${element}                  IN                          @{elements}
        Wait until element is visible           ${element}
    END

    ${url}=                                     Get location
    Go to                                       ${url}

    FOR                                         ${element}                  IN                          @{elements}
        Wait until element is visible           ${element}
    END

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