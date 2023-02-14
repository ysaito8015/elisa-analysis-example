# Get csv file

rm(list = ls())
gc()

modelName <- "ELISA"

scriptDir <- getwd()
projectDir <- dirname(scriptDir)
figDir <- file.path(projectDir, "outputs", "figure", modelName)
if (!dir.exists(figDir)) {
    dir.create(figDir, recursive = TRUE)
}

.libPaths("lib")

pacman::p_load(
    tidyverse,
    here,
    rio,
    drc,
    zoo,
    mvtnorm

)

ELISA <- rio::import(here::here("data", "ELISA.csv"))
#print(glimpse(ELISA))
print(summary(ELISA))

jpeg(file = base::file.path(figDir, base::paste(modelName, "Plots001.jpg", sep = "")))
  ggplot(ELISA, aes(x = Concentration, y = Absorbance)) +
  geom_point() +
  scale_x_log10()
dev.off()

L4p <- drc::drm(Absorbance ~ Concentration, data = ELISA, fct = drc::LL.4())
a <- L4p$coefficients
print(a)

L4curve <- function(x, model) {
    predict(object = model, newdata = data.frame(x))
}

jpeg(file = base::file.path(figDir, base::paste(modelName, "Plots002.jpg", sep = "")))
ggplot(ELISA, aes(x = Concentration, y = Absorbance)) +
    geom_point() +
    stat_function(fun = L4curve, args = list(L4p)) +
    scale_x_log10()
dev.off()
