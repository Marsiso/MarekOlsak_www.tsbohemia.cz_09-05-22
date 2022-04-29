*** Variables ***
# Cookies PopUp
${popUpBtnAgreeXPath}                   //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(text(),"Souhlasím")][contains(concat(' ',normalize-space(@class),' '),'ch2-btn')]
${popUpBtnSettingsXPath}                //*[contains(concat(' ',normalize-space(@class),' '),'ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(text(),"Nastavení cookies")][contains(concat(' ',normalize-space(@class),' '),'ch2-btn')]
${popUpBtnDeclineCookiesXPath}          //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(concat(' ',normalize-space(@class),' '),'ch2-btn')][contains(concat(' ',normalize-space(@class),' '),'ch2-deny-all-btn')]
${popUpBtnSaveSettingsXPath}            //*[contains(concat(' ',normalize-space(@class),' '),'ch2-settings')][contains(concat(' ',normalize-space(@class),' '),'ch2-visible')][@role="dialog"]//*[contains(concat(' ',normalize-space(@class),' '),'ch2-btn')][contains(concat(' ',normalize-space(@class),' '),'ch2-save-settings-btn')]

# Main navigation panel
${mainNavPnlDropDownMenuBtnXPath}       //*[@class='middle']//*[@data-menu-main]
${mainNavPnlElectroBtnXPath}            //*[@id='i6sub_44669']//*[contains(concat(' ',normalize-space(@class),' '),'category-toggle')]
${mainNavPnlHouseHoldBtnXPath}          //*[@id='i6sub_6082']//*[contains(concat(' ',normalize-space(@class),' '),'category-toggle')]
${mainNavPnlHobbyBtnXPath}              //*[@id='i6sub_44670']//*[contains(concat(' ',normalize-space(@class),' '),'category-toggle')]
${mainNavPnlSportBtnXPath}              //*[@id='i6sub_44671']//*[contains(concat(' ',normalize-space(@class),' '),'category-toggle')]
${mainNavPnlDrugStoreBtnXPath}          //*[@id='i6sub_44672']//*[contains(concat(' ',normalize-space(@class),' '),'category-toggle')]
${mainNavPnlCurrency}                   //*[@data-currency-dropdown]//*[@data-currency-dropdown-toggle]

