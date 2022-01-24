# DB接続用のサンプルプログラム (PHP，Python)
第14回で紹介したデータベース接続用のサンプルプログラムです。授業の復習などに役立ててください。

student.sql: サンプルデータベース構築用のSQL<br>
.php: PHP用プログラム<br>
.py: Python用プログラム<br>

最初に、student.sqlを利用してサンプルデータベースを構築してください。

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
