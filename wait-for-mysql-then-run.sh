#!/bin/bash
cat << EOF > /tmp/wait_for_mysql.php
<?php
\$connected = false;
while(!\$connected) {
  try{
    \$dbh = new pdo('mysql:host=' . getenv("DB_HOST") . ':' . getenv("DB_PORT") . ';dbname=' . getenv("DB_DATABASE"), getenv("DB_USERNAME"), getenv("DB_PASSWORD"), array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
    \$connected = true;
  }
  catch(\\PDOException \$ex){
    error_log('Connecting to: mysql://' . getenv("DB_HOST") . ':' . getenv("DB_PORT") . '/' . getenv("DB_DATABASE"));
    error_log('Waiting for MySQL Connection.');
    sleep(3);
  }
}
?>
EOF
php /tmp/wait_for_mysql.php
php artisan migrate
exec apache2-foreground
