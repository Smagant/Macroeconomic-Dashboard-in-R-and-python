# WEO-Macroeconomic-Dashboard
A simple data visualization of the World Economic Outlook Database from the International Monetary Fund (https://www.imf.org/) using Rshiny Dashboard and python.

## Youtube video related to the projet
link

## WARNING
In order to run this interface, you need to create a virtual environment in which Rstudio can communicate with python. More informations in the Requirements

## Data
The data used come from the World Economic Outlook Database.
The code is fit only for the "By Countries" data (here is the link to the October 2020 data : https://www.imf.org/en/Publications/WEO/weo-database/2020/October/download-entire-database).

## Requirements

### Initialize R
Download R for Windows : https://cran.r-project.org/bin/windows/base/ ; Download R for Mac OS X : https://cran.r-project.org/bin/macosx/ ; Download Rstudio : https://www.rstudio.com/products/rstudio/download/

Needed libraries :
```R
install.packages("shinydashboard")
install.packages("reticulate")
install.packages("ggplot2")
install.packages("ggthemes")
```
### Initialize Python
Download python : https://www.python.org/downloads/

Needed libraries :
```bash
pip install pandas
pip install numpy
pip install pathlib
pip install datetime
```
### Create the virtual environment
Once you download the project, go to the project directory and follows those steps in order to install and configure Python with Rstudio :
https://support.rstudio.com/hc/en-us/articles/360023654474-Installing-and-Configuring-Python-with-RStudio
