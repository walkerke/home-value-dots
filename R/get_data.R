library(tidycensus)
library(tidyverse)

vars <- load_variables(2022, "acs5/profile") 

# Grab data without geometry as we'll want to wrangle the geometry separately
state_codes <- c(state.abb, "DC")

value_data <- map_dfr(state_codes, ~{
  get_acs(geography = "tract",
          state = .x,
          variables = c(
            under_100k = "DP04_0081",
            under_100k = "DP04_0082",
            between_100k_and_150k = "DP04_0083",
            between_150k_and_200k = "DP04_0084",
            between_200k_and_300k = "DP04_0085",
            between_300k_and_500k = "DP04_0086",
            between_500k_and_1m = "DP04_0087",
            above_1m = "DP04_0088"
          ),
          year = 2022) %>%
    summarize(n = sum(estimate, na.rm = TRUE), 
              .by = c(GEOID, variable)) %>%
    rename(group = variable)
})


write_rds(value_data, "data/value_grouped.rds")

  
