# Enterprise Perspective Analysis

* A text mining web application which performs sentimental analysis of Enterprises on Twitter Dataset and displays a graphical representation of the different sentiments of the tweets. 
* It can also generate a Word Cloud of what social media thinks about a company by analysing the tweets of a company. After processing the tweets it also displays a histogram of words which a related to a particular company and a table of most recent tweets.

# Install

Right now the application has been deployed and tested in Windows environment, so the following steps guide you on installing this application on Windows Environment.

### Software Packages Needed 

* R - Download and install R from [R for Windows](http://cran.r-project.org/bin/windows/base/)
* RStudio - Download and install RStudio Desktop from [RStudio Desktop for Windows](http://www.rstudio.com/products/RStudio/#Desktop)
* XAMPP Stack - Download and install XAMPP from [XAMPP for Windows](https://www.apachefriends.org/download.html)

### Project Setup Procedure 

* Download the zip of this project.
* Extract in xampp\htdocs\
* Open wordcloud.php , update line 26 with your database settings.
* Open wordcloud.R located in bin , update line 43 with your database settings.
* Install the following packages in R - twitteR, wordcloud, tm , ggplot2, plyr.

# Getting Started 

* The application needs an authentication from Twitter via oauth protocol. I have provided the API keys myself.
* If you want to use your own API keys, go [Twitter apps](https://apps.twitter.com/) , click on create a new app
* You may have to provide a website name for authentication.
* After succesully creating a new app, go to Keys and Access tokens in application settings 
* Copy Consumer Key(API Secret), Consumer Secret(API Secret), Access Token , Access Token Secret.
* Paste the keys in wordcloud.R - line 11-14 and sentimentalAnalysis.R - line 14.
* Now run XAMPP as administrator(very important!)
* Fire up localhost , and you application is up and ready.
* Enter the company names you want to do analysis about. 
* It can take a little bit time to process the results depending on your Internet Connection.
* Stay Calm and Composed , Enjoy !!!


