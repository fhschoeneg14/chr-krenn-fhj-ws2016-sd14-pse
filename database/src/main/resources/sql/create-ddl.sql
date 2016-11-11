# select correct database
USE pse;

#create user table

CREATE TABLE IF NOT EXISTS user
(
  id         BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username   VARCHAR(32)  NOT NULL,
  password   VARCHAR(512) NOT NULL,
  salt       VARCHAR(16)  NOT NULL,
  `created`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = INNODB;

#create table community
CREATE TABLE IF NOT EXISTS department (
  id         BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(255)        DEFAULT NULL,
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS user_roles (
  id         BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username   VARCHAR(32) NOT NULL REFERENCES user (username),
  role       VARCHAR(32) NOT NULL,
  rolegroup  VARCHAR(32) NOT NULL DEFAULT 'Roles',
  `created`  TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = INNODB;

#create table department
CREATE TABLE IF NOT EXISTS department (
  id         BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(255)        DEFAULT NULL,
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create table person_status
CREATE TABLE IF NOT EXISTS person_status (
  name       VARCHAR(255) NOT NULL PRIMARY KEY,
  `created`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create table person
CREATE TABLE IF NOT EXISTS person (
  id            BIGINT(20)   NOT NULL AUTO_INCREMENT PRIMARY KEY,
  address       VARCHAR(255)          DEFAULT NULL,
  firstname     VARCHAR(255) NOT NULL,
  imageurl      VARCHAR(255)          DEFAULT NULL,
  lastname      VARCHAR(255) NOT NULL,
  place         VARCHAR(255)          DEFAULT NULL,
  department_id BIGINT(20)            DEFAULT NULL REFERENCES department (id),
  status_name   VARCHAR(255) NOT NULL REFERENCES person_status (name),
  user_id       BIGINT(20)   NOT NULL REFERENCES user (id),
  `created`     TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS person_image (
  id           BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  data         LONGBLOB   NOT NULL,
  person_id    BIGINT(20) NOT NULL UNIQUE REFERENCES person (id),
  content_type TEXT       NOT NULL,
  `created`    TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`   TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create contact
CREATE TABLE IF NOT EXISTS contact (
  person1_id BIGINT(20) NOT NULL REFERENCES person (id),
  person2_id BIGINT(20) NOT NULL REFERENCES person (id),
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (person1_id, person2_id)
)
  ENGINE = InnoDB;

#create table hobby
CREATE TABLE IF NOT EXISTS hobby (
  id         BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  value      VARCHAR(255)        DEFAULT NULL,
  person_id  BIGINT(20) NOT NULL REFERENCES person (id),
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create table knowledge
CREATE TABLE IF NOT EXISTS knowledge (
  id         BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  value      VARCHAR(255)        DEFAULT NULL,
  person_id  BIGINT(20) NOT NULL REFERENCES person (id),
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create table mailaddress
CREATE TABLE IF NOT EXISTS mailaddress (
  id          BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `value`     VARCHAR(255)        DEFAULT NULL,
  `person_id` BIGINT(20) NOT NULL REFERENCES person (id),
  `created`   TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS phonenumber (
  id         BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  value      VARCHAR(255)        DEFAULT NULL,
  person_id  BIGINT(20) NOT NULL REFERENCES person (id),
  `created`  TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = InnoDB;

#create news table
CREATE TABLE IF NOT EXISTS news
(
  id            BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title         VARCHAR(256)  NOT NULL,
  message       VARCHAR(1024) NOT NULL,
  author_id     BIGINT        NOT NULL REFERENCES person (id),
  `created`     TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activation`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `termination` TIMESTAMP     NULL     DEFAULT NULL
)
  ENGINE = INNODB;

#create message table
CREATE TABLE IF NOT EXISTS message
(
  id           BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_id    BIGINT        NOT NULL REFERENCES `user` (id),
  recipient_id BIGINT        NOT NULL REFERENCES `user` (id),
  #community_id     BIGINT  NOT NULL REFERENCES `user` (id), TODO: uncomment as soon as the community table exists
  title        VARCHAR(256)  NOT NULL,
  content      VARCHAR(1024) NOT NULL,
  `created`    TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = INNODB;

#create comment table
CREATE TABLE IF NOT EXISTS comment
(
  id               BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
  author_id        BIGINT        NOT NULL REFERENCES `user` (id),
  parentmessage_id BIGINT        NOT NULL REFERENCES `message` (id),
  text             VARCHAR(1024) NOT NULL,
  `created`        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified`       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
  ENGINE = INNODB;
