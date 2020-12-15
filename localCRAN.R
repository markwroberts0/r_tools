# Make a directory to hold your repo files
repoPath <- "cranroot/src/contrib"
if(!dir.exists(repoPath)){
  dir.create(repoPath, recursive = TRUE)
}

# List the packages you need
packages <- c(
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
pkg_list <- packages
for (package in packages) {
  dependencies <- unlist(tools::package_dependencies(package, recursive = TRUE),
                        use.names = FALSE)
  pkg_list <- append(pkg_list, dependencies)
}

# Get rid of duplicates
unique_packages <- unique(pkg_list)

# Download all the packages, put them in the repo folder
download.packages(pkgs = unique_packages,
                  destdir = repoPath,
                  type = "source")

# Create the PACKAGES file, which lists all the packages and some info for the repository
tools::write_PACKAGES(dir = repoPath,
                      type = "source")

