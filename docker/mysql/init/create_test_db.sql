CREATE DATABASE `${COMPOSE_PROJECT_NAME}_test` CHARACTER SET utf8mb4;
GRANT ALL PRIVILEGES ON `${COMPOSE_PROJECT_NAME}_test`.* TO 'admin'@'%';