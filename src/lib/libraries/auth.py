import jwt
import requests
import time
import os

access_token = {'value':"", 'expire_at':""}

def _update_access_token():
    response = requests.post(f"{os.environ['LOGIN_URL']}", json={'username':'', 'password': os.environ['API_PASSWORD']})
    access_token['value'] = response.headers['X-Access-Token']
    access_token['expire_at'] = (jwt.decode(access_token['value'], options={"verify_signature": False}))['exp']

def _get_access_token():
    if(not access_token['value'] or time.time() > access_token['expire_at'] * 1000):
        _update_access_token()
    return f"Bearer {access_token['value']}"

def create_auth_header():
    return {'Authorization': _get_access_token()}