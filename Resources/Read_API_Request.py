import requests
from robot.api.deco import keyword


@keyword("Get Countries")
def test_get_id_details(iso):
    r = requests.get("https://demo.spreecommerce.org/api/v2/storefront/countries/"+'iso')
    return r


# x=test_get_id_details()
# print(x)

@keyword("Get Token")
def create_refresh_token():
    url = 'https://demo.spreecommerce.org//spree_oauth/token'
    hed = {'Content-Type': 'application/json'}
    data = {'grant_type': 'password', 'username': 'batch@spree.com', 'password': 'spree123'}
    response = requests.post(url, json=data, headers=hed)
    print(response.json())
    return response.json()


x = create_refresh_token()
print(x)
