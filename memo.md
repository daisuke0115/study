MySQLのインストール
バイナリでのインストール失敗１

１．バイナリファイルをSCPでサーバーに配置
２．以下のコマンドを実行
code:bash
 groupadd mysql
 useradd -r -g mysql mysql
 cd [mysqldir]
 tar zxvf mysql-5.7.24-el7-x86_64.tar.gz
 ln -s /mysqldir/mysql-5.7.24-el7-x86_64 mysql
 →lrwxrwxrwx. 1 root root        33 11月 12 21:17 mysql -> /mysqldir/mysql-5.7.24-el7-x86_64
 cd mysql
 chown -R mysql .
 chgrp -R mysql .

code:エラー
 [root@test01 mysql]# bin/mysql_install_db --user=mysql --datadir=/data
 2018-11-12 21:25:43 [WARNING] mysql_install_db is deprecated. Please consider switching to mysqld --initialize
 2018-11-12 21:25:43 [ERROR]   The data directory '/data' already exist and is not empty.
１．--datadirは非推奨みたい。既存のMySQLがいたからかも。
２．既存の/dataにインストールしようとしたら怒られた。

code:リトライ
 [root@test01 mysql]# bin/mysql_install_db --user=mysql --datadir=/data/mysqldata
 2018-11-12 21:39:21 [WARNING] mysql_install_db is deprecated. Please consider switching to mysqld --initialize
 2018-11-12 21:39:26 [ERROR]   The bootstrap log isn't empty:
 2018-11-12 21:39:26 [ERROR]   2018-11-12T12:39:21.339420Z 0 [Warning] --bootstrap is deprecated. Please consider using --initialize instead
 2018-11-12T12:39:21.340325Z 0 [Warning] Changed limits: max_open_files: 1024 (requested 5000)
 2018-11-12T12:39:21.340332Z 0 [Warning] Changed limits: table_open_cache: 431 (requested 2000)
 2018-11-12T12:39:21.431711Z 0 [ERROR] Can't read from messagefile '/usr/share/mysql/english/errmsg.sys'
--initializeでディレクトリ指定の方法が不明だったので--datadirでやってみた。一応インストールはできた。

ディレクトリ構成
code:bash
 [root@test01 mysql]# pwd
 /mysqldir/mysql
 [root@test01 mysql]# ls
 COPYING  README  bin  docs  include  lib  man  share  support-files
 [root@test01 mysqldata]# ls /data/mysqldata/
 auto.cnf    cav3.ext         client-req.pem  ibdata1             server-key.pem
 ca-key.pem  certv3.ext       ib_buffer_pool  mysql               server-req.pem
 ca-req.pem  client-cert.pem  ib_logfile0     performance_schema  sys
 ca.pem      client-key.pem   ib_logfile1     server-cert.pem
次回はまっさらなサーバーにインストールしてみる。

#MySQL

