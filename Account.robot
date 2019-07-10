*** Settings ***
Library           Selenium2Library
Library           DateTime
Library           String

*** Variables ***
${Browser}        Chrome
${URL}            https://login.salesforce.com/?locale=eu
&{LOGIN}          Username=dipanker1996@playful-bear-7pc7bv.com    Password=thehenry123

*** Test Cases ***
test1
    [Setup]    Open Browser and maximize it.
    Enter username, password and click on Login button.
    User should be logged in. Home page should be displayed.
    Click on Accounts tab.
    Account home page should be displayed.
    Click on New button.
    Wait Until Element Is Visible    xpath:(//div[@data-aura-class="forcePageBlock forceRecordLayout"]//span[contains(text(),'Account Name')]//following::input)[1]    20
    Input Text    xpath:(//div[@data-aura-class="forcePageBlock forceRecordLayout"]//span[contains(text(),'Account Name')]//following::input)[1]    Deepesh Subedi
    Click Element    //button[@data-aura-class="uiButton forceActionButton"]//span[normalize-space()='Save']
    Wait Until Element Is Visible    (//div[@class="slds-card__header slds-grid"]//div[@class="slds-media__body"]//span[@title="Contacts"]//following::div//a[@title="New"])[1]    20
    Click Element    (//div[@class="slds-card__header slds-grid"]//div[@class="slds-media__body"]//span[@title="Contacts"]//following::div//a[@title="New"])[1]
    Wait Until Element Is Visible    (//div[@data-aura-class="forcePageBlock forceRecordLayout"]//span[contains(text(),'Last Name')]//following::input)[1]    20
    Input Text    (//div[@data-aura-class="forcePageBlock forceRecordLayout"]//span[contains(text(),'Last Name')]//following::input)[1]    Dahal
    Click Element    (//div[@data-aura-class="forcePageBlock forceRecordLayout"]//span[contains(text(),'EndDate')]//following::input)[1]
    Wait Until Element Is Visible    //table[@class="calGrid"]//span[normalize-space()='9']
    Click Element    //table[@class="calGrid"]//span[normalize-space()='9']
    Click Element    //button[@data-aura-class="uiButton forceActionButton"]//span[.//text()='Save']
    ${ID}=    Get Element Attribute    //span[.//text()="Salutation"]//ancestor::div[contains(@class,"forceInputPicklist")]//div[@data-aura-class="uiPopupTrigger"]    id
    Wait Until Element Is Visible    //div[@aria-labelledby="${ID}"]//ul/li[]    30s
    \    Get Current Date
    [Teardown]    Close Browser

Salesforce
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    xpath://*[@id='username']    &{LOGIN}[Username]
    Input Text    xpath://*[@id='password']    &{LOGIN}[Password]
    Click Button    //*[@id='Login']
    Wait Until Element Is Visible    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]    20
    Click Element    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]
    Wait Until Element Is Visible    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']    30
    Click Element    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']
    Wait Until Element Is Visible    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="Account"]    30
    Click Element    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="Account"]
    Wait Until Element Is Visible    //ul//a[@title="New"]    30
    Click Element    //ul//a[@title="New"] \
    Wait Until Element Is Visible    //span[.//text()="Account Name"]//ancestor::div[contains(@class,"uiInput")]//input    30
    Input Text    //span[.//text()="Account Name"]//ancestor::div[contains(@class,"uiInput")]//input    Deepesh Subedi
    Click Element    //span[.//text()="Rating"]//ancestor::div[contains(@class,"uiInput")]//a    30
    ${ID}=    Get Element Attribute    //span[.//text()="Rating"]//ancestor::div[contains(@class,"forceInputPicklist")]//div[@data-aura-class="uiPopupTrigger"]    id
    Log    ${ID}
    Wait Until Element Is Visible    //div[@aria-labelledby="${ID}"]//ul//li//a[.//text()="Warm"]
    Click Element    //*[@id="${ID}"]/div/ul/li/a[.//text()="Warm"]
    Input Text    //span[.//text()="Parent Account"]//ancestor::div[contains(@class,"uiInput")]//input    Deepesh Subedi

Create Account

Add Contact to Account
