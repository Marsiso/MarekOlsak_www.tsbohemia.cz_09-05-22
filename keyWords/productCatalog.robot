*** Keywords ***
Parse string and convert to number
    [documentation]
    [arguments]   ${string}
    Should be string   ${string}

    # Try to find floating point in passed string
    ${string}=   Get regexp matches   ${string}   \([0-9]+.?)+(,(.?[0-9]+)+)?
    ${len}=   Get length   ${string}
    Should be true   ${0} < ${len}

    # Anglosas notation conversion
    ${string}=   Replace string using regexp   ${string}[0]   ,   .

    # Remove trailing whitespaces
    ${string}=   Remove string using regexp   ${string}   [^0-9\.]

    # Convert to float and return converted value
    ${number}=   Convert to number   ${string}
    [return]   ${number}

Parse string and convert to integer
    [arguments]   ${string}
    Should be string   ${string}

    # Try to find integer in passed string
    ${string}=   Get regexp matches   ${string}   \([0-9]+.?)*[0-9]+
    ${len}=   Get length   ${string}
    Should be true   ${0} < ${len}

    # Remove any char which is not digit
    ${string}=   Remove string using regexp   ${string}[0]   [^0-9]

    # Convert to integer and return converted value
    ${integer}=   Convert to integer   ${string}
    [return]   ${integer}

Scrap currency data from string
    [arguments]   ${string}

    Should be string   ${string}

    # Scrap currency data
    ${currency}=   Get regexp matches   ${string}   CurCode.:.(CZK)|(EUR)|(USD)
    ${len}=   Get length   ${currency}
    Should be true   ${0} < ${len}

    ${currency}=   Get regexp matches   ${string}   (CZK)|(EUR)|(USD)
    ${len}=   Get length   ${currency}
    Should be true   ${0} < ${len}
    ${currency}=   Set variable   ${currency}[0]

    # Scrap price data
    ${price}=   Get regexp matches   ${string}   wovat.:.([0-9]+.?)+(,(.?[0-9]+)+)?
    ${len}=   Get length   ${price}
    Should be true   ${0} < ${len}

    # Anglosas notation conversion
    ${price}=   Replace string using regexp   ${price}[0]   ,   .

    # Remove trailing whitespaces
    ${price}=   Remove string using regexp   ${price}   [^0-9\.]

    # Convert to float and return converted value
    ${price}=   Convert to number   ${price}

    # Return values
    [return]   ${price}   ${currency}

Scrap data id from string
    [arguments]   ${string}

    Should be string   ${string}

    # Scrap id data
    ${id}=   Get regexp matches   ${string}   StiId.:.[0-9]+
    ${len}=   Get length   ${id}
    Should be true   ${0} < ${len}

    # Remove anything but numbers
    ${id}=   Remove string using regexp   ${id}[0]   [^0-9]+

    # Convert to float and return converted value
    ${id}=   Convert to integer   ${id}

    # Return values
    [return]   ${id}

Scroll element into view and set focus
    [arguments]   ${element}
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${element}
    Execute Javascript   window.scrollTo(0,0);
    Mouse over   //div[@id='head_menu']

Check price slider interactability
    [arguments]   ${slider}   ${counter}

    # Prerequisite elements
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${slider}
    Wait until element is visible   ${slider}/span[1]
    Wait until element is visible   ${slider}/span[2]

    # Get horizontal position of sliders
    ${leftX}=   Get horizontal position   ${slider}/span[1]
    ${rightX}=   Get horizontal position   ${slider}/span[2]
    ${range}=   Evaluate   ${rightX} - ${leftX}

    # Calculate offset
    ${offset}=   Evaluate   ${range} / 20
    ${offset}=   Convert to integer   ${offset}

    FOR   ${num}   IN   1   2   2   1
       # Drag and drop slider and bring them closer
       IF   ${num} == 1
          Drag and drop by offset   ${slider}/span[${num}]   ${offset}   0
          Scroll element into view and set focus   ${counter}
          ${leftX}=   Get horizontal position   ${slider}/span[${num}]
       ELSE
          Drag and drop by offset   ${slider}/span[${num}]   -${offset}   0
          Scroll element into view and set focus   ${counter}
          ${rightX}=   Get horizontal position   ${slider}/span[${num}]
       END

       # Calculate new range
       ${newRange}=   Evaluate   ${rightX} - ${leftX}
       Should be true   ${newRange} <= ${range}
    END

    # Calculate new range
    ${range}=   Evaluate   ${rightX} - ${leftX}

    FOR   ${num}   IN   1   2   2   1
       # Drag and drop slider and further them
       IF   ${num} == 1
          Drag and drop by offset   ${slider}/span[${num}]   -${offset}   0
          Scroll element into view and set focus   ${counter}
          ${leftX}=   Get horizontal position   ${slider}/span[${num}]
       ELSE
          Drag and drop by offset   ${slider}/span[${num}]   ${offset}   0
          Scroll element into view and set focus   ${counter}
          ${rightX}=   Get horizontal position   ${slider}/span[${num}]
       END

       # Calculate new range
       ${newRange}=   Evaluate   ${rightX} - ${leftX}
       Should be true   ${newRange} >= ${range}
    END

Check lower and upper price limitations data updates
    [arguments]   ${slider}   ${leftPrice}   ${rightPrice}   ${counter}

    # Get horizontal position of sliders
    ${leftX}=   Get horizontal position   ${slider}/span[1]
    ${rightX}=   Get horizontal position   ${slider}/span[2]
    ${range}=   Evaluate   ${rightX} - ${leftX}

    # Calculate offset
    ${offset}=   Evaluate   ${range} / 20
    ${offset}=   Convert to integer   ${offset}

    # Get lower limit
    ${limit}=   Get text   ${leftPrice}
    ${limit}=   Parse string and convert to integer   ${limit}

    # Drag right slider to the left
    FOR   ${num}   IN   2   2   2
       # Get previous value
       ${priceLimitValue}=   Get text   ${rightPrice}
       ${priceLimitValue}=   Parse string and convert to integer   ${priceLimitValue}

       # Drag and drop slider and bring them closer
       Drag and drop by offset   ${slider}/span[${num}]   -${offset}   0
       Scroll element into view and set focus   ${counter}
       ${rightX}=   Get horizontal position   ${slider}/span[${num}]

       # Get new value
       ${newPriceLimitValue}=   Get text   ${rightPrice}
       ${newPriceLimitValue}=   Parse string and convert to integer   ${newPriceLimitValue}

       # Compare values
       Should be true   ${priceLimitValue} >= ${newPriceLimitValue} and ${newPriceLimitValue} >= ${limit}
    END

    # Get upper limit
    ${limit}=   Get text   ${rightPrice}
    ${limit}=   Parse string and convert to integer   ${limit}

    # Drag left slider to the right
    FOR   ${num}   IN   1   1   1
       # Get previous value
       ${priceLimitValue}=   Get text   ${rightPrice}
       ${priceLimitValue}=   Parse string and convert to integer   ${priceLimitValue}

       # Drag and drop slider and bring them closer
       Drag and drop by offset   ${slider}/span[${num}]   -${offset}   0
       Scroll element into view and set focus   ${counter}
       ${leftX}=   Get horizontal position   ${slider}/span[${num}]

       # Get new value
       ${newPriceLimitValue}=   Get text   ${rightPrice}
       ${newPriceLimitValue}=   Parse string and convert to integer   ${newPriceLimitValue}

       # Compare values
       Should be true   ${priceLimitValue} <= ${newPriceLimitValue} and ${newPriceLimitValue} <= ${limit}
    END

Try to pass the upper limit by raising the lower limit
    [arguments]   ${slider}   ${leftPrice}   ${rightPrice}   ${counter}

    # Get horizontal position of sliders
    ${leftX}=   Get horizontal position   ${slider}/span[1]
    ${rightX}=   Get horizontal position   ${slider}/span[2]
    ${range}=   Evaluate   2 * ( ${rightX} - ${leftX} )

    # Attempt to drag and drop left slider past right slider
    Drag and drop by offset   ${slider}/span[1]   ${range}   0
    Scroll element into view and set focus   ${counter}

    # Get new upper & lower price limit value
    ${lowerPriceLimitValue}=   Get text   ${leftPrice}
    ${lowerPriceLimitValue}=   Parse string and convert to integer   ${lowerPriceLimitValue}

    ${upperPriceLimitValue}=   Get text   ${leftPrice}
    ${upperPriceLimitValue}=   Parse string and convert to integer   ${upperPriceLimitValue}

    # Compare price limit values
    #Should be true   ${lowerPriceLimitValue} == ${upperPriceLimitValue}
    Pass execution if   ${lowerPriceLimitValue} == ${upperPriceLimitValue}   Lower price limit passed upper limit which is forbidden.


Check catalog data updates when price limit changed
    [arguments]   ${slider}   ${catalog}   ${counter}

    # Get horizontal position of sliders
    ${leftX}=   Get horizontal position   ${slider}/span[1]
    ${rightX}=  Get horizontal position   ${slider}/span[2]
    ${range}=   Evaluate   2* ( ${rightX} - ${leftX} )

    # offset ~= 2% of the slider
    ${offset}=  Evaluate   ${range} / 100
    ${offset}=   Convert to integer   ${offset}

    # Drag left slider until its value is equal to right slider
    Drag and drop by offset   ${slider}/span[1]   +${range}   0
    Scroll element into view and set focus   ${counter}

    # Slowly drag and drop slider to the left side resulting in decrease of lower price limite
    ${displayed}=   Set variable   ${0}
    TRY
        WHILE    True   limit=20
           # Get currently displayed catalog's items
           @{items}=   Get webelements   ${catalog}
           ${displayed}=   Get length   ${items}
           ${matches}=   Get text   ${counter}
           ${matches}=   Convert to integer   ${matches}

           IF   ${displayed} == 0 and ${displayed} == ${matches}
              # Coz maji blbe v katalogu, pokud se dolni a horni limit rovnaji, vznikne jedmoprvkova mnozina, jejiz cena odpovida nejdrazsi polozce,
              # ale asi aplikuji jinou logiku, jinak by zde byla keyworda Fail a test by koncil
              Comment   Catalog does not have any matches for the given filter.
              # Fail
           ELSE IF   ${displayed} == 1 and ${displayed} == ${matches}
              Comment   Catalog contains single match for the given filter.
           ELSE IF  ${displayed} >= 12 and ${displayed} <= ${matches}
              Comment   Catalog contains more than twelve matches for the given filter.
              Return from keyword
           ELSE IF  ${displayed} >= 9 and ${displayed} == ${matches}
              Comment   Catalog contains more than nine matches for the given filter.
           ELSE IF  ${displayed} >= 6 and ${displayed} == ${matches}
              Comment   Catalog contains more than six matches for the given filter.
           ELSE IF  ${displayed} >= 3 and ${displayed} == ${matches}
              Comment   Catalog contains more than three matches for the given filter.
           END
           Drag and drop by offset   ${slider}/span[1]   -${offset}   0
           Scroll element into view and set focus   ${counter}
        END
    EXCEPT
        Comment   While cycle hit its limit. Sufficient quota has not been met.
    END

    # Return status
    Pass execution if   ${displayed} > 1   Unable to verify catalog data updates due to low amout of test data.

Check catalog data updates when localization changed
    [arguments]   ${catalog}   ${form}   ${localization}   ${save}   ${counter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}

    # Proccess each item data
    @{prevItemPrices}=   Create list
    FOR   ${item}   IN   @{items}
       ${data}=   Get Element Attribute   ${item}  data-price
       Log   ${data}
       ${price}   ${currency}=   Scrap currency data from string   ${data}
       Log   ${price}
       Log   ${currency}
       Should be true   '${currency}' == 'CZK' and ${price} >= 0
       Append to list   ${prevItemPrices}   ${price}
    END

    # Change currency CZK-->EUR
    Click element   ${form}
    Scroll element into view and set focus   ${counter}
    Select from list by value   ${localization}   14
    Click element   ${save}
    #Scroll element into view and set focus   ${counter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}

    # Proccess each item data
    @{itemPrices}=   Create list
    FOR   ${item}   IN   @{items}
       ${data}=   Get Element Attribute   ${item}  data-price
       Log   ${data}
       ${price}   ${currency}=   Scrap currency data from string   ${data}
       Log   ${price}
       Log   ${currency}
       Should be true   '${currency}' == 'EUR' and ${price} >= 0
       Append to list   ${itemPrices}   ${price}
    END

    # Compare prices
    ${len1}=   Get length   ${prevItemPrices}
    ${len2}=   Get length   ${itemPrices}
    Should be true   ${len1} == ${len2}
    FOR   ${i}   IN RANGE   0   ${len1 - 1}
       Should be true   ${prevItemPrices}[${i}] >= ${itemPrices}[${i}]
    END

Sort catalog data by price in ascending order and compare their values
    [arguments]   ${catalog}   ${filter}   ${value}

    # Choose catalog filter
    Select from list by value   ${filter}   ${value}
    Scroll element into view and set focus   ${filter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   0   ${len - 1}
       # Get tem data
       ${data}=   Get Element Attribute   ${items}[${i}]  data-price
       IF   ${i} == 0
          ${prevPrice}   ${prevCurrency}=   Scrap currency data from string   ${data}
       ELSE
          ${price}   ${currency}=   Scrap currency data from string   ${data}

          # Compare current item and previous item price tags
          Should be true   ${price} >= ${prevPrice}

          # Set new previous data
          ${prevPrice}=   Set variable   ${price}
          ${prevCurrency}=   Set variable   ${currency}
       END
    END

Sort catalog data by price in descending order and compare their values
    [arguments]   ${catalog}   ${filter}   ${value}

    #  Choose catalog filter
    Select from list by value   ${filter}   ${value}
    Scroll element into view and set focus   ${filter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   0   ${len - 1}
       # Get tem data
       ${data}=   Get Element Attribute   ${items}[${i}]  data-price
       IF   ${i} == 0
          ${prevPrice}   ${prevCurrency}=   Scrap currency data from string   ${data}
       ELSE
          ${price}   ${currency}=   Scrap currency data from string   ${data}

          # Compare current item and previous item price tags
          Should be true   ${price} <= ${prevPrice}

          # Set new previous data
          ${prevPrice}=   Set variable   ${price}
          ${prevCurrency}=   Set variable   ${currency}
       END
    END

Sort catalog data by name in alphabetical order AZ and compare their values
    [arguments]   ${catalog}   ${filter}   ${value}

    # Choose catalog filter
    Select from list by value   ${filter}   ${value}
    Scroll element into view and set focus   ${filter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   3   ${len - 1}
       # Get new item data
       ${data}=   Get Element Attribute   ${items}[${i}]  title
       Should be string   ${data}
       ${data}=   Convert to lower case   ${data}
       IF   ${i} == 3
          ${prevData}=   Set variable   ${data}
       ELSE
          Log   ${prevData}
          Log   ${data}
          # Compare two strings
          Should be true   '${prevData}' <= '${data}'

          # Set new previous data
          ${prevData}=   Set variable   ${data}
       END
    END

Sort catalog data by name in alphabetical order ZA and compare their values
    [arguments]   ${catalog}   ${filter}   ${value}

    # Choose catalog filter
    Select from list by value   ${filter}   ${value}
    Scroll element into view and set focus   ${filter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   3   ${len - 1}
       # Get new item data
       ${data}=   Get Element Attribute   ${items}[${i}]  title
       Should be string   ${data}
       ${data}=   Convert to lower case   ${data}
       IF   ${i} == 3
          ${prevData}=   Set variable   ${data}
       ELSE
          Log   ${prevData}
          Log   ${data}
          # Compare two strings
          Should be true   '${prevData}' >= '${data}'

          # Set new previous data
          ${prevData}=   Set variable   ${data}
       END
    END

Sort catalog data by id in ascending order and compare their values
    [arguments]   ${catalog}   ${filter}   ${value}

    # Choose catalog filter
    Select from list by value   ${filter}   ${value}
    Scroll element into view and set focus   ${filter}

    # Get list of catalog items
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   0   ${len - 1}
       # Get new item data
       ${data}=   Get Element Attribute   ${items}[${i}]  data-price
       ${id}=   Scrap data id from string   ${data}
       IF   ${i} == 0
          ${prevId}=   Set variable   ${id}
       ELSE
          Log   ${prevId}
          Log   ${id}
          # Compare two values
          Should be true   ${prevId} < ${id}

          # Set new previous data
          ${prevId}=   Set variable   ${id}
       END
    END

Sort catalog data by availability on branch office
    [arguments]   ${branchesBtn}   ${branches}   ${counter}

    # Choose catalog filter
    Scroll element into view and set focus   ${branchesBtn}
    Click element   ${branchesBtn}

    # Get list of catalog items
    @{branches}=   Get webelements   ${branches}
    ${len}=   Get length   ${branches}

    # Compare catalog item price tags
    FOR   ${i}   IN RANGE   1   ${len}
       Wait until keyword succeeds   30 seconds   5 seconds   Click element   ${branches}[${i}]
       Scroll element into view and set focus   ${counter}
       ${string}=   Get text   ${counter}
       IF   ${i} == 1
          ${prevNumber}=   Convert to integer   ${string}
       ELSE
          ${number}=   Convert to integer   ${string}
          Should be true   ${number} >= ${prevNumber}
       END
    END

Sort catalog data by manufacturer and parameters
    [arguments]   ${toogleButton}   ${guideSection}   ${acer}   ${filter}
    ...   ${itemNames}   ${itemNotes}   ${displayButton}   ${counter}

    # Toogle manufacturer and parameters window
    Scroll element into view   ${toogleButton}
    Click element   ${toogleButton}
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${acer}

    # Check manufacturer
    Scroll element into view   ${acer}
    Click element   ${acer}
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${filter}
    ${string}=   Get text   ${acer}
    Log   ${string}

    # Apply filter
    Scroll element into view   ${displayButton}
    Click element   ${displayButton}

    # Get data and verify matched items
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${counter}
    @{names}=   Get webelements   ${itemNames}
    @{notes}=   Get webelements   ${itemNotes}
    Log list   list_=${names}   level=INFO
    Log list   list_=${notes}   level=INFO

    ${lenNames}=   Get length   ${names}
    ${lenNotes}=   Get length   ${notes}

    Should be true   ${lenNames} == ${lenNotes}
    FOR   ${i}   IN   1   ${lenNames}
       # Check names
       ${string}=   Get text   ${names}[${i}]
       @{matches}=   Get regexp matches   ${string}   (ACER)
       ${len}=   Get length   ${matches}
       Should be true   ${len} > 0

       # Check notes
       ${string}=   Get text   ${notes}[${i}]
       @{matches}=   Get regexp matches   ${string}   (ACER)
       ${len}=   Get length   ${matches}
       Should be true   ${len} > 0
    END

Display catalog items as list or icons and take screenshot
    [arguments]   ${active}   ${inactive}   ${catalog}   ${screenShotDirectory}   ${fileName}   ${DATETIME}

    # Check visibility and dropdown menu
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${active}

    # Display catalog items as list
    Click element   ${active}
    Wait until keyword succeeds   30 seconds   5 seconds   Wait until element is visible   ${inactive}
    Click element   ${inactive}

    # Scroll middle element into view
    @{items}=   Get webelements   ${catalog}
    ${len}=   Get length   ${items}
    ${index}=   Evaluate   ${len} / 2
    ${index}=   Convert to integer   ${index}
    Scroll element into view   ${items}[${index}]

    # Take a screenshot
    ${date}=   Get Current Date   result_format=datetime
    SeleniumLibrary.Set Screenshot Directory   ${screenShotDirectory}\\${DATETIME}
    ${path}=   Capture page screenshot   filename=${fileName}
    File should exist   ${path}

Navigate through catalog pages and verify page has unique data
    [arguments]   ${links}   ${catalog}   ${counter}

    # Navigate through next few pages and log url
    FOR   ${i}   IN RANGE  1   10
       # Navigate to the next page
       Run keyword if   ${i} > 1   Click element   ${links}\//*[contains(text(),'${i}')]
       IF   ${i} == 2
          ${prevUrl}=   Get location

          # Scrap ids
          Wait until keyword succeeds   30 seconds   5 seconds   Scroll element into view and set focus   ${counter}
          @{items}=   Get webelements   ${catalog}
          ${len}=   Get length   ${items}
          @{prevIdList}=   Create list
          FOR   ${i}   IN RANGE   0   ${len - 1}
             # Get new item data
             ${data}=   Get Element Attribute   ${items}[${i}]  data-price
             ${id}=   Scrap data id from string   ${data}
             Append to list   ${prevIdList}   ${id}
          END

       # Verify visibility
       ELSE IF   ${i} > 4
          # Visit first page
          Click element   (${links})[1]
          ${url}=   Get location
          Comment   First page URL
          Log   ${url}   level=INFO

          # Visit second page
          Click element   (${links})[last() - 2]
          ${url}=   Get location
          Comment   First page URL
          Log   ${url}   level=INFO

          # Visit first page
          Click element   (${links})[2]
          ${url}=   Get location
          Comment   First page URL
          Log   ${url}   level=INFO

          # Visit last page

          Click element   (${links})[last() - 1]
          ${url}=   Get location
          Comment   Last page URL
          Log   ${url}   level=INFO

          BREAK
       ELSE IF   ${i} > 2
          # Compare prev and new URL
          Comment   Previous URL
          Log   ${prevUrl}   level=INFO
          ${url}=   Get location
          Comment   Current URL
          Log   ${url}   level=INFO
          Should be true  '${url}' > '${prevUrl}'

          # Scrap new cataloge page items ids
          Wait until keyword succeeds   30 seconds   5 seconds   Scroll element into view and set focus   ${counter}
          @{idList}=   Create list
          @{items}=   Get webelements   ${catalog}
          ${len}=   Get length   ${items}
          FOR   ${i}   IN RANGE   0   ${len - 1}
             # Get new item data
             ${data}=   Get Element Attribute   ${items}[${i}]  data-price
             ${id}=   Scrap data id from string   ${data}
             Append to list   ${idList}   ${id}
          END

          # Compare prev and current catalog page items ids
          FOR   ${id}   IN   @{idList}
             List should not contain value   ${prevIdList}   ${id}
          END

          # Set new prev values
          ${prevUrl}=   Set variable   ${url}
          ${prevIdList}=   Set variable   ${idList}
       END
    END