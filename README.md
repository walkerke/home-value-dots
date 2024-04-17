# Home Values in America

An interactive dot-density map of reported home values for owner-occupied housing units from the 2018-2022 American Community Survey

This interactive map visualizes reported home values for owner-occupied housing units at the Census tract level in the 2018-2022 5-year ACS.  Data values are taken from the ACS Data Profile variables DP04_0081 through DP04_0088.  Values are self-reported by respondents when asked the question "About how much do you think this house and lot, apartment, or mobile home (and lot, if owned) would sell for if it were for sale?"  [This means that reported values may differ from actual appraised values or actual real estate values as housing markets shift](https://censusreporter.org/topics/housing/#:~:text=The%20ACS%20records%20estimated%20selling,fluctuating%20or%20falling%20housing%20market.).    

The general methodology for visualizing the dots is as follows: 

* Data are acquired with the [tidycensus R package]() at the Census tract level and organized by value band.  Data only reflect owner-occupied housing units, so you may see gaps in locations where renter-occupied units predominate.
* Census tract geometries are built from Census blocks that reported at least one housing unit in the 2020 Decennial US Census.
* Dots are placed relative to the size of the value bands within the constructed Census tracts using the `as_dot_density()` function in tidycensus.  This "dasymetric" method ensures that dots will be placed only in locations with reported housing units (which works in most cases).  In the source data, each dot is representative of approximately 20 owner-occupied housing units within a given value band.
* Dots are converted to vector tiles [using the tippecanoe utility](https://github.com/felt/tippecanoe), wrapped in the [R mapboxapi package](https://walker-data.com/mapboxapi).  A drop rate of 2 is specified, meaning dots will be dropped by 50% as users zoom out.  Data are uploaded to Mapbox using the Mapbox Uploads API.
* The map itself is built in Mapbox GL JS.

You should be able to fully reproduce the map so long as you have all the required software (R and R packages, tippecanoe) installed and a Mapbox account.  Please note that if you do try to reproduce, you may incur charges to your Mapbox account given the size of the dataset and breadth of the map.  
