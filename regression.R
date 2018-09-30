
source('utils.R')

SYS_DATE = format(Sys.time(), "%Y%m%d%_H%M%S")

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

# Training a multiple linear model
linear.formula = as.formula(paste0(PREDICTED_COLUMN, " ~ ."))
linear.model = lm(linear.formula, data = houses.df)

linear.model.str = extract_model(linear.model)
print(linear.model.str)

save(linear.model, file = MODEL_FILENAME)


