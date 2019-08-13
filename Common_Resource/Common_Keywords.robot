*** Settings ***
Library           Selenium2Library

*** Variables ***
${Browser}        Chrome
${URL}            https://login.salesforce.com/
&{Username}       User1={Enter your username}
&{Password}       pass1={Enter your password}

*** Keywords ***
Enter username,password and click on Login button
    Input Text    xpath://*[@id='username']    &{Username}[User1]
    Input Text    xpath://*[@id='password']    &{Password}[pass1]
    Click Button    //*[@id='Login']

User should be logged in.Home page should be displayed
    Wait Until Element Is Visible    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]    50s
    Capture Page Screenshot    selenium_with_index_{index}.png

Click On App launcher
    Sleep    3s
    Click Element    //nav[@role="navigation"]//button[contains(@data-aura-class,"salesforceIdentityAppLauncherHeader")][@type="button"]

App launcher should be displayed
    Wait Until Element Is Visible    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Click on sales App
    Click Element    //div[@class='slds-app-launcher__tile-body']//a[.//text()='Sales']

Sales app home page should be visible
    Wait Until Element Is Visible    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="Account"]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Click on related Tabs
    [Arguments]    ${tabname}
    Sleep    3s
    Click Element    //nav[@class="slds-context-bar__secondary navCenter"]//one-app-nav-bar-item-root[@data-id="${tabname}"]

Account home page should be displayed
    Wait Until Element Is Visible    //ul//a[@title="New"]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Click on New button
    Wait Until Element Is Visible    //ul//a[@title="New"]    30s
    Click Element    //ul//a[@title="New"]

Account creation page should be available
    Wait Until Element Is Visible    //span[.//text()="Account Name"]//ancestor::div[contains(@class,"uiInput")]//input    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Search record and click on it
    [Arguments]    ${FieldName}    ${RecordName}
    Input Text    //span[.//text()="${FieldName}"]//ancestor::div[contains(@class,"uiInput")]//input    ${RecordName}
    Wait Until Element Is Visible    //div[@data-aura-class="forceSearchInputLookupDesktopActionItem"]//span[contains(text(),'${RecordName}')]    30
    Click Element    //div[@data-aura-class="forceSearchInputLookupDesktopActionItem"]//span[contains(text(),'${RecordName}')]
    Wait Until Element Is Visible    //div[@data-aura-class="forceSearchResultsGridView"]//tr//td//a[@title="${RecordName}"]    50
    Click Element    //div[@data-aura-class="forceSearchResultsGridView"]//tr//td//a[@title="${RecordName}"]

Input text on the input field
    [Arguments]    ${Label}    ${Account-name}
    Wait Until Element Is Visible    //span[.//text()="${Label}"]//ancestor::div[contains(@class,"uiInput")]//input    30s
    Input Text    //span[.//text()="${Label}"]//ancestor::div[contains(@class,"uiInput")]//input    ${Account-name}

Input element from the picklist
    [Arguments]    ${Pick}    ${List}
    Click Element    //span[.//text()="${Pick}"]//ancestor::div[contains(@class,"uiInput")]//a
    ${ID}=    Get Element Attribute    //span[.//text()="${Pick}"]//ancestor::div[contains(@class,"forceInputPicklist")]//div[@data-aura-class="uiPopupTrigger"]    id
    Wait Until Element Is Visible    //div[@aria-labelledby="${ID}"]//ul//li//a[.//text()="${List}"]    50
    Click Element    //*[@aria-labelledby="${ID}"]//div//ul//li//a[.//text()="${List}"]

Input text on the textarea
    [Arguments]    ${textlabel}    ${textcontent}
    Input text    //span[.//text()="${textlabel}"]//ancestor::div[contains(@class,"uiInput")]//textarea    ${textcontent}

Click On Button
    [Arguments]    ${button}
    Click Element    (//div[@data-aura-class="forceRecordEditActions"] |//div[@data-aura-class="forceModalActionContainer--footerAction forceModalActionContainer"])//button[@title="${button}"]

User should be in the account detail Page
    Wait until Page contains    //article[@data-aura-class="forceRelatedListCardDesktop"]//span[@title="Contacts"]//ancestor::article//a[@data-aura-class="forceActionLink"]    60

Click on the New article button
    [Arguments]    ${article-label}
    Sleep    5s
    Click Element    //article[@data-aura-class="forceRelatedListCardDesktop"]//span[@title="${article-label}"]//ancestor::article//a[@data-aura-class="forceActionLink"]

User should be in New contact page
    Wait Until element is Visible    //div[@data-aura-class="forceRecordEditActions"]//button[@title="Save"]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

User should be in account detail page
    Wait Until Element Is Visible    //article[@data-aura-class="forceRelatedListCardDesktop"]//span[@title="Contacts"]//ancestor::article//a[@data-aura-class="forceActionLink"]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Error message should be displayed
    [Arguments]    ${Error}
    Wait Until Element Is Visible    //div[@class="pageLevelErrors"]//span[@data-aura-class="uiOutputText"][contains(text(),"${Error}")]    30

Related contact \ should be available on account detail page
    [Arguments]    ${L-Name}
    Sleep    30s
    Wait Until Element Is Visible    //div[@data-aura-class="forceOutputLookupWithPreview"]//a[@data-aura-class="forceOutputLookup"][contains(text(),"${L-Name}")]

Click on the related item picklist
    [Arguments]    ${Lightining-Label}    ${L-label}
    Click Element    //article//span[@title="${Lightining-Label}"]//ancestor::article//lightning-primitive-icon
    Wait Until Element Is Visible    //article//span[@title="Contacts"]//ancestor::article//div[@class="uiPopupTrigger"][@data-aura-class="uiPopupTrigger"]    30
    ${IDS}=    Get Element Attribute    //article//span[@title="${Lightining-Label}"]//ancestor::article//div[@class="uiPopupTrigger"][@data-aura-class="uiPopupTrigger"]    id
    Wait Until Element Is Visible    //div[@aria-labelledby="${IDS}"]//ul//li//a[@title="${L-label}"]//div[contains(text(),"${L-label}")]    30
    Click Element    //div[@aria-labelledby="${IDS}"]//ul//li//a[@title="${L-label}"]

User should be in contact edit page
    Wait Until Element Is Visible    (//div[@data-aura-class="forceRecordEditActions"] |//div[@data-aura-class="forceModalActionContainer--footerAction forceModalActionContainer"])//button[@title="Save"]
    Capture Page Screenshot    selenium_with_index_{index}.png

Edited Detail should be displayed on the page
    Wait Until Element Is Visible    //article[@data-aura-class="forceRelatedListCardDesktop"]//span[@title="Contacts"]//ancestor::article//div[@title="Title:"]/following-sibling::div//span[contains(text(),"Title1")]
    Capture Page Screenshot    selenium_with_index_{index}.png

Delete Contact Page Should Be Displayed
    Wait Until Element Is Visible    (//div[@data-aura-class="forceRecordEditActions"] |//div[@data-aura-class="forceModalActionContainer--footerAction forceModalActionContainer"])//button[@title="Delete"]
    Capture Page Screenshot    selenium_with_index_{index}.png

Contact Information Should be Deleted
    [Arguments]    ${Contact}
    Page Should Not Contain Element    //div[@data-aura-class="forceOutputLookupWithPreview"]//a[@data-aura-class="forceOutputLookup"][contains(text(),"${Contact}")]

Click on the related item expanded picklist
    [Arguments]    ${Lightining-Label}    ${L-label}
    Click Element    //article//span[@title="${Lightining-Label}"]//ancestor::article//a[@class="slds-button slds-button--icon-x-small slds-button--icon-border-filled"]
    Wait Until Element Is Visible    //article//span[@title="Contacts"]//ancestor::article//div[@class="uiPopupTrigger"][@data-aura-class="uiPopupTrigger"]    30
    ${IDS}=    Get Element Attribute    //article//span[@title="${Lightining-Label}"]//ancestor::article//div[@class="uiPopupTrigger"][@data-aura-class="uiPopupTrigger"]    id
    Wait Until Element Is Visible    //div[@aria-labelledby="${IDS}"]//ul//li//a[@title="${L-label}"]//div[contains(text(),"${L-label}")]    30
    Click Element    //div[@aria-labelledby="${IDS}"]//ul//li//a[@title="${L-label}"]

Open Browser and Maximize it
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Click On Cancel Button
    Click On Button    Cancel

Click On Save Button
    Click On Button    Save

Click On Delte Button
    Click On Button    Delete
