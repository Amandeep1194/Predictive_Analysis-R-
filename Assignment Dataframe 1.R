# Dataframe
dframe <- data.frame(
  Person = c("Stan","Francine","Steve","Roger","Hayley","Klaus"),
  Sex = factor(c("M","F","M","M","F","M"), levels = c("F","M")),
  Funny = factor(c("High","Med","Low","High","Med","Med"), levels = c("Low","Med","High"))
)
# Append data
newrecord <-data.frame(
  Age = c(41,41,15,1600,21,60)
)
# Adding Age into dframe table
dframe <- cbind(dframe, newrecord)
print(dframe)