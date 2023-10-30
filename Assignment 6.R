#install the required packages
install.packages("forecast")
#install the required libraries
library(tidyverse)
library(forecast)

# load the dataset
retail <- read.csv("retail_data.csv")
view(retail)

#ts()
class(retail) 
ts_data <- ts(data = retail$Sales,
              start = c(2018,1),
              end = c(2023,12),
              frequency = 12)

plot(retail)



# next, pass it to decompose
data_retail_decompose <- decompose(ts_data)
# plot decompose
plot(data_retail_decompose)



# arima_model
arima_model <- 
  auto.arima(retail$Sales)

#Forecast
forecast_result <- 
  forecast(arima_model, h = 4) 
forecast_result

forecast_result <- 
  forecast(arima_model, h = 8)  
forecast_result

forecast_result <- 
  forecast(arima_model, h = 12)  
forecast_result


