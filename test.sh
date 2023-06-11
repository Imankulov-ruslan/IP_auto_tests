
robot $args --exclude $exclude_tags  --variable ui_auth_password:$ui_auth_password --variable api_password:$api_password --variable db_password:$db_password -A src/config/test-runner/$ENV-args.robot ||
(robot --rerunfailed reports/output.xml --output rerun.xml $args --exclude $exclude_tags  --variable ui_auth_password:$ui_auth_password --variable api_password:$api_password --variable db_password:$db_password -A src/config/test-runner/$ENV-args.robot;
rebot --merge -d reports reports/output.xml reports/rerun.xml)