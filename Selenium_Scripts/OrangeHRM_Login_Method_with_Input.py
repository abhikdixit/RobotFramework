from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager
from robot.api.deco import keyword

driver = webdriver.Chrome(ChromeDriverManager().install())


@keyword("Open OrangeHRM")
def Login_to_app(uname, upass):
    # Step 2) Navigate to OrangeHRM
    driver.get("https://opensource-demo.orangehrmlive.com/")
    driver.find_element_by_name("txtUsername").send_keys(uname)
    driver.find_element_by_name("txtPassword").send_keys(upass)
    driver.find_element_by_name("Submit").click()
    # wait = WebDriverWait(driver, 20)


@keyword("Element Present")
def Verify_Element_Present(element):
    driver.find_element_by_link_text(''+element).is_displayed()
    # driver.close()
    # driver.quit()
