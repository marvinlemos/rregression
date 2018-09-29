library(dplyr)

SYS_DATE = format(Sys.time(), "%Y%m%d%H%M%S")

# Constants used in the rest of the code
DATASET_FILENAME = 'datasets/housing.csv'
MODEL_FILENAME = paste0('models/lm_',SYS_DATE,'.Rdata')

# COLUMN to be predicted
PREDICTED_COLUMN = 'MEDV'

# Columns to be removed.
COLUMNS_TO_REMOVE = c()

# Reading the dataset into a data.frame
houses.df = read.csv(DATASET_FILENAME)


if (length(COLUMNS_TO_REMOVE) > 0){
  houses.df[ , COLUMNS_TO_REMOVE] = NULL
}

# Training the multiple linear model
formula.lm = as.formula(paste0(PREDICTED_COLUMN, " ~ ."))
model.lm = lm(formula.lm, data = houses.df)

save(model.lm, file = MODEL_FILENAME)


