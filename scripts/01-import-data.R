# Get Excel file

rm(list = ls())
gc()

scriptDir <- getwd()
projectDir <- dirname(scriptDir)
figDir <- file.path(projectDir, "outputs")

.libPaths("lib")

xlsx.file <- readxl::read_xlsx(
    here::here("data", "ELISA.xlsx"),
    sheet = 1,
    col_names = FALSE
)

data <-tibble::as_tibble(xlsx.file)

# print(head(xlsx.file))
print(head(data))


## BLANKS
row.idx.blank <- 41
col.idx.blank <- 5


## STNADARD SAMPLES
row.idx.std <-41
col.idx.std <-3

# Number of replicates of the standard
n.repl.std <- 2

# Maximal concentration of the standard
max.conc.std <- 1 # 100 %

# Number of dilutions performed to obtain the calibration curve
n.dilutions <- 8

# Dilution factor
dilution.fact = 2

## BIOLOGICAL SAMPLES
# Location of the first well with the sample of the first donor
row.idx.donor.1 <- 42
col.idx.donor.1 <- 5
n.donors <- 4
