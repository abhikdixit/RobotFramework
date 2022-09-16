from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager
from webdrivermanager import EdgeDriverManager

driver = webdriver.chrome(ChromeDriverManager().install())

# Step 2) Navigate to OrangeHRM
driver.get("http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx")
driver.find_element_by_id("ctl00_MainContent_username").send_keys('Tester')
driver.find_element_by_id("ctl00_MainContent_password").send_keys('test')
driver.find_element_by_id("ctl00_MainContent_login_button").click()
wait = WebDriverWait(driver, 20)
driver.find_element_by_id('ctl00_MainContent_btnDelete').is_displayed()
#driver.close()
driver.quit()