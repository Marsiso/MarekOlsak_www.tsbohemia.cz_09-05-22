*** Variables ***
${popUpTitleXPath}                  //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Informace o cookies")]
${popUpDescriptionXPath}            //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Soubory cookie používáme")]

# User login
${userInvlaidLoginMessageXPath}     //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'msgbox')]//p[contains(text(),'Akce vyžaduje Vaše přihlášení. Přihlaste se a akci opakujte')]

# User forgotten password
${emailNotFoundMsgXPath}            //lng[@id="2"][text()='Zadaný e-mail není registrován, zkuste zadat jiný e-mail nebo si vytvořte novou registraci.']
${emailFoundMshXPath}               //div[@class='cnt'][contains(text(),'Odkaz pro obnovení hesla byl zaslán na e-mail :')][contains(text(),'mara.olsik@gmail.com')]

# User

