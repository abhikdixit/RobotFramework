import json
from datetime import time

import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select

driver = webdriver.Chrome()
base_url = str("https://datatables.net/examples/data_sources/server_side")
driver.get(base_url)
all_data = []
list_options = driver.find_elements_by_xpath("//table[@id='example']/tbody/tr/td[1]")

for item in list_options:
    all_data.append(item.text())
    # ------------Now will build logic to click on Next button--------
    # Getting class attribute of Next button, which should contains disabled text
    nextButton = driver.find_element(By.ID, "example_next").get_attribute("class")
    while nextButton != "disabled":
        # So, here we are checking, if Next button not disabled then click on Next button
        driver.find_element(By.ID, "example_next").click()
        # Post click, you will get next page. from that page you would like to capture the First Name
        FnameElements = driver.find_elements(By.XPATH, "//table[@id='example']/tbody/tr/td[1]")
        for itemnext in range(len(FnameElements)):
            all_data.append(itemnext.text())
            # After adding the First name in names object List, need to find the class of Next button
            nextButton = driver.find_element(By.ID, "example_next").get_attribute("class")
            # User would like to count total number of First Name retured by names object
            totalnames = all_data.size();
            print(totalnames)
driver.quit()
