# Get Excel file

rm(list = ls())
gc()

scriptDir <- getwd()
projectDir <- dirname(scriptDir)

.libPaths("lib")

pacman::p_load(
    tidyverse,
    here,
    rio
)

df <- rio::import(
        here::here("data", "ELISA.csv")
    ) %>%
    tibble::as_tibble()

print(df)

df %>%
    mutate_all(
        list(
            ~. - as.numeric((df[8,1] + df[8,2]) /2)
        )
    ) -> df2 # バックグラウンドの平均をとって全体から差し引く

print(df2)
