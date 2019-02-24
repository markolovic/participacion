[1mdiff --git a/docker-compose.yml b/docker-compose.yml[m
[1mindex 5c03e07..6fae677 100644[m
[1m--- a/docker-compose.yml[m
[1m+++ b/docker-compose.yml[m
[36m@@ -16,6 +16,7 @@[m [mservices:[m
 [m
     # use the Dockerfile next to this file[m
     build: .[m
[32m+[m[32m    image: consul-upstream[m
     entrypoint: /usr/local/bin/entrypoint.sh[m
     command: bundle exec rails s -p 3000 -b '0.0.0.0'[m
     working_dir: /var/www/consul[m
