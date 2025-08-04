# Inside the project directory, create the following subfolders using R code:
# raw_data, clean_data, scripts, results or Tasks, plots etc


dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

#Download "patient_info.csv" dataset from GitHub repository

#load the dataset into your R environment

data = read.csv(file.choose())

# Inspect the structure of the dataset using appropriate R functions
# to view data
View(data)
str(data) # check structure

# convert gender into factor
data$gender_fac = as.factor(data$gender)

#convert into numeric
data$gender_num = ifelse(data$gender_fac == "Female" , 1 , 0)
str(data)

# convert diagnosis into factor
data$diagnosis_fac = as.factor(data$diagnosis)
#leveling
data$diagnosis_fac = factor(data$diagnosis_fac,
                         levels = c("Cancer" , "Normal"))
levels(data$diagnosis_fac)

str(data) #check structure

# convert smoker into factor
data$smoker_fac = as.factor(data$smoker)

# Create a new variable for smoking status as a binary factor:
# 1 for "Yes", 0 for "No"

data$smoker_num = ifelse(data$smoker_fac == "Yes" , 1 , 0)


# Save the cleaned dataset in your clean_data folder with the name patient_info_clean.csv
write.csv(data, file = "results/patient_info_clean.csv")

save.image(file = "MennaOmar_Class_Ib_Assignment.Rdata")


