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
