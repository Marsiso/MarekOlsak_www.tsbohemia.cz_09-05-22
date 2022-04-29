*** Variables ***
${popUpTitleXPath}              //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Informace o cookies")]
${popUpDescriptionXPath}        //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Soubory cookie používáme")]

# User login
${userInvlaidLoginMessageXPath}     //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'msgbox')]//p[contains(text(),'Akce vyžaduje Vaše přihlášení. Přihlaste se a akci opakujte')]

