CREATE TABLE IF NOT EXISTS "pay_merchant" (
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "no"          varchar(32) NOT NULL,
    "name"        varchar(64) NOT NULL,
    "short_name"  varchar(64) NOT NULL,
    "status"      tinyint     NOT NULL,
    "remark"      varchar(255)         DEFAULT NULL,
    "creator"     varchar(64)          DEFAULT '',
    "create_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)          DEFAULT '',
    "update_time" datetime    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"     bit(1)      NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT '支付商户信息';

CREATE TABLE IF NOT EXISTS "pay_app" (
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "name"              varchar(64)   NOT NULL,
    "status"            tinyint       NOT NULL,
    "remark"            varchar(255)           DEFAULT NULL,
    `pay_notify_url`    varchar(1024) NOT NULL,
    `refund_notify_url` varchar(1024) NOT NULL,
    `merchant_id`       bigint(20)    NOT NULL,
    "creator"           varchar(64)            DEFAULT '',
    "create_time"       datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"           varchar(64)            DEFAULT '',
    "update_time"       datetime      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"           bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '支付应用信息';

CREATE TABLE IF NOT EXISTS "pay_channel" (
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "code"        varchar(32)    NOT NULL,
    "status"      tinyint(4)     NOT NULL,
    "remark"      varchar(255)            DEFAULT NULL,
    "fee_rate"    double         NOT NULL DEFAULT 0,
    "merchant_id" bigint(20)     NOT NULL,
    "app_id"      bigint(20)     NOT NULL,
    "config"      varchar(10240) NOT NULL,
    "creator"     varchar(64)    NULL     DEFAULT '',
    "create_time" datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updater"     varchar(64)    NULL     DEFAULT '',
    "update_time" datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "deleted"     bit(1)         NOT NULL DEFAULT FALSE,
    "tenant_id" bigint not null default  '0',
    PRIMARY KEY ("id")
) COMMENT = '支付渠道';

CREATE TABLE IF NOT EXISTS `pay_order` (
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `merchant_id`          bigint(20)    NOT NULL,
    `app_id`               bigint(20)    NOT NULL,
    `channel_id`           bigint(20)             DEFAULT NULL,
    `channel_code`         varchar(32)            DEFAULT NULL,
    `merchant_order_id`    varchar(64)   NOT NULL,
    `subject`              varchar(32)   NOT NULL,
    `body`                 varchar(128)  NOT NULL,
    `notify_url`           varchar(1024) NOT NULL,
    `notify_status`        tinyint(4)    NOT NULL,
    `amount`               bigint(20)    NOT NULL,
    `channel_fee_rate`     double                 DEFAULT 0,
    `channel_fee_amount`   bigint(20)             DEFAULT 0,
    `status`               tinyint(4)    NOT NULL,
    `user_ip`              varchar(50)   NOT NULL,
    `expire_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `success_time`         datetime(0)            DEFAULT CURRENT_TIMESTAMP,
    `notify_time`          datetime(0)            DEFAULT CURRENT_TIMESTAMP,
    `success_extension_id` bigint(20)             DEFAULT NULL COMMENT '支付成功的订单拓展单编号',
    `refund_status`        tinyint(4)    NOT NULL,
    `refund_times`         tinyint(4)    NOT NULL,
    `refund_amount`        bigint(20)    NOT NULL,
    `channel_user_id`      varchar(255)           DEFAULT NULL,
    `channel_order_no`     varchar(64)            DEFAULT NULL,
    `creator`              varchar(64)            DEFAULT '',
    `create_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`              varchar(64)            DEFAULT '',
    `update_time`          datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`              bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '支付订单';

CREATE TABLE IF NOT EXISTS `pay_refund` (
    "id" number NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    `merchant_id`        bigint(20)    NOT NULL,
    `app_id`             bigint(20)    NOT NULL,
    `channel_id`         bigint(20)    NOT NULL,
    `channel_code`       varchar(32)   NOT NULL,
    `order_id`           bigint(20)    NOT NULL,
    `trade_no`           varchar(64)   NOT NULL,
    `merchant_order_id`  varchar(64)   NOT NULL,
    `merchant_refund_no` varchar(64)   NOT NULL,
    `notify_url`         varchar(1024) NOT NULL,
    `notify_status`      tinyint(4)    NOT NULL,
    `status`             tinyint(4)    NOT NULL,
    `type`               tinyint(4)    NOT NULL,
    `pay_amount`         bigint(20)    NOT NULL,
    `refund_amount`      bigint(20)    NOT NULL,
    `reason`             varchar(256)  NOT NULL,
    `user_ip`            varchar(50)   NULL     DEFAULT NULL,
    `channel_order_no`   varchar(64)   NOT NULL,
    `channel_refund_no`  varchar(64)   NULL     DEFAULT NULL,
    `channel_error_code` varchar(128)  NULL     DEFAULT NULL,
    `channel_error_msg`  varchar(256)  NULL     DEFAULT NULL,
    `channel_extras`     varchar(1024) NULL     DEFAULT NULL,
    `expire_time`        datetime(0)   NULL     DEFAULT NULL,
    `success_time`       datetime(0)   NULL     DEFAULT NULL,
    `notify_time`        datetime(0)   NULL     DEFAULT NULL,
    `creator`            varchar(64)   NULL     DEFAULT '',
    `create_time`        datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`            varchar(64)   NULL     DEFAULT '',
    `update_time`        datetime(0)   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`            bit(1)        NOT NULL DEFAULT FALSE,
    PRIMARY KEY ("id")
) COMMENT = '退款订单';
