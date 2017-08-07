CREATE TABLE IF NOT EXISTS send_mail_queue(
  send_mail_queue_id BIGINT(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'メール送信キューID'
  , from_address varchar(255) NOT NULL COMMENT 'fromアドレス'
  , to_address varchar(255) DEFAULT NULL COMMENT 'toアドレス'
  , cc_address varchar(255) DEFAULT NULL COMMENT 'ccアドレス'
  , bcc_address varchar(255) DEFAULT NULL COMMENT 'bccアドレス'
  , subject varchar(255) DEFAULT NULL COMMENT '件名'
  , body TEXT
  , sent_at DATETIME DEFAULT NULL COMMENT 'メール送信日時'
  , created_by VARCHAR(50) NOT NULL COMMENT '登録者'
  , created_at DATETIME DEFAULT NULL COMMENT '登録日時'
  , updated_by VARCHAR(50) DEFAULT NULL COMMENT '更新者'
  , updated_at DATETIME DEFAULT NULL COMMENT '更新日時'
  , deleted_by VARCHAR(50) DEFAULT NULL COMMENT '削除者'
  , deleted_at DATETIME DEFAULT NULL COMMENT '削除日時'
  , version INT(11) unsigned NOT NULL DEFAULT 1 COMMENT '改訂番号'
  , PRIMARY KEY (send_mail_queue_id, created_at)
  , KEY idx_send_mail_queue (sent_at, deleted_at)
) COMMENT='メール送信キュー' PARTITION BY RANGE (YEAR(created_at))(
  PARTITION p2017 VALUES LESS THAN (2017),
  PARTITION p2018 VALUES LESS THAN (2018),
  PARTITION p2019 VALUES LESS THAN (2019),
  PARTITION p2020 VALUES LESS THAN (2020),
  PARTITION p2021 VALUES LESS THAN (2021),
  PARTITION p2022 VALUES LESS THAN (2022),
  PARTITION p2023 VALUES LESS THAN (2023),
  PARTITION p2024 VALUES LESS THAN (2024),
  PARTITION p2025 VALUES LESS THAN (2025),
  PARTITION p2026 VALUES LESS THAN (2026),
  PARTITION p2027 VALUES LESS THAN (2027),
  PARTITION p2028 VALUES LESS THAN (2028),
  PARTITION p2029 VALUES LESS THAN (2029),
  PARTITION p2030 VALUES LESS THAN (2030)
);