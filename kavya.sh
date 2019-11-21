        #!/bin/bash
        ssh  ec2-user@172.31.22.50
        sudo -i 
        yum update -y
        yum install httpd -y
        service httpd start  
        yum install php php-mysql -y
        service httpd restart 
        cd /var/www/html
        echo "<?php phpinfo() ?>" >> test.php
        yum install mysql-server -y
        service mysqld start 
        mysqladmin -u root create mydb
        mysqladmin --user=root password 123
        cd /var/www/html
        wget https://wordpress.org/wordpress-5.1.1.tar.gz
        tar -xvf wordpress-5.1.1.tar.gz
        cd wordpress
        mv wp-config-sample.php wp-config.php
        ex -s -c '%s/database_name_here/mydb/g|x' wp-config.php
        ex -s -c '%s/localhost/localhost/g|x' wp-config.php
        ex -s -c '%s/username_here/root/g|x' wp-config.php
        ex -s -c '%s/password_here/123/g|x' wp-config.php
        service httpd restart 
