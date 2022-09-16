import time

from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager


@keyword("Search Text in Google")
def test_open_google_url():
    driver = webdriver.Chrome(ChromeDriverManager().install())
    driver.get('https://www.google.com/')
    driver.maximize_window()
    title = "Google"
    assert title == driver.title

    search_text = "ISTQB"
    search_box = driver.find_element_by_xpath("//input[@name='q']")
    search_box.send_keys(search_text)

    time.sleep(5)

    # Option 1 - To Submit the search
    # search_box.submit()

    # Option 2 - To Submit the search
    search_box.send_keys(Keys.ARROW_DOWN)
    search_box.send_keys(Keys.ARROW_UP)
    time.sleep(2)
    search_box.send_keys(Keys.RETURN)

    time.sleep(5)

    # Click on the LambdaTest HomePage Link
    title = "Certifying Software Testers Worldwide - ISTQB® International Software Testing Qualifications Board"
    lt_link = driver.find_element_by_xpath(
        "//h3[contains(text(),'Certifying Software Testers Worldwide - ISTQB® Int')]")
    lt_link.click()

    time.sleep(5)
    assert title == driver.title
    time.sleep(2)
    driver.quit()


@keyword("Weborder Login")
def test_weborder_login():
    driver = webdriver.Chrome(ChromeDriverManager().install())
    driver.get("http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx")
    driver.find_element_by_id("ctl00_MainContent_username").send_keys('Tester')
    driver.find_element_by_id("ctl00_MainContent_password").send_keys('test')
    driver.find_element_by_id("ctl00_MainContent_login_button").click()
    wait = WebDriverWait(driver, 20)
    driver.find_element_by_id('ctl00_MainContent_btnDelete').is_displayed()
    driver.quit()
