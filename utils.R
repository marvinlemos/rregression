extract_model = function(linear.model){
  linear.model.str = paste0('Y = ',round(linear.model$coefficients['(Intercept)'],3))
  columns = names(linear.model$coefficients)
  for (col in columns){
    if (col != '(Intercept)'){
      exp = round(linear.model$coefficients[col], 3)
      linear.model.str = paste0(linear.model.str, ' + ', paste0(exp, '*', col))
    }
  }
  linear.model.str
}