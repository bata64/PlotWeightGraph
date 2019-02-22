# PlotWeightGraph
朝一で計った体重をグラフ化する

## 概要
HRForecastへ必要情報をPOSTし、グラフをプロットします。

### インストール
必要なCPANモジュールは perl cpanm -L extlib --installdeps . でインストールできます。

### 使い方

```perl
perl ./PostHRForecast.pl [ :service_name/:section_name/:graph_name ] [datetime] [number]
```
