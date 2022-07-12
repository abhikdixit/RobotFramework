import requests
import json
def retrieve_a_country():
    emp_id = 5890
    r = requests.get("https://chercher.tech/sample/api/product/read?id=" + str(emp_id))
    print(r.json())
    print(r.status_code)
    assert str(200) in str(r.status_code)
    json_string = r.json()
    name_value = json_string[0]["name"]
    print(name_value)
    return name_value
#x=test_get_id_details()
#print(x)