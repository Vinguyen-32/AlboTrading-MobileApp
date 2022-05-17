Start mysql on docker with the following command:

docker run --detach --name=cmpe137 --env="MYSQL_ROOT_PASSWORD=cmpe137" --publish 3306:3306 mysql
