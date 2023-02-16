
.libPaths("lib")

Measured <- df2 %>%
    dplyr::select(-c(X1, X2)) %>% # Standardの列を除外する
    tidyr::gather(Column, Absorbance) %>%
    dplyr::mutate(
        Sample = c(
            rep(1:8, 2),
            rep(9:16, 2),
            rep(17:24, 2),
            rep(25:32, 2),
            rep(33:40, 2))
        ) %>% # 各wellに入れたサンプルの番号をつける
    dplyr::mutate(Sample = as.factor(Sample)) %>%
    dplyr::group_by(Sample) %>%
    dplyr::summarise(
        Mean = mean(Absorbance),
        SD = sd(Absorbance)
    )

print(head(Measured))


Measured2 <- Measured %>%
    dplyr::filter(Mean > 0)


Estimates_nplr <- nplr::getEstimates(nplr, Measured2$Mean) %>%
    tibble::as_tibble() %>%
    dplyr::rename(Absorbance = y, Concentration = x)


print(head(Estimates_nplr))

ggplot2::ggplot(Estimates_nplr, aes(x = Concentration, y = Absorbance)) +
    geom_point() +
    scale_x_log10() +
    geom_hline(
        aes(yintercept = 0.1),
        color = "gray",
        linetype = "dashed"
    )
ggplot2::ggsave(
    base::file.path(
        figDir,
        base::paste(modelName, "-Plots003.jpg", sep = "")
    )
)
