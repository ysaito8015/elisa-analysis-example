pkgs <- c(
          "bookdown",
          "tidyverse",
          "ggplot2",
          "cowplot",
          "scales",
          "rio",
          "here",
          "purrr",
          "viridis",
          "drc",
          "minpack.lm"
)

parentScriptDir <- getwd()
pkgDir <- file.path(parentScriptDir, "pkg")
dir.create(pkgDir)
libDir <- file.path(parentScriptDir, "lib")
dir.create(libDir)

.libPaths(libDir)

Sys.setenv("PKG_CXXFLAGS"="-std=c++22 -DBOOST_PHOENIX_NO_VARIADIC_EXPRESSION")


if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages(
    c("devtools", "remotes"),
    lib = libDir,
    contriburl = c(
        contrib.url("http://r-forge.r-project.org", "source"),
        contrib.url("https://cran.rstudio.com/", "source")
    ),
    destdir = pkgDir,
    type = "source",
    dependencies = c("Depends", "Imports", "LinkingTo"),
    INSTALL_opts = "--no-multiarch"
  )
}

install.packages(
  pkgs,
  lib = libDir,
  contriburl = c(
      contrib.url("http://r-forge.r-project.org", "source"),
      contrib.url("https://cran.rstudio.com/", "source")
  ),
  destdir = pkgDir,
  type = "source",
  dependencies = c("Depends", "Imports", "LinkingTo"),
  INSTALL_opts = "--no-multiarch"
)
