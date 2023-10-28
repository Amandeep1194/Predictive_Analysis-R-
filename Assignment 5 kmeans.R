#load the required Packages:
install.packages("ggfortify")
install.packages("factoextra")
#load the required libraries:
library(tidyverse)
library(stats)
library(ggfortify)
library(factoextra)
#load csv file in R"
mammalSleep <- read.csv("mammal_Sleep.csv")
view(mammalSleep2)
#new dataframe
mammalSleep2 <- data.frame(mammalSleep$sleep_total, mammalSleep$sleep_rem)
view(mammalSleep)
#find mean
mean<- mean(mammalSleep2$sleep_rem, na.rm=TRUE)
print(mean)
#Replace value with mean
mammalSleep2 <- mammalSleep2 %>% 
  mutate(mammalSleep.sleep_rem = replace_na(
    mammalSleep.sleep_rem, 1.9)) %>% 
  view()

data <- mammalSleep2[,1:2]
# scale the dataset
data_scale <- scale(data)

#visualization
fviz_nbclust(data_scale, kmeans, method="wss") +
  labs(subtitle="Elbow method")

fviz_nbclust(data_scale, kmeans, method="silhouette") +
  labs(subtitle="silhouette method")

fviz_nbclust(data_scale, kmeans, method="gap_stat") +
  labs(subtitle="Gap stat method")

# KM = Kmeans(data,k)
m_sleep <- kmeans(data_scale, centers = 4, nstart = 10)

# cluster plot
autoplot(m_sleep, data_scale, frame= TRUE)

sleep.clusters <- m_sleep$cluster
#visualization in better way:
rownames(data_scale) <- mammalSleep$vore  
rownames(data_scale) <- paste(mammalSleep$vore,
                              1:dim(mammalSleep)[1],
                              sep="_")
fviz_cluster(list(data=data_scale, 
                  cluster = sleep.clusters))
#table
table(sleep.clusters, mammalSleep$vore)