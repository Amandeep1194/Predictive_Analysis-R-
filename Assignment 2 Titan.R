library(tidyverse)
data()
dfT <-read.csv("titanic.csv")
View(dfT)
glimpse(dfT)

#making age 0 where age is below 1
dfT$age [dfT$age < 1]<-0
#handling null value
age <- drop_na(age)
# finding Mean of age
age$age [age$age <1] <-0
mean(age$age)
#mean
mean=29.69188
dfT<-dfT %>% 
  mutate(age=replace_na(age,30))

#histogram of passanger ages with pclass
ggplot(dfT, aes(x=age, fill=factor(pclass))) +
  geom_histogram() +
  labs(title = "Age distributiion by pclass",
       x="age",
       y="frequency",
       fill="pclass") +
  scale_fill_manual(values=c("1"="blue","2"="green","3"="red"))+
  theme_minimal()

#bar graph of passanger who survived in each class 
ggplot(subset(dfT, survived==1),aes(x=factor(pclass))) +
  geom_bar(fill="darkblue") +
  labs(title = "survived passenger by class",
       x="class",
       y="count")+
  theme_minimal()

#filter the data for adult male survivors 
adult_male_survivors <-
dfT[dfT$age >=18 &
      dfT$sex =="male" &
      dfT$survived ==1,]

#create box plot for adult male survivors by age and embarked town
ggplot(adult_male_survivors,aes(x=embarked, y=age)) +
  geom_boxplot(fill= "maroon") +
  labs(title = "box plot of adult male survivor by age and embarked town",
       x="embarked town",
       y="age",
       fill="age")+
  theme_minimal()

#create a scatter plot for age and fare
ggplot(dfT, aes(x=age, y=fare)) +
  geom_point() +
  labs(title = "scatter plot of age and fare",
       x="age",
       y="fare") +
  theme_minimal()

  
