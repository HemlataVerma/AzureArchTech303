apt update -y
apt install nginx -y
cd /var/www/html
rm index*.html
echo "<h1>Hello $(hostname)</h1>" > index.html
systemctl enable nginx
