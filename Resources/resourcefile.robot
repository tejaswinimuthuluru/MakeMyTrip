*** Settings ***
Library          Selenium2Library

*** Keywords ***
Open Browser And Application
   [Documentation]   Open browser and application
   [Arguments]  ${url}   ${browser}

   # Aruguments
   # url        Domain url
   # browser    browser name (ex: Chrome,ff, etc..)
   Create Webdriver    Chrome    executable_path=../Drivers//chromedriver.exe
   Go To    ${url}
   Maximize Browser Window
   Title Should Be  MakeMyTrip - #1 Travel Website 50% OFF on Hotels, Flights & Holiday

Close Browser And Application
    Close Browser

Verify List Fields Using Locator
    [Documentation]   Verify list of fields by using locator
    [Arguments]  ${locator}     ${fields}

    # Aruguments
    # ${locator}       locator
    # ${fields}        list of fields ex:['field1', 'field2', etc..]

    Wait Until Element Is Visible   ${locator}  timeout=20s
    ${field_count}=  Get Length  ${fields}
    FOR    ${index}    IN RANGE    ${field_count}
       Element Text Should Be   (${locator})[${index}+${1}]   ${fields}[${index}]
    END
