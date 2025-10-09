-- ============================================
-- 文件管理系统数据库初始化脚本
-- ============================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS filedb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE filedb;

-- ============================================
-- 文件元数据表
-- ============================================
CREATE TABLE IF NOT EXISTS file_metadata (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '文件ID',
    file_name VARCHAR(255) NOT NULL COMMENT '原始文件名',
    stored_name VARCHAR(255) NOT NULL COMMENT '存储文件名(UUID)',
    file_size BIGINT NOT NULL COMMENT '文件大小(字节)',
    file_type VARCHAR(100) COMMENT '文件MIME类型',
    file_extension VARCHAR(20) COMMENT '文件扩展名',
    file_path VARCHAR(500) COMMENT '文件存储路径',
    file_md5 VARCHAR(64) COMMENT '文件MD5值(用于秒传)',
    download_count INT DEFAULT 0 COMMENT '下载次数',
    upload_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    status TINYINT DEFAULT 1 COMMENT '状态(1:正常 0:已删除)',
    user_id BIGINT COMMENT '上传用户ID(可选)',
    INDEX idx_file_name (file_name),
    INDEX idx_upload_time (upload_time),
    INDEX idx_file_md5 (file_md5),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='文件元数据表';

-- ============================================
-- 用户表（可选扩展）
-- ============================================
CREATE TABLE IF NOT EXISTS user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(255) NOT NULL COMMENT '密码',
    email VARCHAR(100) COMMENT '邮箱',
    storage_quota BIGINT DEFAULT 1073741824 COMMENT '存储配额(默认1GB)',
    used_storage BIGINT DEFAULT 0 COMMENT '已用存储',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    status TINYINT DEFAULT 1 COMMENT '状态(1:正常 0:禁用)',
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ============================================
-- 插入测试数据（可选）
-- ============================================
-- INSERT INTO file_metadata (file_name, stored_name, file_size, file_type, file_extension, file_path, file_md5, upload_time) 
-- VALUES ('示例文件.pdf', 'abc123.pdf', 2621440, 'application/pdf', 'pdf', 'abc123.pdf', 'md5hash123', NOW());


