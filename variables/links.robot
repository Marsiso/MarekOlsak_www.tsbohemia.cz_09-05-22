*** Variables ***
# Cookies PopUp
${popUpLinkLearnMoreXPath}  //*[contains(concat(' ',normalize-space(@class),' '),' ch2-dialog')][contains(concat(' ',normalize-space(@class),' '),' ch2-visible')][@role="dialog"]//*[contains(text(),"Zjistit více")][contains(concat(' ',normalize-space(@class),' '),' ch2-learn-more')]

# Main navigation panel
${mainNavPanelLogoXPath}    //*[@class='middle']//*[@class='logo']
