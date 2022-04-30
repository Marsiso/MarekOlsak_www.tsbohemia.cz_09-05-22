*** Keywords ***
Check form contents
    [arguments]                             @{elements}

    FOR                                     ${element}                      IN                       @{elements}
        Wait until element is visible       ${element}
    END

Check registration form type selection via radio funcionality
    [arguments]                             ${accLogo}                      ${regLink}              ${commnonElements}
    ...                                     ${uniqueElements}               ${customerBtn}          ${companyBtn}
    ...                                     ${regBtn}

    # Navigate to the registration form
    Wait until element is visible           ${accLogo}
    Click element                           ${accLogo}
    Wait until element is visible           ${regLink}
    Click element                           ${regLink}

    # Check if default registration form
    Comment                                 Names of common inputs for company & customer type form
    Log list                                list_=${commnonElements}        level=INFO
    Wait until element is visible           ${customerBtn}
    FOR                                     ${element}                      IN                      @{commnonElements}
        Element should be visible           ${element}
    END

    # Switch to company type registration form
    Wait until element is visible           ${companyBtn}
    Click element                           ${companyBtn}                   action_chain=True

    ${companyElements}=                     Combine Lists                   ${commnonElements}      ${uniqueElements}
    Comment                                 Names of inputs for company type form
    Log list                                list_=${companyElements}        level=INFO
    FOR                                     ${element}                      IN                      @{companyElements}
        Scroll element into view            ${element}
        Element should be visible           ${element}
    END

    # Reset to default registration form
    Scroll element into view                ${customerBtn}
    Click element                           ${customerBtn}
    Comment                                 Names of unique inputs for company type form
    Log list                                list_=${uniqueElements}         level=INFO
    FOR                                     ${element}                      IN                      @{uniqueElements}
        Element should not be visible       ${element}
    END


    Scroll element into view                ${regBtn}
    Element should be visible               ${regBtn}

Check country selection via comboBox functionality
    [arguments]                             ${comboBox}

    Page should contain element             ${comboBox}
    Scroll element into view                ${comboBox}

    ${len}=                                 Get Element Count	            ${comboBox}/*
    ${i}=                                   Set Variable                    ${1}
    IF                                      ${len}==${0}
        Fail
    END

    WHILE                                   ${i}<=${len}                    limit=5
        Mouse down                          ${comboBox}
        Click element                       ${comboBox}/*[${i}]             action_chain=True
        ${i}=                               Evaluate                        ${i} + 1
    END
