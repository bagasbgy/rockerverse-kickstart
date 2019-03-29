# prepare environment ----------------------------------------------------------

# clear environment
rm(list = ls())

# import libs
library(stringi)
library(tidyverse)

# create users and pass --------------------------------------------------------

# number of users
n_user <- 50

# generate users and passwords
set.seed(100)

users <- tibble(
  user = paste0("U", str_pad(1:n_user, side = "left", width = 3, pad = "0")),
  pass = stri_rand_strings(n_user, 8)
)

users <- tibble(user = "admin", pass = "pass") %>%
  bind_rows(users)

# export -----------------------------------------------------------------------

# export to csv
write_csv(users, "data/users.csv", col_names = FALSE)
