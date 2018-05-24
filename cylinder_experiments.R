# Load libraries
library(tidyverse); library(lubridate); library(gganimate)


# create sample data
test <- tibble(
  date  = seq.Date(from = ymd(20150101), to = ymd(20180601), by = "1 day"),
  delta = rnorm(1248, 0, 10),
  value = cumsum(delta)
)

# Normal plot
ggplot(test, aes(decimal_date(date) - year(date), 
                 value, alpha = date,
                 color = year(date), group = year(date))) +
  geom_line() +
  labs(x="Year portion")


# That looks pretty good. It probably helps the reader to have a constant x axis range that doesn't vary. January is always on the left, December always on the right. But for engagement and interest, we might want more of a sense of movement from  