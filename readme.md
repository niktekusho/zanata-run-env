# Create DB container first
docker run --name new-zanata-db -p 3333:3306 -e "MYSQL_ROOT_PASSWORD=root" -e "MYSQL_DATABASE=zanata" -e "MYSQL_USER=zanata" -e "MYSQL_PASSWORD=zanatapw" mariadb:10.0 --character-set-server=utf8

# Create this image
docker build -t new-zanata-wildfly .

# Create zanata container 
docker run --rm -it --link new-zanata-db -p 8080:8080 -p 8787:8787 -p 9990:9990 new-zanata-wildfly
