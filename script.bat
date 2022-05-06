FOR /F "tokens=* USEBACKQ" %%F IN (`powershell get-date -format "{yyyy_MM_dd_HH_mm}"`) DO (
SET DATETIME=%%F
)

mkdir   ./logs/%DATETIME%
mkdir   ./screenshots/%DATETIME%

rem robot --outputdir ./logs/%DATETIME% -o TS01_Cookies_PopUp_Output -r TS01_Cookies_PopUp_Record -l TS01_Cookies_PopUp_Log .\testSuites\TS01_cookiesPopUp.robot
rem robot --outputdir ./logs/%DATETIME% --variable DATETIME:%DATETIME% -o TS02_Cookies_Settings_Output -r TS02_Cookies_Settings_Report -l TS02_Cookies_Settings_Log .\testSuites\TS02_cookiesSettingsButton.robot
rem robot --outputdir ./logs/%DATETIME% --variable DATETIME:%DATETIME% -o TS03_Main_Navigation_Panel_Output -r TS03_Main_Navigation_Panel_Record -l TS03_Main_Navigation_Panel_Log .\testSuites\TS03_mainNavigationPanel.robot
rem robot --outputdir ./logs/%DATETIME% -o TS05_Users_Login_Output -r TS05_Users_Login_Record -l TS05_Users_Login_Log .\testSuites\TS05_usersLogin.robot
rem robot --outputdir ./logs/%DATETIME% --variable DATETIME:%DATETIME% -o TS12_Product_Catalog_Output -r TS12_Product_Catalog_Record -l TS12_Product_Catalog_Log .\testSuites\TS12_productCatalog.robot
robot --outputdir ./logs/%DATETIME% -o TS13_Search_Products_Output -r TS13_Search_Products_Record -l TS13_Search_Products_Log .\testSuites\TS13_searchProducts.robot
