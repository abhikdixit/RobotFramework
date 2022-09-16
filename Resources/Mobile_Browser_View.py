from robot.api.deco import keyword
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager


@keyword("Mobile Browser")
def mobile_browser():
    opts = Options()
    # Changing Mobile view (By sending respective Window Size)
    opts.add_argument("window-size=375,812")
    # create a new Chrome session
    driver = webdriver.Chrome(ChromeDriverManager().install(), options=opts)
    return driver
