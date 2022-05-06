*** Keywords ***
Toogle and verify search window component structure
    [arguments]   ${form}   ${searchInput}   ${searchButton}   ${content}   ${pageLogo}

    # Main navigation panel form
    Page should contain element   ${form}
    Wait until element is visible   ${form}

    # Toogle and check window structure
    Page should contain element   ${searchInput}
    Wait until element is visible   ${searchInput}
    Click element   ${searchInput}

    Wait until element is visible   ${content}
    ${texts}=   Get text   ${content}

    Log   ${texts}   level=INFO
    Element should be visible   ${searchButton}

    # Hide search window by clicking outside of search window borders
    Click element   ${pageLogo}   action_chain=True
    Wait until element is not visible   {searchInput}

Search bar case sensitivity
    [arguments]   ${input}   ${matches}

    # Type word in lower case format and verify matching results
    Input text   ${input}   acer
    @{names}=   Create list
    ${i}=   Set variable   1
    WHILE   ${True}
       ${break}=   Run keyword and return status   Wait until page contains element   (${matches})[${i}]
       IF   ${break} == ${False}   BREAK
       ${string}=   Get text   (${matches})[${i}]
       Append to list   ${names}   ${string}
       ${string}=   Convert to lower case   ${string}
       ${subStrings}=   Get regexp matches   ${string}   (acer)|(notebooky)
       ${subStringsLen}=   Get length   ${subStrings}
       Should be true   ${subStringsLen} > 0
       ${i}=   Evaluate   ${i} + 1
    END
    Log list   list_=${names}   level=INFO

    # Type word in upper case format and verify matching results
    Input text   ${input}   ACER
    ${prevMaxI}=   Set variable   ${i}
    ${i}=   Set variable   1
    WHILE   ${True}
       ${break}=   Run keyword and return status   Wait until page contains element   (${matches})[${i}]
       IF   ${break} == ${False}   BREAK
       ${string}=   Get text   (${matches})[${i}]
       List should contain value   ${names}   ${string}
       ${i}=   Evaluate   ${i} + 1
    END

    Should be true   ${i} == ${prevMaxI}

Search bar autocomplete validation
   [arguments]   ${input}   ${matches}


    # Type word in lower case format and verify matching results
    ${expression}=   Set variable   ${Empty}
    FOR   ${char}   IN   a   c   a   p   a   s   r
        IF   '${char}' == 'a'
           Input text   ${input}   ${char}   clear=True
        ELSE
           Input text   ${input}   ${char}   clear=False
        END
        @{names}=   Create list
        ${expression}=   Set variable   ${expression}${char}
        ${i}=   Set variable   1
        WHILE   ${True}
           # Out-of range condition
           ${break}=   Run keyword and return status   Wait until page contains element  (${matches})[${i}]
           IF   ${break} == ${False}   BREAK

           # Check that element text contains expression
           ${string}=   Get text   (${matches})[${i}]
           ${lower}=   Convert to lower case   ${string}
           ${subStrings}=   Get regexp matches   ${lower}   (${expression})
           ${subStringsLen}=   Get length   ${subStrings}
           ${break}=   Run keyword and return status   Should be true   ${subStringsLen} > 0

           # Categories do not neccessarly need to cantain expression
           IF   ${break} == ${True}   Append to list   ${names}   ${string}
           ${i}=   Evaluate   ${i} + 1
        END
        Log list   list_=${names}   level=INFO

        # Compare matches for previous and current expression
        IF   '${char}' >= 'c'
           FOR   ${name}   IN   @{names}
              List should not contain value   ${copy}   ${name}
           END
        END
        @{copy}=   Copy list   list_=${names}
    END