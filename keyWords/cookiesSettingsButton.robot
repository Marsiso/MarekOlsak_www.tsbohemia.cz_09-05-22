*** Keywords ***
Log diff between dictionaries
    [arguments]   ${dic1}   ${dic2}

    @{diff}=                                    Create list
    FOR                                         ${el1}                IN                          &{dic1}
       ${match}=                                Set variable          ${False}
       FOR                                      ${el2}                IN                          &{dic2}
           IF                                   "${el1}" == "${el2}"
              ${match}=                         Set variable          ${True}
              BREAK
           END
       END
       IF                                       ${match} == ${False}
          Append to list                        ${diff}               ${el1}
       END
    END

    [return]                                    ${diff}

Check new popUp window visibility
    [arguments]                                 ${prevContainerXPath}               ${newContainerXPath}
    ...                                         ${settingsBtnXPath}                 ${declineCookiesBtnXPath}
    ...                                         ${saveSettingsBtnXPath}

    # New popUp window should have invalid XPath till button Cookies settings is pressed which prompts
    # dynamic changes to the element which makes it visible due to newly added class ch-2-visible
    Page should contain element                 ${prevContainerXPath}
    Page should not contain element             ${newContainerXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    # When button is pressed, previous popUp window's class ch-2-visible is removed
    # and thus XPath becomes invalid and element hidden
    Page should not contain element             ${prevContainerXPath}
    Page should contain element                 ${newContainerXPath}

    Wait until element is visible               ${declineCookiesBtnXPath}
    Wait until element is visible               ${saveSettingsBtnXPath}

    Page should contain checkbox                necessary
    Checkbox should be selected                 necessary
    Page should contain checkbox                preferences
    Checkbox should be selected                 preferences
    Page should contain checkbox                analytics
    Checkbox should not be selected             analytics
    Page should contain checkbox                marketing
    Checkbox should not be selected             marketing

Check button save settings functionality
    [arguments]                                 ${saveCookiesBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check preference cookies deselection functionality
    [arguments]                                 ${saveCookiesBtnXPath}      ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Unselect checkbox                           preferences

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check analytic cookies selection functionality
    [arguments]                                 ${saveCookiesBtnXPath}      ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Unselect checkbox                           preferences
    Click element                               analytics                   action_chain=True
    Checkbox should be selected                 analytics

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check marketing cookies selection functionality
    [arguments]                                 ${saveCookiesBtnXPath}      ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Unselect checkbox                           preferences
    Click element                               marketing                   action_chain=True
    Checkbox should be selected                 marketing

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check marketing and functional cookies selection functionality
    [arguments]                                 ${saveCookiesBtnXPath}      ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Checkbox should be selected                 preferences
    Click element                               marketing                   action_chain=True
    Checkbox should be selected                 marketing

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check marketing and analytic cookies selection functionality
    [arguments]                                 ${saveCookiesBtnXPath}      ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Click element                               preferences                 action_chain=True
    Click element                               marketing                   action_chain=True
    Checkbox should be selected                 marketing
    Click element                               analytics                   action_chain=True
    Checkbox should be selected                 analytics

    Click button                                ${saveCookiesBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO

Check button decline cookies functionality
    [arguments]                                 ${declineBtnXPath}          ${settingsBtnXPath}

    Wait until element is visible               ${settingsBtnXPath}
    Click button                                ${settingsBtnXPath}

    &{cookiesPrev}=                             Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesPrev}   level=INFO

    Wait until element is visible               ${declineBtnXPath}
    Click button                                ${declineBtnXPath}

    &{cookiesNew}=                              Get cookies                 as_dict=True
    Log dictionary                              dictionary=&{cookiesNew}    level=INFO

    ${diff}=                                    Log diff between dictionaries                           ${cookiesPrev}
                                                ...                                                     ${cookiesNew}

    Log list                                    list_=${diff}               level=INFO