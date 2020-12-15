# Make a directory to hold your repo files
dir.create("cranroot/src/contrib", recursive=TRUE)

# List the packages you need
packages = c(
  "tidyr",
  "dplyr",
  "yaml",
  "plyr",
  "lazyeval",
  "ggplot2",
  "reshape",
  "forcats",
  "RColorBrewer",
  "maps",
  "OneR",
  "stringr",
  "tidyverse"
)

# Create package list object, and append each package's dependencies (recursive)
pkg_list = packages
for(package in packages){
  dependencies = unlist(tools::package_dependencies(package, recursive = TRUE), use.names=FALSE)
  pkg_list = append(pkg_list, dependencies)
}

# Get rid of duplicates
unique_packages = unique(pkg_list)


