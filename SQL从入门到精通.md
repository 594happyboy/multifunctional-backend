# SQL 从入门到精通

> 简洁实用的 SQL 教程，结合实际项目快速上手

---

## 📚 目录

1. [基础查询 SELECT](#1-基础查询-select)
2. [插入数据 INSERT](#2-插入数据-insert)
3. [更新数据 UPDATE](#3-更新数据-update)
4. [删除数据 DELETE](#4-删除数据-delete)
5. [条件查询 WHERE](#5-条件查询-where)
6. [排序与分页](#6-排序与分页)
7. [聚合与统计](#7-聚合与统计)
8. [多表关联](#8-多表关联)
9. [常用函数](#9-常用函数)
10. [MyBatis 使用](#10-mybatis-使用)

---

## 1. 基础查询 SELECT

### 查询所有列
```sql
SELECT * FROM file_metadata;
```

### 查询指定列
```sql
SELECT file_name, file_size FROM file_metadata;
```

### 列别名
```sql
SELECT 
    file_name AS 文件名,
    file_size / 1024 AS 大小KB
FROM file_metadata;
```

### 查询单条
```sql
SELECT * FROM file_metadata WHERE id = 1;
SELECT * FROM file_metadata LIMIT 1;
```

---

## 2. 插入数据 INSERT

### 插入单条
```sql
INSERT INTO file_metadata (file_name, file_size, upload_time) 
VALUES ('测试.txt', 1024, NOW());
```

### 插入后获取自增 ID
```sql
SELECT LAST_INSERT_ID();
```

### 批量插入
```sql
INSERT INTO file_metadata (file_name, file_size) 
VALUES 
    ('文件1.txt', 100),
    ('文件2.txt', 200),
    ('文件3.txt', 300);
```

---

## 3. 更新数据 UPDATE

### 更新单个字段
```sql
UPDATE file_metadata 
SET download_count = download_count + 1 
WHERE id = 5;
```

### 更新多个字段
```sql
UPDATE file_metadata 
SET 
    file_name = '新名称.txt',
    update_time = NOW()
WHERE id = 10;
```

### ⚠️ 注意
```sql
-- 没有 WHERE 会更新所有记录！
UPDATE file_metadata SET status = 0;  -- 危险！

-- 正确做法：加 WHERE
UPDATE file_metadata SET status = 0 WHERE id = 10;
```

---

## 4. 删除数据 DELETE

### 物理删除
```sql
DELETE FROM file_metadata WHERE id = 5;
```

### 逻辑删除（推荐）
```sql
-- 标记为删除，数据仍在
UPDATE file_metadata SET status = 0 WHERE id = 5;

-- 查询时过滤
SELECT * FROM file_metadata WHERE status = 1;
```

### 批量删除
```sql
DELETE FROM file_metadata WHERE id IN (1, 2, 3);
DELETE FROM file_metadata WHERE upload_time < '2023-01-01';
```

---

## 5. 条件查询 WHERE

### 比较运算符
```sql
SELECT * FROM file_metadata WHERE file_size = 1024;     -- 等于
SELECT * FROM file_metadata WHERE file_size != 1024;    -- 不等于
SELECT * FROM file_metadata WHERE file_size > 1024;     -- 大于
SELECT * FROM file_metadata WHERE file_size >= 1024;    -- 大于等于
SELECT * FROM file_metadata WHERE file_size < 1024;     -- 小于
SELECT * FROM file_metadata WHERE file_size <= 1024;    -- 小于等于
```

### 逻辑运算符
```sql
-- AND（且）
SELECT * FROM file_metadata 
WHERE status = 1 AND file_size > 1024;

-- OR（或）
SELECT * FROM file_metadata 
WHERE file_type = 'image/jpeg' OR file_type = 'image/png';

-- NOT（非）
SELECT * FROM file_metadata WHERE NOT status = 0;
```

### 模糊查询 LIKE
```sql
SELECT * FROM file_metadata WHERE file_name LIKE '%.jpg';   -- 以 .jpg 结尾
SELECT * FROM file_metadata WHERE file_name LIKE '报告%';    -- 以"报告"开头
SELECT * FROM file_metadata WHERE file_name LIKE '%2023%';  -- 包含"2023"
```

### 范围查询
```sql
-- IN
SELECT * FROM file_metadata WHERE id IN (1, 3, 5, 7);

-- BETWEEN
SELECT * FROM file_metadata WHERE file_size BETWEEN 1024 AND 1048576;

-- NULL 判断
SELECT * FROM file_metadata WHERE user_id IS NULL;
SELECT * FROM file_metadata WHERE user_id IS NOT NULL;
```

---

## 6. 排序与分页

### 排序 ORDER BY
```sql
-- 升序
SELECT * FROM file_metadata ORDER BY file_size ASC;

-- 降序
SELECT * FROM file_metadata ORDER BY upload_time DESC;

-- 多字段排序
SELECT * FROM file_metadata 
ORDER BY status DESC, upload_time DESC;
```

### 分页 LIMIT
```sql
-- 查询前 10 条
SELECT * FROM file_metadata LIMIT 10;

-- 跳过 20 条，查询 10 条（第 3 页）
SELECT * FROM file_metadata LIMIT 10 OFFSET 20;

-- 简写
SELECT * FROM file_metadata LIMIT 20, 10;
```

### 分页计算公式
```sql
-- 第 page 页，每页 size 条
LIMIT size OFFSET (page - 1) * size

-- 示例：第 3 页，每页 10 条
LIMIT 10 OFFSET 20
```

---

## 7. 聚合与统计

### 聚合函数
```sql
-- 统计数量
SELECT COUNT(*) FROM file_metadata;

-- 求和
SELECT SUM(file_size) FROM file_metadata;

-- 平均值
SELECT AVG(file_size) FROM file_metadata;

-- 最大值/最小值
SELECT MAX(file_size) FROM file_metadata;
SELECT MIN(upload_time) FROM file_metadata;
```

### 分组统计 GROUP BY
```sql
-- 按类型统计数量
SELECT file_type, COUNT(*) AS count
FROM file_metadata
GROUP BY file_type;

-- 按用户统计上传量
SELECT 
    user_id,
    COUNT(*) AS file_count,
    SUM(file_size) / 1048576 AS total_mb
FROM file_metadata
GROUP BY user_id;
```

### 分组过滤 HAVING
```sql
-- 查询文件数量超过 10 的类型
SELECT file_type, COUNT(*) AS count
FROM file_metadata
GROUP BY file_type
HAVING count > 10;
```

### WHERE vs HAVING
```sql
SELECT file_type, COUNT(*) AS count
FROM file_metadata
WHERE status = 1          -- 分组前过滤
GROUP BY file_type
HAVING count > 5          -- 分组后过滤
ORDER BY count DESC;
```

---

## 8. 多表关联

### 准备数据
```sql
-- 用户表
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    username VARCHAR(50)
);

-- 文件表（有 user_id 外键）
```

### INNER JOIN（内连接）
```sql
-- 查询文件及其上传者
SELECT 
    f.file_name,
    u.username
FROM file_metadata f
INNER JOIN users u ON f.user_id = u.id;
```

### LEFT JOIN（左连接）
```sql
-- 查询所有文件，包括没有用户的
SELECT 
    f.file_name,
    u.username
FROM file_metadata f
LEFT JOIN users u ON f.user_id = u.id;
```

### 子查询
```sql
-- 查询上传文件最多的用户的所有文件
SELECT * FROM file_metadata
WHERE user_id = (
    SELECT user_id 
    FROM file_metadata 
    GROUP BY user_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
);
```

---

## 9. 常用函数

### 字符串函数
```sql
-- 拼接
SELECT CONCAT(file_name, ' (', file_size, ' bytes)') FROM file_metadata;

-- 大小写转换
SELECT UPPER(file_name) FROM file_metadata;
SELECT LOWER(file_name) FROM file_metadata;

-- 截取
SELECT SUBSTRING(file_name, 1, 10) FROM file_metadata;

-- 替换
SELECT REPLACE(file_name, '.txt', '.bak') FROM file_metadata;

-- 长度
SELECT LENGTH(file_name) FROM file_metadata;
```

### 日期函数
```sql
-- 当前时间
SELECT NOW();                    -- 2023-10-10 14:30:25
SELECT CURDATE();                -- 2023-10-10
SELECT CURTIME();                -- 14:30:25

-- 格式化
SELECT DATE_FORMAT(upload_time, '%Y-%m-%d') FROM file_metadata;

-- 计算
SELECT DATE_ADD(upload_time, INTERVAL 7 DAY) FROM file_metadata;  -- 7天后
SELECT DATEDIFF(NOW(), upload_time) FROM file_metadata;           -- 距今天数

-- 提取
SELECT YEAR(upload_time) FROM file_metadata;
SELECT MONTH(upload_time) FROM file_metadata;
SELECT DAY(upload_time) FROM file_metadata;
```

### 数学函数
```sql
-- 四舍五入
SELECT ROUND(file_size / 1024, 2) FROM file_metadata;

-- 向上/向下取整
SELECT CEIL(file_size / 1024) FROM file_metadata;
SELECT FLOOR(file_size / 1024) FROM file_metadata;
```

### 条件函数 CASE WHEN
```sql
SELECT 
    file_name,
    CASE 
        WHEN file_size < 1024 THEN '小文件'
        WHEN file_size < 1048576 THEN '中等文件'
        ELSE '大文件'
    END AS size_category
FROM file_metadata;
```

### 其他
```sql
-- 去重
SELECT DISTINCT file_type FROM file_metadata;

-- IF 函数
SELECT file_name, IF(status = 1, '正常', '已删除') AS status_text
FROM file_metadata;

-- COALESCE（返回第一个非空值）
SELECT COALESCE(user_id, 0) FROM file_metadata;
```

---

## 10. MyBatis 使用

### 注解方式
```kotlin
@Mapper
interface FileMapper : BaseMapper<FileMetadata> {
    
    // 查询
    @Select("SELECT * FROM file_metadata WHERE file_md5 = #{md5}")
    fun selectByMd5(@Param("md5") md5: String): FileMetadata?
    
    // 更新
    @Update("UPDATE file_metadata SET download_count = download_count + 1 WHERE id = #{id}")
    fun increaseDownloadCount(@Param("id") id: Long): Int
    
    // 插入
    @Insert("""
        INSERT INTO file_metadata (file_name, file_size)
        VALUES (#{fileName}, #{fileSize})
    """)
    fun insertFile(file: FileMetadata): Int
    
    // 删除
    @Delete("DELETE FROM file_metadata WHERE id = #{id}")
    fun deleteById(@Param("id") id: Long): Int
}
```

### MyBatis-Plus QueryWrapper
```kotlin
// 构建查询条件
val queryWrapper = QueryWrapper<FileMetadata>()
    .eq("status", 1)                        // WHERE status = 1
    .like("file_name", "报告")               // AND file_name LIKE '%报告%'
    .gt("file_size", 1024)                  // AND file_size > 1024
    .between("file_size", 1024, 1048576)    // AND file_size BETWEEN 1024 AND 1048576
    .in("id", listOf(1, 2, 3))              // AND id IN (1, 2, 3)
    .isNull("user_id")                      // AND user_id IS NULL
    .isNotNull("user_id")                   // AND user_id IS NOT NULL
    .orderByDesc("upload_time")             // ORDER BY upload_time DESC

// 执行查询
val files = fileMapper.selectList(queryWrapper)
```

### QueryWrapper 方法对照表

| 方法 | SQL |
|------|-----|
| `eq("field", value)` | `field = value` |
| `ne("field", value)` | `field != value` |
| `gt("field", value)` | `field > value` |
| `ge("field", value)` | `field >= value` |
| `lt("field", value)` | `field < value` |
| `le("field", value)` | `field <= value` |
| `like("field", value)` | `field LIKE '%value%'` |
| `likeLeft("field", value)` | `field LIKE '%value'` |
| `likeRight("field", value)` | `field LIKE 'value%'` |
| `in("field", list)` | `field IN (...)` |
| `between("field", v1, v2)` | `field BETWEEN v1 AND v2` |
| `isNull("field")` | `field IS NULL` |
| `isNotNull("field")` | `field IS NOT NULL` |
| `orderByAsc("field")` | `ORDER BY field ASC` |
| `orderByDesc("field")` | `ORDER BY field DESC` |

---

## 📖 SQL 速查表

### 常用数据类型
```sql
INT / BIGINT           -- 整数
VARCHAR(n)             -- 字符串（最大 n 个字符）
TEXT                   -- 长文本
DECIMAL(m,n)           -- 精确小数
DATETIME               -- 日期时间
TINYINT(1)             -- 布尔值（0/1）
```

### 常用约束
```sql
PRIMARY KEY            -- 主键
AUTO_INCREMENT         -- 自增
NOT NULL               -- 非空
UNIQUE                 -- 唯一
DEFAULT value          -- 默认值
```

### 执行顺序
```sql
FROM       -- 1. 从哪张表
JOIN       -- 2. 关联其他表
WHERE      -- 3. 过滤行
GROUP BY   -- 4. 分组
HAVING     -- 5. 过滤分组
SELECT     -- 6. 选择列
ORDER BY   -- 7. 排序
LIMIT      -- 8. 限制行数
```

---

## 🎯 实战练习

### 练习 1
查询所有大于 1MB 的图片文件，按上传时间倒序

<details>
<summary>答案</summary>

```sql
SELECT * FROM file_metadata
WHERE file_type LIKE 'image/%' 
  AND file_size > 1048576
ORDER BY upload_time DESC;
```
</details>

---

### 练习 2
统计每种文件类型的数量和总大小（MB）

<details>
<summary>答案</summary>

```sql
SELECT 
    file_type,
    COUNT(*) AS count,
    SUM(file_size) / 1048576 AS total_mb
FROM file_metadata
WHERE status = 1
GROUP BY file_type
ORDER BY total_mb DESC;
```
</details>

---

### 练习 3
查询下载次数排名前 10 的文件

<details>
<summary>答案</summary>

```sql
SELECT 
    file_name,
    ROUND(file_size / 1048576, 2) AS size_mb,
    download_count
FROM file_metadata
WHERE status = 1
ORDER BY download_count DESC
LIMIT 10;
```
</details>

---

### 练习 4
查询最近 7 天上传的文件

<details>
<summary>答案</summary>

```sql
SELECT * FROM file_metadata
WHERE upload_time >= DATE_SUB(NOW(), INTERVAL 7 DAY)
ORDER BY upload_time DESC;
```
</details>

---

### 练习 5
用 QueryWrapper 实现：文件名包含"报告"、大小在 1KB~10MB、未删除

<details>
<summary>答案</summary>

```kotlin
val wrapper = QueryWrapper<FileMetadata>()
    .eq("status", 1)
    .like("file_name", "报告")
    .between("file_size", 1024, 10485760)
    .orderByDesc("upload_time")

val files = fileMapper.selectList(wrapper)
```
</details>

---

## 💡 学习建议

1. **动手实践**：在 IDEA Database 工具中执行 SQL
2. **查看日志**：开启 MyBatis SQL 日志，看生成的语句
3. **循序渐进**：先掌握 CRUD，再学聚合和关联
4. **结合项目**：在你的项目中尝试自定义查询

---

## 🚀 下一步

- 打开 IDEA Database 工具，连接 MySQL
- 在 Console 中执行文档里的 SQL
- 对照你的 `FileMapper.kt`，理解注解用法
- 完成实战练习题

祝学习顺利！🎉


