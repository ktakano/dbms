# DB接続用のサンプルプログラム (PHP，Python)
第14回で紹介したデータベース接続用のサンプルプログラムです。

## PHP
Xampp環境で実行することができます。

## Python
Xampp環境で実行することができますが、Apacheの設定を変更するか、拡張子を.pyから.cgiに
変更する必要があります。

Apacheの設定を変更する場合、.pyを追加します。

```bash
AddHandler cgi-script .cgi .pl .asp .py
```

MySQL Connector/Python のインストールも必要で。

```bash
pip install mysql-connector-python
```
