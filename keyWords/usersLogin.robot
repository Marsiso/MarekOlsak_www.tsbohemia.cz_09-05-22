*** Keywords ***
Check popUp visibility after link click
    [arguments]                             ${userAccountLink}              @{elements}

    Wait until element is visible           ${userAccountLink}
    Click element                           ${userAccountLink}

    FOR                                     ${element}                      IN                       @{elements}
        Wait until element is visible       ${element}
    END

Validate users credentials
    [arguments]                             ${loginUserNameInputForm}       ${loginUserName}
    ...                                     ${loginPasswordInputForm}       ${loginPassword}
    ...                                     ${userAccountLink}              ${loginButton}
    ...                                     ${}

    Wait until element is visible           ${userAccountLink}
    Click element                           ${userAccountLink}

    # Clear text field
    Clear element text                      ${loginUserNameInputForm}
    Clear element text                      ${loginPasswordInputForm}

    # Type input
    Input text                              ${loginUserNameInputForm}       ${loginUserName}
    Input password                          ${loginPasswordInputForm}       ${loginPassword}

    # Try to log in
    Click element                           ${loginButton}

    # Check if logOff link is present
    ${bool}=                                Run Keyword And Return Status
    ...                                     Page should not contain         ${userAccountLink}

    # Return True if credentials validation was successful else False & restore init state
    IF                                      ${bool}
        Return from keyword                 ${True}
    ELSE
        Return from keyword                 ${False}
    END
