init agona automation project:
1. Copy the repository
2. create python venv
3. pip install -r requirements.txt
4. webdrivermanager chrome
5. execute tests you want

To start executing tests:

By default tests run in headless mode, to use non-headless mode assign the following value to cli:
--variable browser:chrome

on local ENV
robot --variable ui_auth_password:"paste password here" -A src/config/test-runner/local-args.robot

on DEV ENV
robot --variable ui_auth_password:"paste password here" -A src/config/test-runner/dev-args.robot