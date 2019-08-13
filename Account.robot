*** Settings ***
Library           Selenium2Library
Library           DateTime
Library           String
Resource          Common_Resource/Common_Keywords.robot
Resource          Common_Resource/Common_Resource.robot

*** Test Cases ***
Salesforce
    [Setup]    Open Browser and Maximize it
    Enter username,password and click on Login button
    User should be logged in.Home page should be displayed
    Click On App launcher
    App launcher should be displayed
    Click on sales App
    Sales app home page should be visible
    Click on related Account Tab
    Account home page should be displayed
    Click on New button
    Account creation page should be available
    Enter all the required fields in New Account page and click on Save button.
    User should be in account detail page
    Click On Related Contact Button On Account Page
    User should be in New contact page
    Click On Cancel Button In Related Contact Page
    User should be in account detail page
    Click On Related Contact Button On Account Page
    User should be in New contact page
    Click On Save Button
    Error message should be displayed on the required fields On New Contact Page
    Enter all required field on the Contact Page section
    Related contact details should be available on the account detail page
    Click on edit button on the recently added contact
    User should be in contact edit page
    Edit some details on the related contact page and Click On Some Button
    Edited Detail should be displayed on the page
    Click On Delete from picklist on the recently added contact record
    Delete Contact Page Should Be Displayed
    Click On Cancel Button
    User should be in account detail page
    Again Click On the Delete Picklist on the related contact list
    Delete Contact Page Should Be Displayed
    Click On Delte Button
    Related Contact Information Should be Deleted From Account Page
    [Teardown]    Close Browser

*** Keywords ***
Create Account record.
    Enter username,password and click on Login button
    User should be logged in.Home page should be displayed
    Click On App launcher
    App launcher should be displayed
    Click on sales App
    Sales app home page should be visible
    Click on related Tabs    Accounts
    Account home page should be displayed
    Click on New button
    Account creation page should be available
    ${date} =    Get Current Date
    ${AccountName}=    Catenate    Deepesh Subedi    ${date}
    Set Test Variable    ${AccountName}
    Input text on the input field    Account Name    ${AccountName}
    Input element from the picklist    Rating    Warm
    Input text on the input field    Phone    9849228737
    Input text on the input field    Fax    1234
    Input text on the input field    Account Number    5678
    Input text on the input field    Account Site    Pokhara
    Input text on the input field    Ticker Symbol    Symbol
    Input element from the picklist    Type    Prospect
    Input element from the picklist    Ownership    Public
    Input element from the picklist    Industry    Apparel
    Input text on the textarea    Billing Street    New text
    Input text on the textarea    Shipping Street    Street
    ${date} =    Get Current Date    result_format=%#d/%#m/%Y
    Input text on the input field    SLA Expiration Date    ${date}
    Click On Button    Save
    User should be in account detail page

Enter all the required fields in New Account page and click on Save button.
    ${date} =    Get Current Date
    ${name}    Catenate    Deepesh Subedi    ${date}
    Set Test Variable    ${name}
    Set Test Variable    ${date}
    Input text on the input field    Account Name    ${name}
    Input element from the picklist    Rating    Warm
    Input text on the input field    Phone    9849228737
    Search record and click on it    Parent Account    Deepesh 2019-07-12 12:15:20.980
    Input text on the input field    Fax    1234
    Input text on the input field    Account Number    5678
    Input text on the input field    Account Site    Pokhara
    Input text on the input field    Ticker Symbol    Symbol
    Input element from the picklist    Type    Prospect
    Input element from the picklist    Ownership    Public
    Input element from the picklist    Industry    Apparel
    Input text on the textarea    Billing Street    New text
    Input text on the textarea    Shipping Street    Street
    ${date} =    Get Current Date    result_format=%#d/%#m/%Y
    Input text on the input field    SLA Expiration Date    ${date}
    Click On Button    Save

Open Browser and Maximize it
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Click on related Account Tab
    Click on related Tabs    Account

Click On Related Contact Button On Account Page
    Click on the New article button    Contacts

Click On Cancel Button In Related Contact Page
    Sleep    5s
    Click On Button    Cancel

Related Contact Information Should be Deleted From Account Page
    Sleep    5s
    Contact Information Should be Deleted    ${name}
    Capture Page Screenshot    selenium_with_index_{index}.png

Enter all required field on the Contact Page section
    Input text on the input field    Last Name    ${name}
    Input element from the picklist    Salutation    Mr.
    Input text on the input field    EndDate    ${date}
    Click On Save Button

Click on edit button on the recently added contact
    Click on the related item picklist    Contacts    Edit

Click On Delete from picklist on the recently added contact record
    Sleep    5s
    Click on the related item picklist    Contacts    Delete

Click On Save Button
    Click On Button    Save

Related contact details should be available on the account detail page
    Related contact \ should be available on account detail page    ${name}
    Capture Page Screenshot    selenium_with_index_{index}.png

Edit some details on the related contact page and Click On Some Button
    Input text on the input field    Title    Title1
    Click On Save Button

Error message should be displayed on the required fields On New Contact Page
    Sleep    5s
    Error message should be displayed    Review the errors on this page
    Capture Page Screenshot    selenium_with_index_{index}.png

Again Click On the Delete Picklist on the related contact list
    Sleep    5s
    Click on the related item expanded picklist     Contacts    Delete
