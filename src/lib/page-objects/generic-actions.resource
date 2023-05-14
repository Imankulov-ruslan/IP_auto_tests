*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

Variables    ${TIMEOUTS_PATH}
Variables    generic-locators.py
Resource    ${LIBRARIES_PATH}${/}api-requests.robot
Resource    ${LIBRARIES_PATH}${/}db.robot

*** Keywords ***
Assert Page URL
    [Arguments]    ${URL}
    location_should_contain    ${URL}

Wait Until Element Visible And Enable
    [Arguments]    ${selector}
    Wait Until Progress Bar Dissapears
    Wait Until Element Is Visible    ${selector}
    Wait Until Element Is Enabled    ${selector}

Click Button
    [Arguments]    ${selector}    ${wait_for_progress_bar_dissapears}=${True}
    Wait Until Element Visible And Enable    ${selector}
    Scroll Element Into View    ${selector}
    Click Element    ${selector}
    IF    $wait_for_progress_bar_dissapears == $True
        Wait Until Progress Bar Dissapears
    END

Type Text Into Input
    [Arguments]    ${selector}    ${text}
    Wait Until Element Visible And Enable    selector=${selector}
    Input Text    ${selector}    ${text}

Wait Until Progress Bar Dissapears
    Wait For Condition	return document.readyState == "complete"
    Sleep    0.2
    Wait Until Element Is Not Visible    ${PROGRESS_BAR}    timeout=${LONG_TIMEOUT}

Assert "${selector}" "${prop_name}" Has Value "${expected_value}"
    ${elem} =    Get WebElement    ${selector}
    ${elem_prop}    Call Method    ${elem}    value_of_css_property    ${prop_name}
    Should Be Equal As Strings    ${elem_prop}    ${expected_value}   

Assert "${selector}" Has "${expected_class}" Class
    ${elem} =    Get WebElement    ${selector}
    ${elem_classes}    Call Method    ${elem}    get_property    classList
    Should Contain    ${elem_classes}    ${expected_class}     

Assert "${selector}" Contains Numbers
    ${text} =    Get Text    ${selector}
    Should Match Regexp    ${text}    [0-9] 

Assert "${selector}" Has "${expected_src}" Src
    ${elem} =    Get WebElement    ${selector}
    ${elem_src}    Call Method    ${elem}    get_property    src
    Should End With   ${elem_src}    ${expected_src} 

Get Text Content From All Elements
    [Arguments]    ${selector}    ${skip_empty}=${False}
    ${elems} =    Get WebElements    ${selector}
    ${values} =    Create List
    FOR    ${element}    IN    @{elems}
        ${text} =    Call Method    ${element}    get_attribute    textContent
        ${stripped_text} =    Strip String    ${text}
        IF    ${skip_empty} and $stripped_text == ''
            CONTINUE
        ELSE
            Append To List    ${values}    ${stripped_text}
        END
    END
    [Return]    ${values}

Get Table Headers
    [Arguments]    ${table_selector}
    ${headers} =    Get Text Content From All Elements    ${table_selector} th>span    ${True}
    [Return]    ${headers}

Get Column Values
    [Arguments]    ${table_selector}    ${index}    ${additional_selector}=
    ${values} =    Get Text Content From All Elements    ${table_selector} tbody td:nth-child(${${index}+1}) ${additional_selector}    ${True}
    [Return]    ${values}