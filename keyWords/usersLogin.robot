*** Keywords ***
Check popUp visibility after link click
    [arguments]                             ${userAccountLink}              @{elements}

    Wait until element is visible           ${userAccountLink}
    Click element                           ${userAccountLink}

    FOR                                     ${element}                      IN                       @{elements}
        Wait until element is visible       ${element}
    END

Validate users credentials
    [arguments]                             ${userNameForm}                 ${userName}
    ...                                     ${passwordForm}                 ${password}
    ...                                     ${accountLogo}                  ${logInBtn}
    ...                                     ${logedOutDiv}                  ${logedInDiv}

    # Check if page containes valid container for loggedOut user
    ${bool1}=                               Run Keyword And Return Status
    ...                                     Page should not contain element     ${logedInDiv}
    ${bool2}=                               Run Keyword And Return Status
    ...                                     Page should contain element         ${logedOutDiv}

    TRY
        Should be equal                     ${bool1}                        ${bool2}
        Should be equal                     ${bool1}                        ${True}
    EXCEPT
        Log to console                      || User should not be logged in!! ||                    format=*^60
        Fail
    END

    # Open logIn form
    TRY
        Wait until element is visible       ${accountLogo}
        Click element                       ${accountLogo}
    EXCEPT
        Log to console                      || Failed locating the login form!! ||                 format=*^60
        Fail
    END

    # Log in process
    TRY
       # Clear credentials
        Clear element text                  ${userNameForm}
        Clear element text                  ${passwordForm}

        # Fill in credentials
        Input text                          ${userNameForm}                 ${userName}
        Input password                      ${passwordForm}                 ${password}

        # Try to log in
        Click element                       ${logInBtn}
    EXCEPT
        Log to console                      || Failed filling in credentials!! ||                   format=*^60
        Return from keyword                 ${True}
    END

    # Check if page containes valid container for loggedIn user
    ${bool1}=                               Run Keyword And Return Status
    ...                                     Page should contain element         ${logedInDiv}
    ${bool2}=                               Run Keyword And Return Status
    ...                                     Page should not contain element     ${logedOutDiv}

    # Return True if credentials validation was successful else False & restore init state
    TRY
        Should be equal                     ${bool1}                        ${bool2}
        Should be equal                     ${bool1}                        ${True}
        Return from keyword                 ${True}
    EXCEPT
        Log to console                      || Page does not contain logged in user elements!! ||   format=*^60
        Return from keyword                 ${False}
    END

Check link forgotten password functionality
    [arguments]                             ${accLogo}                      ${link}
    ...                                     ${emailForm}                    ${sendBtn}
    ...                                     ${failMsg}                      ${succMsg}
    ...                                     ${url}                          ${email}

    # Navigate to the forgotten password formn
    Go to                                   ${url}
    Wait until element is visible           ${accLogo}
    Click element                           ${accLogo}
    Wait until element is visible           ${link}
    Click element                           ${link}
    Element should be visible               ${emailForm}

    # Email form
    TRY
       # Clear credentials
        Clear element text                  ${emailForm}

        # Fill in credentials
        Input text                          ${emailForm}                    ${email}

        # Try to send reset password link to your email
        Click element                       ${sendBtn}
    EXCEPT
        Log to console                      || Failed filling in credentials!! ||                   format=*^60
        Return from keyword                 ${True}
    END

    # Check if email is valid
    TRY
        Wait until element is visible       ${succMsg}
        Return from keyword                 ${True}
    EXCEPT
        # Email does not exist which triggers exception
        Log to console                      || Email does not exist!! ||                            format=*^60

        # Check if invalid email message is displayed
        TRY
            Wait until element is visible   ${failMsg}
            Return from keyword             ${False}
        EXCEPT
            # Both kinds of messages do not exist
            Log to console                  || Unexpectet error has occured!! ||                   format=*^60
        END
    END

    Return from keyword                     ${False}

Check link user registration functionality
    [arguments]
