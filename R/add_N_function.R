add_N_function<- function(x)
{
  y = table(x)
  if(length(y)==4)
  {
    y = c(y,0)
    names(y)[5] ="N"
  }
  y=y[order(names(y))]
  return(y)
}
