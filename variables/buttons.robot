*** Variables ***
# Cookies PopUp
${popUpBtnAgreeXPath}                   //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(text(),"Souhlasím")][contains(concat(' ',normalize-space(@class),' '),'ch2-btn')]
${popUpBtnSettingsXPath}                //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(text(),"Nastavení cookies")][contains(concat(' ',normalize-space(@class),' '),'ch2-btn')]
${popUpBtnDeclineCookiesXPath}          //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(concat(' ',normalize-space(@class),' '),'ch2-btn')][contains(concat(' ',normalize-space(@class),' '),'ch2-deny-all-btn')]
${popUpBtnSaveSettingsXPath}            //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(concat(' ',normalize-space(@class),' '),'ch2-btn')][contains(concat(' ',normalize-space(@class),' '),'ch2-save-settings-btn')]

# Main navigation panel
${mainNavPnlDropDownMenuBtnXPath}       //*[@class='middle']//*[@data-menu-main]
${mainNavPnlCurrency}                   //*[@data-currency-dropdown]//*[@data-currency-dropdown-toggle]

# Reset password
${sendResetPasswdEmailBtnXPath}         //tr[@class='btncell']//a[@title='Odeslat'][@href='#']

# Registeration form
${regFormBtnXPath}                      //*[contains(concat(' ',normalize-space(@class),' '),'btnn')][contains(concat(' ',normalize-space(@class),' '),'register')]//a[@title='Potvrdit']


