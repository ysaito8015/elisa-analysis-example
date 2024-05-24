# Analyse ELISA data in R

## セットアップ

```shell
$ sudo apt install patchelf
$ git clone https://github.com/ysaito8015/elisa-analysis-example
$ cd ./elisa-analysis-example/scripts
$ Rscript ./pkgSetup.R 2>&1 | tee pkg-setup.log
```

## はじめに
ELISA データの解釈には、標準曲線（検量線）の作成が必要です。
検量線の作り方は主に３種類があります。

1. 線形近似 (Linear)
1. 4 パラメータロジスティック曲線 (four parameter logistic curve)
1. 5 パラメータロジスティック曲線 (four parameter logistic curve)


## 4 パラメータロジスティック曲線
標準的には、４パラメータロジスティック曲線の使用が推奨されています。

$$
y = d + \frac{a - d}{a + \left( \frac{x}{c} \right) ^b}
$$

- $x$ : 吸光度
- $y$ : 対象の物質濃度
- $a$ : 下方漸近線
- $b$ : スロープパラメータ
- $c$ : 縦軸が $(a+b)/2$ である中間点の横軸
- $d$ : 上方漸近線



# Resources
- [Analyse ELISA data in R](https://janalin.github.io/analyse-ELISA)
- [【ggplot2/R】ELISAの測定結果から4係数ロジスティック曲線(4-parameter logistic curve)を書く](https://qiita.com/insilicomab/items/ac628df4cb97f2992114)
- [ELISAの測定結果をRで計算する 1. 4パラメーターロジスティック曲線とは - Note of Pediatric Surgery](https://pediatricsurgery.hatenadiary.jp/entry/2017/01/23/145836)
- [ELISAの測定結果をRで計算する 2. 4パラメーターロジスティック回帰で吸光度から濃度を求める - Note of Pediatric Surgery](https://pediatricsurgery.hatenadiary.jp/entry/2017/01/30/202953)
- [R で用量反応曲線](http://rstudio-pubs-static.s3.amazonaws.com/63117_47264132789f40f690a707ee5429f45a.html)
- [Immunoassays to Detect and Quantitate Herbicides in the Environment](https://www.cambridge.org/core/journals/weed-technology/article/abs/immunoassays-to-detect-and-quantitate-herbicides-in-the-environment/099205F74AF04CB62C17197E093C54E0)
