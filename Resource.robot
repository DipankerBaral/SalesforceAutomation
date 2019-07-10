*** Settings ***
Library           Selenium2Library

*** Keywords ***
Open Browser and maximize it.
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

Enter username, password and click on Login button.
    Input Text    xpath://*[@id='username']    dipanker1996@playful-bear-7pc7bv.com
    Input Text    xpath://*[@id='password']    thehenry123
    Click Button    //*[@id='Login']

User should be logged in. Home page should be displayed.
    Wait Until Element Is Visible    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]    20
    Click Element    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]
    Wait Until Element Is Visible    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']    20
    Capture Page Screenshot    Home.png

Click on Accounts tab.
    Click Element    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']
    Wait Until Element Is Visible    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="Account"]
    Click Element    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="Account"]

Account home page should be displayed.
    Wait Until Element Is Visible    //ul//a[@title="New"]    20
    Capture Page Screenshot    Account_Home.png

Click on New button.
    Click Element    //ul//a[@title="New"]
