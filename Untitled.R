
#### Contact details ####
# Title: Get data from amazon
# Purpose: This script gets data from amazon by searching keyword "AUDI" 
# Author: Yang Wu
# Contact: rohan.alexander@utoronto.ca
# Last updated: 20 May 2020


#### Set up workspace ####
library(rvest)
library(tidyverse)


#### Get html ####
amazon_data <- read_html("https://en.wikipedia.org/wiki/List_of_prime_ministers_of_Canada")

# This takes a website as an input and will read it into R, in the same way that we 
# can read a, say, CSV into R.

write_html(amazon_data, "inputs/raw_data.html") 
# Always save your raw dataset as soon as you get it so that you have a record 
# of it. This is the equivalent of, say, write_csv() that we have used earlier.

text<-
  amazon_data %>%
  html_nodes("tr td")%>%
  html_text()

txt <- tibble(books = text)


