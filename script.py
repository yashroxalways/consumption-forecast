# script.py
import os
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager

# List files from the data directory
data_dir = r"C:\Users\user\Consumption Forecasting\archive" 
print("Listing files in the data directory:")
for file_name in os.listdir(data_dir):
    print(f"- {file_name}")

# Configure Selenium to use headless Chrome
options = Options()
options.headless = True

# Initialize the WebDriver
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)

# Open the practice quotes website
url = "https://quotes.toscrape.com"
driver.get(url)

# Extract the first quote from the page
first_quote = driver.find_element(By.CLASS_NAME, "text").text
print(f"First Quote: {first_quote}")

# Close the browser
driver.quit()
