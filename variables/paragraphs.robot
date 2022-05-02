*** Variables ***
# Cookies PopUp
${cookiesTitleText}   Informace o cookies na této stránce
${cookiesDescriptionText0}   Soubory cookie používáme ke shromažďování a analýze informací o výkonu a používání webu, zajištění fungování funkcí ze sociálních médií a ke zlepšení a přizpůsobení obsahu a reklam.
${cookiesDescriptionText1}   Vymazat můžete cookies ve Vašem prohlížeči – zpravidla bývá umístěno v „Historii“ navštívených stránek.
${cookiesDescriptionText2}   Prohlížeče umožňují umísťování cookies na Vás počítač zablokovat. V takovém případě bude ale funkcionalita těchto stránek omezena. Informace o nastavení ukládání souborů cookies ve Vašem prohlížeči najdete na stránkách poskytovatele konkrétního prohlížeče:


# User login
${userInvlaidLoginMessageXPath}     //div[contains(concat(' ',normalize-space(@class),' '),'tabformcont')][contains(concat(' ',normalize-space(@class),' '),'msgbox')]//p[contains(text(),'Akce vyžaduje Vaše přihlášení. Přihlaste se a akci opakujte')]

# User forgotten password
${emailNotFoundMsgXPath}            //lng[@id="2"][text()='Zadaný e-mail není registrován, zkuste zadat jiný e-mail nebo si vytvořte novou registraci.']
${emailFoundMshXPath}               //div[@class='cnt'][contains(text(),'Odkaz pro obnovení hesla byl zaslán na e-mail :')][contains(text(),'mara.olsik@gmail.com')]

# Sortiment filtering
${notebooksCatalogItemsCounterMsgXPath}   //div[@id='pagetext']/p[@class='reccount']

