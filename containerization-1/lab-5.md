# Lab 5 Thao tác với storage

## 1. Khởi chạy ứng dụng CSDL mongo

Khởi chạy ứng dụng mongo với các yêu cầu sau:

- Tên của container: mongo
- Các biến môi trường:
    - MONGO_INITDB_ROOT_USERNAME: admin
    - MONGO_INITDB_ROOT_PASSWORD: VRuAd2Nvmp4ELHh5
    - MONGO_INITDB_DATABASE: test
- Trong container, /data/db là thư mực lưu trữ dữ liệu của mongo, cần được lưu trữ bền vững trên host. Yêu cầu sử dụng bind mount để đạt được tiêu chí này. Đường dẫn trên Docker host tùy ý.
- Sử dụng image: mongo:6-jammy
- Đưa container xuống chạy ngầm (background)

```bash
docker run --name mongo -d \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=VRuAd2Nvmp4ELHh5 \
-e MONGO_INITDB_DATABASE=test \
-v ./data_mongo:/data/db \
mongo:6-jammy
```