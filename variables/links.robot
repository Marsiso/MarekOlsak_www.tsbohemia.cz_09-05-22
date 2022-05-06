*** Variables ***
# Cookies PopUp
${popUpLearnMoreLinkXPath}              //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Zjistit více")][contains(concat(' ',normalize-space(@class),' '),' ch2-learn-more')]

# Main navigation panel
${mainNavPanelLogoLinkXPath}            //*[@class='middle']//*[@class='logo']

# User account
${userAccountLogoLinkXPath}             //a[@href="javascript:toggleLoginPop();"]
${userLoginPopUpForgotPasswdLinkXPath}  //a[@href="javascript:document.location.href='default.asp?exec=inc/incnewpswd.asp'"]
${userLoginPopUpRegistrationLinkXPath}  //a[@href="/?cls=catalog&xsl=xcompany&catalogs=forcompany"]
${userLoginDropDownLogOffLinkXPath}     //a[@href="javascript:clearSessionCookie();document.location.href='/default.asp?cls=login&action=logoff'"][@class='logout']

# Catalog
${catalogItemsNamesLinksXPath}   //div[@id='productlistjx']//div[@id='gallarea']//div[@class='prodbox']/h2/a[@title]
${pageNavLinksXPath}   //*[@class='boxcont pagenav']/*[@class='cnt']/*

# Search bar
${searchPnlMatchesLinksXPath}   //*[contains(concat(' ',normalize-space(@class),' '),'luigi-ac-item') and @data-result-id]
