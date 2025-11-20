#!/bin/bash
set -eux

# Update and install required packages
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php php-curl php-gd php-mbstring php-xml php-xmlrpc wget unzip

# Start and enable services
systemctl enable --now apache2
systemctl enable --now mysql

# Secure MySQL root user (simple, noninteractive)
# Create DB and user for WordPress
mysql <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${db_name} DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';
FLUSH PRIVILEGES;
EOF

# Download and configure WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rsync -avP wordpress/ /var/www/html/
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Create wp-config.php with DB settings
cd /var/www/html
cat > wp-config.php <<WP_CONFIG
<?php
define('DB_NAME', '${db_name}');
define('DB_USER', '${db_user}');
define('DB_PASSWORD', '${db_password}');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8mb4');
define('DB_COLLATE', '');
\$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') ) define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
WP_CONFIG

# Minimal Apache setup
a2enmod rewrite
cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html/>
        AllowOverride All
    </Directory>
</VirtualHost>
EOF

systemctl restart apache2

# Set the admin email (create an empty file to indicate the admin email)
echo "wordpress_admin_email=${admin_email}" > /var/www/html/.wpinfo
