from robot.libraries.BuiltIn import BuiltIn

ROBOT_LISTENER_API_VERSION = 2
KEYWORDS_TO_LOG = ['WHEN', 'THEN', 'AND']

def start_test(name, attributes):
    global selenium_instance
    selenium_instance = BuiltIn().get_library_instance('SeleniumLibrary')
    global test_case_name
    test_case_name = name
    # Add an extra new line at the beginning of each test case to have everything aligned.
    print(f'\n')

def end_keyword(name, attributes):
    if any(substring in name for substring in KEYWORDS_TO_LOG) and attributes["status"] in ['PASS', 'FAIL']:
        selenium_instance.capture_page_screenshot(f"{test_case_name}_"+"{index}.png")
        print(f'{attributes["kwname"]}    | {attributes["status"]} |')