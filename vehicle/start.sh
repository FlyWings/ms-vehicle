## get the mongodb service host and port information using envrionement 
#echo "mongodb.uri = mongodb://$MONGODB_SERVICE_HOST:$MONGODB_SERVICE_PORT/virtual_authentication" >> /apps/config/dev/environment.properties

sed -i "s/\$MONGODB_SERVICE_HOST/$MONGODB_SERVICE_HOST/g" /apps/config/dev/environment.properties
sed -i "s/\$MONGODB_SERVICE_PORT/$MONGODB_SERVICE_PORT/g" /apps/config/dev/environment.properties
sed -i "s/\$AUTH_SERVICE_HOST/$AUTH_SERVICE_HOST/g" /apps/config/dev/environment.properties
sed -i "s/\$AUTH_SERVICE_PORT/$AUTH_SERVICE_PORT/g" /apps/config/dev/environment.properties



## start mvn build and the application
cd /apps
mvn clean package

java -jar target/ms-vehicle-1.0-SNAPSHOT.jar
