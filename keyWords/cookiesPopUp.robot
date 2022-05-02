*** Keywords ***
Check popUp visibility during domain's visit
    [arguments]   ${button}   ${text}   @{elements}

    # Check if element is present in DOM and is visible
    FOR   ${element}   IN   @{elements}
       Wait until page contains element   ${element}
       Wait until element is visible   ${element}
       Comment   Cookies form element is present and visible
       Log   ${element}
    END

    Wait until page contains   ${text}

    # Agree with cookies and make popUp hidden and disabled
    Click Button   ${button}

    # Check if popUp is still present in the DOM
    ${bool}=   Run keyword and return status   Wait until page does not contain element   ${button}
    Pass execution if   ${bool}   Page does not contain cookies popUp element!
    ${bool}=   Run keyword and return status   Wait until element is not visible   ${button}
    Pass execution if   ${bool}   Cookies popUp element is not visible!
    Fail   PopUp is still visible and present in DOM!

Check link learn more
    [arguments]   ${link}   @{texts}

    # Get and log current url adress
    ${url}=   Get location
    Comment   Currently visited web page's URL adress
    Log   ${url}
    Wait until element is visible   ${link}

    # Click link
    Click link   ${link}

    # Get new url adress and log it
    ${newUrl}=   Get location
    Comment   Currently visited web page's URL adress
    Log   ${newUrl}

    # Compare current url adress with expected url adress
    Location should be   ${url}cookies.htm

    FOR   ${text}   IN   @{texts}
       Wait until page contains   ${text}
    END

Check button agree functionality
    [arguments]   ${form}   ${button}

    Wait until element is visible   ${button}

    # Get cookies copy before pressing agree button
    # and accepting default set of cookies
    &{cookiesPrev}=   Get cookies   as_dict=True
    Comment   Initial set of cookies before cookies selection!
    Log dictionary   dictionary=&{cookiesPrev}   level=INFO

    # Agree with default cookies
    Click element   ${button}
    Page should not contain element   ${form}

    # Get new cookies list
    &{cookiesNew}=   Get cookies   as_dict=True
    Comment   New set of cookies which you agreed to!
    Log dictionary   dictionary=&{cookiesNew}   level=INFO

    # Log cookies diff
    @{diff}=   Create list
    FOR   ${cookieNew}   IN   &{cookiesNew}
       ${match}=   Set variable   ${False}
       FOR   ${cookiePrev}   IN   &{cookiesPrev}
          IF   "${cookieNew}" == "${cookiePrev}"
             ${match}=   Set variable   ${True}
             BREAK
          END
       END
       IF   ${match} == ${False}
          Append to list   ${diff}   ${cookieNew}
       END
    END

    Comment   Cookies diff which you agreed to!
    Log list   list_=${diff}   level=INFO