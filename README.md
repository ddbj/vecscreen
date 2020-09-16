# vecscreen
DDBJの検索サービスVecScreenのGUI部分のソースコード。
POSTされたデータの処理はwabi_clustalw (https://gitlab.ddbj.nig.ac.jp/akatsumata/wabi_clustalw) の 
jp.ac.nig.ddbj.wabi.controller.vecscreen.VecscreenController が受け取って実行する。

実行する際は、本ソースコードをコンパイルしたvecscreen.warとwabi_clustalをコンパイルしたwabi.warをtomcatにデプロイする。