
# %%
import requests
from bs4 import BeautifulSoup

# Make a request to the website you want to scrape
url = "https://www.caa.ca/gas-prices/"
response = requests.get(url)

# %%
# Parse the HTML content of the page
soup = BeautifulSoup(response.content, "html.parser")

# %%
my_list = []
for t in soup.find_all("table"):
    if t.get("class"):
        my_list.append(t["class"])
table_html = str(soup.find_all("table", "provinces_table"))

# %%
from IPython.core.display import HTML
HTML(table_html)
# %%
