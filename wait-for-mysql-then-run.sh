#!/bin/bash
cat << EOF > /tmp/wait_for_mysql.php
<?php
\$connected = false;
while(!\$connected) {
    try{
        \$dbh = new pdo('mysql:host=db:3306;dbname=mysql', 'root', 'mysql', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));
        \$connected = true;
    }
    catch(\\PDOException \$ex){
        error_log("Connecting to: mysql://db:3306/mysql");
        error_log("Waiting for MySQL Connection.");
        sleep(3);
    }
}
?>
EOF
php /tmp/wait_for_mysql.php
php artisan migrate
exec apache2-foreground
