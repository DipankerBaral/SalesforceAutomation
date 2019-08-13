*** Settings ***
Resource          Common_Resource/Common_Keywords.robot
Library           Selenium2Library
Library           DateTime
Library           String

*** Test Cases ***
Create Lead
    [Setup]    Open Browser and Maximize it
    Enter username,password and click on Login button
    User should be logged in.Home page should be displayed
    Click On App launcher
    App launcher should be displayed
    Click on sales App
    Sales app home page should be visible
    Click on the leads tab
    User should be in the Leads Page.Recently viewed leads should be displayed
    Click on New button
    User should be in the New Lead page
    Click On Cancel Button
    User should be in the Leads Page.Recently viewed leads should be displayed
    Click On New Button In Leads Page
    User should be in the New Lead page
    Click On Save Button
    Error message should be displayed contaning "Review the errors on this page" messsage
    Enter all required fields on new lead page and Click on Save Button
    Lead should be displayed.Fields like Open - Not Contacted, Working -Contacted ,Closed-Not Converted should be available.
    [Teardown]    Close Browser

Change the status of the Lead to Close - Converted
    [Setup]    Create Lead Record
    Enter username,password and click on Login button
    User should be logged in.Home page should be displayed
    Click On App launcher
    App launcher should be displayed
    Click on sales App
    Sales app home page should be visible
    Click on the leads tab
    User should be in the Leads Page.Recently viewed leads should be displayed
    Click on the lead account made earlier
    Lead should be displayed.Fields like Open - Not Contacted, Working -Contacted ,Closed-Not Converted should be available.
    Click On Mark Status as Complete Button
    Status of the lead should be changed from Working - Contacted to Closed - Not Converted
    [Teardown]    Close Browser

*** Keywords ***
User should be in the Leads Page.Recently viewed leads should be displayed
    Wait Until Element Is Visible    //div[@data-aura-class="forceListViewManagerHeader"]//nav[@role="navigation"]//span[contains(text(),"Leads")]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

User should be in the New Lead page
    Wait Until Element Is Visible    //div[@data-aura-class="forcePageBlockSectionRow"]//span[.//text()="Lead Owner"]    30
    Capture Page Screenshot    selenium_with_index_{index}.png

Status fields should be available
    [Arguments]    ${statustext}
    Wait Until Element Is Visible    //div[@class="slds-path__scroller_inner scroller"]//ul//span[contains(text(),"${statustext}")]    30

Lead should be displayed.Fields like Open - Not Contacted, Working -Contacted ,Closed-Not Converted should be available.
    Status fields should be available    Open - Not Contacted
    Status fields should be available    Working - Contacted
    Status fields should be available    Closed - Not Converted
    Capture Page Screenshot    selenium_with_index_{index}.png

Enter all required fields on new lead page and Click on Save Button
    ${date}=    Get Current Date
    ${name}    Catenate    Deepesh    ${date}
    Set Test Variable    ${name}
    Input text on the input field    Mobile    9849846405
    Input text on the input field    Last Name    ${name}
    Input text on the input field    Company    Dahal
    Input element from the picklist    Lead Status    Working - Contacted
    Click On Button    Save

Log out from Salesforce
    Wait Until Element Is Visible    //span[contains(@class,"oneUserProfileCardTrigger")]//button[contains(@class,"branding-userProfile-button")]    30s
    Click Element    //span[contains(@class,"oneUserProfileCardTrigger")]//button[contains(@class,"branding-userProfile-button")]
    Wait Until Element Is Visible    //div[contains(@class,"active")]//div[@data-aura-class="oneUserProfileCard"]//a[contains(@class,"logout")][.//text()="Log Out"]    30s
    Click Element    //div[contains(@class,"active")]//div[@data-aura-class="oneUserProfileCard"]//a[contains(@class,"logout")][.//text()="Log Out"]
    Wait Until Element Is Visible    //*[@id='username']    30

Create Lead Record
    Open Browser and Maximize it
    Enter username,password and click on Login button
    User should be logged in.Home page should be displayed
    Click On App launcher
    App launcher should be displayed
    Click on sales App
    Sales app home page should be visible
    Click on related Tabs    Lead
    User should be in the Leads Page.Recently viewed leads should be displayed
    Click on New button
    User should be in the New Lead page
    Enter all required fields on new lead page and Click on Save Button
    Lead should be displayed.Fields like Open - Not Contacted, Working -Contacted ,Closed-Not Converted should be available.
    Log out from Salesforce

Click On Related Lead List
    [Arguments]    ${lead-name}
    Wait Until Element Is Visible    //table[contains(@class,"forceRecordLayout")]//tr//th//a[contains(@class,"outputLookupLink")] [.//text()="${lead-name}"]    30
    Click Link    //table[contains(@class,"forceRecordLayout")]//tr//th//a[contains(@class,"outputLookupLink")] [.//text()="${lead-name}"]

Check the current status of Lead
    [Arguments]    ${status}    ${Label}
    Wait Until Element Is Visible    //div[contains(@class,"active")]//div[contains(@class,"slds-path__scroller_inner")]//li[contains(@class,"slds-is-${status}")]//span[contains(text(),"${Label}")]    30

Click On Mark Status as Complete Button
    Click Button    //div[contains(@class,"active")]//div[contains(@class,"runtime_sales_pathassistantPathAssistantHeader")]//button[@data-aura-class="uiButton"]

Status of the lead should be changed from Working - Contacted to Closed - Not Converted
    Check the current status of Lead    complete    Working - Contacted
    Check the current status of Lead    current    Closed - Not Converted
    Capture Page Screenshot     selenium_with_index_{index}.png

Click on the leads tab
    Click on related Tabs    Lead

Click on the lead account made earlier
    Click On Related Lead List    ${name}

Click On Cancel Button
    Click On Button    Cancel

Click On Save Button
    Click On Button    Save

Error message should be displayed contaning "Review the errors on this page" messsage
    Error message should be displayed    Review the errors on this page
    Capture Page Screenshot     selenium_with_index_{index}.png

Click On New Button In Leads Page
    Sleep    10s
    Click on New button
