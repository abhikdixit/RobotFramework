from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager

driver = webdriver.Chrome(ChromeDriverManager().install())

# Step 2) Navigate to OrangeHRM
driver.get("https://opensource-demo.orangehrmlive.com/")
driver.find_element_by_name("txtUsername").send_keys('Admin')
driver.find_element_by_name("txtPassword").send_keys('admin123')
driver.find_element_by_name("Submit").click()
wait = WebDriverWait(driver, 20)
driver.find_element_by_link_text('Dashboard').is_displayed()
#driver.close()
driver.quit()