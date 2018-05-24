# Load libraries
library(tidyverse); library(lubridate); library(gganimate)


# create sample data
test <- tibble(
  date  = seq.Date(from = ymd(20150101), to = ymd(20180601), by = "1 day"),
  delta = rnorm(1248, 0, 10),
  value = cumsum(delta)
)

# Normal plot
n <- ggplot(test, aes(decimal_date(date) - year(date), 
                 value, alpha = date,
                 color = year(date), group = year(date))) +
  geom_line() +
  labs(x="Year portion")
n

# That looks pretty good. It probably helps the reader to have a constant x axis range that doesn't vary. January is always on the left, December always on the right. But for engagement and interest, we might want more of a sense of movement or surprise.


# One  thing we might try is to scale the x-axis as if we were looking at a vertical cylinder head-on. X_2 = 1/2 * sin(2pi*X_1) + 1/2 might do it. That should map 0 to 0.5 (the far point of the cylinder), 1/4 to 0 (left side of cylinder), 1/2 to 1/2, 3/4 to 1, and 1 back to 0.5 again.

# Note: doesn't work yet...
cyl_trans_x <- 
  scales::trans_new("cyl_x",
                    transform = function(x) {sin(2*pi*x)/2 + 1/2},
                    inverse = function(y) {sin(y)},
                    # function(y) { -1* asin(1-2x)/(2*pi)},
                    domain=c(0, 1),
                    breaks = 1/12 * 0:12)
n + scale_x_continuous(trans= cyl_trans_x, expand = c(0,0))


# Ok, forget scales, let's try just transforming the data itself...
test_2 <- 
  test %>%
  mutate(date_dec = decimal_date(date) - year(date),
         date_dec_spin = -sin(2*pi*date_dec)/2 + 1/2,
         value_spin = value + 100* sin(date_dec))

ggplot(test_2, aes(date_dec_spin, value,
                  alpha = date, color = year(date), group = year(date))) +
  geom_point()
