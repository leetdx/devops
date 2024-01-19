# Lab 4 Thao tác với container

## Luyện tập 0

Khởi động container với các thông tin sau:
- Container chạy ngầm trong Docker
- Tên của container: my-calculator
- Mở cổng cho ứng dụng trên host tại cổng 3000 hướng tới cổng 3000 của ứng dụng trong container
- Image của ứng dụng: orezfu/calculator:v1

```bash
docker run -dp 3000:3000 --name my-calculator orezfu/calculator:v1
```

## Luyện tập 1: Chạy ứng dụng Java

Yêu cầu: Khởi động container với các thông tin sau
- Container chạy ngầm
- Tên của container: my-java-app
- Mở cổng cho ứng dụng trên host tại cổng 8000 hướng tới cổng 8080 của ứng dụng trong container.
- Image của ứng dụng: orezfu/java-app:v1

```bash
docker run -dp 8000:8080 --name my-java-app orezfu/java-app:v1
```

## Luyện tập 2: Chạy ứng dụng mysql

Yêu cầu:

Mapping port: 13336 từ host → 3306 trên container mysql
- Tên container: "mysql-tech"
- Chạy ngầm container.
- Lưu trữ dữ liệu DB ra ngoài host với volume có tên "data_mysql_tech"
- Có các biến môi trường, giá trị của biến môi trường các bạn tự tạo.
- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD
- MYSQL_ROOT_PASSWORD

```bash
docker volume create data_mysql_tech

docker volume ls

docker run -dp 13336:3306 --name mysql-tech \
-v data_mysql_tech:/var/lib/mysql \
-e MYSQL_DATABASE=db_uni_education \
-e MYSQL_USER=admin \
-e MYSQL_PASSWORD=admin@12345 \
-e MYSQL_ROOT_PASSWORD=root@123456 \
mysql:latest

PASSWORD=admin@12345

docker exec -it mysql-tech sh -c 'mysql -uadmin -p"$PASSWORD"'
```

## Luyện tập 3: Xóa các container trong luyện tập 0, 1 và 2

```bash
docker rm -f 36c f45 bf1
```