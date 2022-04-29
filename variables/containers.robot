*** Variable ***
# Cookies popUp
${cookiesPopUpDivXPath}             //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]
${settingsPopUpDivXPath}            //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]

# User account login popUp
${userLoginPopUpXPath}              //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'logincont')][contains(concat(' ',normalize-space(@class),' '),'frmauth')]
${userLoginPopUpLoginXPath}         //div[contains(concat(' ',normalize-space(@class),' '),'btnn')][contains(concat(' ',normalize-space(@class),' '),'btnnlogin')]
${accountIsLoggedInXPath}           //div[@id='bodyout'][@data-logged="1"]
${accountIsNotLoggedInXPath}        //div[@id='bodyout'][@data-logged="0"]