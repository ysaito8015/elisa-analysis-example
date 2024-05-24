
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
    nplr
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

df2 %>%
    dplyr::select(X1, X2) %>%
    dplyr::mutate(Concentration = c(1000*0.5^(0:6), 0)) %>%
    tidyr::gather(Column, Absorbance, -Concentration) %>%
    dplyr::filter(Concentration != 0) %>%
    dplyr::select(-Column) -> Standard

print(head(Standard))

ggplot2::ggplot(Standard, aes(x = Concentration, y=Absorbance)) +
    geom_point() +
    scale_x_log10()
ggplot2::ggsave(
    base::file.path(
        figDir,
        base::paste(modelName, "-Plots001.jpg", sep = "")
    )
)

nplr <- nplr(
    x = Standard$Concentration,
    y = Standard$Absorbance
)

print(nplr)

jpeg(file = base::file.path(figDir, base::paste(modelName, "-Plots002.jpg", sep = "")))
    plot(nplr, xlab="Concentration", ylab="Absorbance")
dev.off()
