# Attempt to clean up function
# 
# 
# Our input dataframe has:
#   * date or datetime column
#   * value column (columns?)
# 
# We want to transform that into a new dataframe, 
# where each date is rotated in space compared to a cur_date assumption and 
# a cycle length assumption. These together determine how many fractional cycles
# the date is vs. current date.
#   * the x axis
# 
# 
# TO DO:
#   * annotation. 
#      1) cyclic, like xmas, that should be persistent every year
#      2) one-time notes, including line / rectangle / fence for exhibition duration
#      2b) pause or slow down by inserting more frames?
#      2c) split into sections to help in presentation?
#   * adjust for camera height
#   * adjust for multi-years by scaling down z depth -- like spiraling roll-up
# 
#   
# What's the simplest function?
# 
# * geom with built-in transformation
#    - take timeline data, convert to cycle time first
#    - inside ggplot, translate x_pos and z_pos


# Attempt at making scale transformation ######
# 
# scales::asn_trans()
# trans_new("asn", function(x) 2 * asin(sqrt(x)), function(x) sin(x/2)^2)
# 
# 
# cycle_x <- function(x) {
#   scales::trans_new("cycle_x",
#                   function(x) -sin(2*pi*x),
#                   function(x) -asin(x/2/pi),
#                   # breaks = c(2*pi/12*0:11),
#                   domain = c(-Inf, Inf))
#   }
# 
# 
# x_pos     =  -sin(2*pi * phase_dif/max(phase_dif)),
# distance  =  -cos(2*pi * phase_dif/max(phase_dif)))
# 
# 
# library(ggplot2)
# data <- data_frame(x = (1/12)*1:30,
#                    y = runif(30, min = -1),
#                    y_c = cumsum(y))
# ggplot(data, aes(x,y_c)) + geom_line() +
#   scale_x_continuous(trans = "cycle_x")



add_cycle <- function(df, date_col, cur_date_col, cycle_length = 365) {
   
}



# * Roll up animation




# 1)  ---------
# 
# 2)  |
#      \______
# 3)        _____
#          /     \
#         |
#          \__
