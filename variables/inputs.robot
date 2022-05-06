*** Variables ***
# Login PopUp
${userLoginPopUpNameInputXPath}     //input[@name="~ConLogName"]
${userLoginPopUpPasswdInputXPath}   //input[@name="~ConLogPswd"]

# Registration form
${registrFormEmailInputXPath}       //input[@name="conlogname"][@type="text"]
${registrFormPasswdInputXPath}      //input[@name="ConLogPswdNew"][@type="password"]
${resetPassViaEmailInputXPath}      //td/input[@name="conemail"][@type="text"]

# Search form
${searchTextFieldInputXPath}   //*[@id='autocomplete' or @name='productQuery']
${searchSubmitInputXPath}   //*[@value='Hledat' and @type='submit']