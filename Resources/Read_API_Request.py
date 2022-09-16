import requests
from robot.api.deco import keyword


@keyword("Get Countries")
def test_get_id_details():
    r = requests.get("https://demo.spreecommerce.org/api/v2/storefront/countries/ind")
    return r

@keyword("Get Token")
def create_refresh_token():
    url = 'https://demo.spreecommerce.org/spree_oauth/token'
    hed = {'Content-Type': 'application/json'}
    data = {'grant_type': 'password', 'username': 'lti@spree.com', 'password': 'spree123'}
    response = requests.post(url, json=data, headers=hed)
    print(response.json())
    return response.json()