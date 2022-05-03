*** Variables ***
# Cookies popUp
${cookiesPopUpDivXPath}             //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]
${settingsPopUpDivXPath}            //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]

# User account login popUp
${userLoginPopUpXPath}              //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'logincont')][contains(concat(' ',normalize-space(@class),' '),'frmauth')]
${userLoginPopUpLoginXPath}         //div[contains(concat(' ',normalize-space(@class),' '),'btnn')][contains(concat(' ',normalize-space(@class),' '),'btnnlogin')]
${accountIsLoggedInXPath}           //div[@id='bodyout'][@data-logged="1"]
${accountIsNotLoggedInXPath}        //div[@id='bodyout'][@data-logged="0"]

# Catalog items
${notebooksCatalogItemsIDsDivXPath}   //div[@id='prodidlist']
${notebooksCatalogDivXPath}   //*[@id='gallarea']//*[@class='prodbox']
${catalogItemsDivsXPath}   //*[@id='gallarea']//*[@class='prodbox']//div[@data-price]
${notebooksCatalogPageCounterDivXPath}   //div[@id='infpagination']

# Localization
${currencyMenuLogoDivXPath}   //div[@id='currency-dropdown'][contains(concat(' ',normalize-space(@class),' '),'currency-dropdown')]

# Catalog filtering
${manufacturersAndParametersToogleDivXPath}   //*[@id='fltrparamshdr']
${manufacturersAndParametersGuideDivXPath}   //*[@id='categoryparams']//*[contains(text(),'      Průvodce výběrem')]
${manufacturersAndParametersAcerXPath}   //*[@class='param val'][.//span[contains(text(),'ACER')]]/div
${manufacturersAndParametersDisplayBtnDivXPath}   //*[@id='go_filter']
${filterListDivXPath}   //*[@id='act_filter_scaid']
