*** Settings ***
Library    SeleniumLibrary
Library    ${LIBRARIES_PATH}${/}sorting.py

Variables    ${TIMEOUTS_PATH}
Variables    generic-locators.py
Variables    ${PAGE_OBJECTS_PATH}${/}courses/courses-locators.py
Variables    ${CONSTANTS_PATH}${/}ui-colors.py

Resource    generic-actions.resource

*** Keywords ***
I Am Logged In
    Wait Until Element Visible And Enable    ${MAIN_VIEW}
    Assert Page URL    ${base_url}

I Scroll Down To The Bottom
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight);

I Click "${selector:\S+}"
    generic-actions.Click Button    ${selector}

I See "${selector:\S+}"
    Page Should Contain Element    ${selector}
    ${elem} =    Get WebElement    ${selector}
    ${elem_classes} =    Call Method    ${elem}    get_property    classList
    Should Not Contain Any    ${elem_classes}    hide-chip

I See "${selector:\S+}" Dissapears
    Wait Until Element Is Not Visible    ${selector}

I See "${selector:\S+}" Appears
    Wait Until Element Is Visible    ${selector}

I See "${selector}" Is Active    
    ${elem} =    Get WebElement    ${selector}
    ${elem_classes} =    Call Method    ${elem}    get_property    classList
    Should Contain Any    ${elem_classes}    active    action-tab-active

I See "${selector}" Is Inactive    
    ${elem} =    Get WebElement    ${selector}
    ${elem_classes} =    Call Method    ${elem}    get_property    classList
    Should Not Contain Any    ${elem_classes}    active    action-tab-active


I See "${selector}" Is Enabled
    Wait Until Element Is Enabled    ${selector}   

I See "${selector}" Has A "${expected_text}"
    Element Should Contain    ${selector}    ${expected_text}   

I See "${selector}" Text Is Highlited In "${expected_color}"
    Assert "${selector}" "color" Has Value "${expected_color}"

I See "${selector}" Background Is Highlited In "${expected_color}"
    Assert "${selector}" "backgroundColor" Has Value "${expected_color}"

I See "${selector}" "${expected_radio_button_text}" Option Is Selected
    ${radio_button} =    Get Next Sibling    ${selector} input:checked
    ${radio_button_text} =    Call Method    ${radio_button}    get_property    textContent
    Should Be Equal As Strings    ${expected_radio_button_text}    ${radio_button_text}    strip_spaces=True

I Enter "${text}" To "${selector}"
    Scroll Element Into View    ${selector}
    Type Text Into Input    ${selector}    ${text}

I See "${selector}" Has "${expected_number}" Chars
    ${elem} =    Get WebElement    ${selector}
    ${length} =    Call Method    ${elem}    get_property    textLength
    Should Be Equal As Numbers    ${length}    ${expected_number}

I See Page Has "${expected_number}" "${selector}"
    ${elems} =    Get WebElements    ${selector}
    Length Should Be     ${elems}    ${expected_number}

I Choose First Value In "${selector}" Dropdown
    generic-actions.Click Button    ${selector}
    generic-actions.Click Button    css:tk-option
I Choose Third Value In "${selector}" Dropdown
    generic-actions.Click Button    ${selector}
    generic-actions.Click Button    css:tk-option:nth-child(3)
