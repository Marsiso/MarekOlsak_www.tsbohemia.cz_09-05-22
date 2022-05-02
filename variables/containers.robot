*** Variables ***
# Cookies popUp
${cookiesPopUpDivXPath}             //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]
${settingsPopUpDivXPath}            //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]

# User account login popUp
${userLoginPopUpXPath}              //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'logincont')][contains(concat(' ',normalize-space(@class),' '),'frmauth')]
${userLoginPopUpLoginXPath}         //div[contains(concat(' ',normalize-space(@class),' '),'btnn')][contains(concat(' ',normalize-space(@class),' '),'btnnlogin')]
${accountIsLoggedInXPath}           //div[@id='bodyout'][@data-logged="1"]
${accountIsNotLoggedInXPath}        //div[@id='bodyout'][@data-logged="0"]

# Notebook catalog
#${notebooksCatalogDivXPath}   //div[@id='productlistjx']//div[@id='gallarea']
${notebooksCatalogItemsIDsDivXPath}   //div[@id='prodidlist']
${notebooksCatalogDivXPath}   //div[@id='productlistjx']//div[@id='gallarea']//div[@class='prodbox']
${notebooksCatalogItemsDivsXPath}   //div[@id='productlistjx']//div[@id='gallarea']//div[@class='prodbox']//div[@data-price]
${notebooksCatalogPageCounterDivXPath}   //div[@id='infpagination']

# Localization
${currencyMenuLogoDivXPath}   //div[@id='currency-dropdown'][contains(concat(' ',normalize-space(@class),' '),'currency-dropdown')]