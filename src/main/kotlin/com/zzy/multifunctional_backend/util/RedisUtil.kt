package com.zzy.multifunctional_backend.util

import org.springframework.data.redis.core.RedisTemplate
import org.springframework.stereotype.Component
import java.util.concurrent.TimeUnit

/**
 * Redis工具类
 * @author ZZY
 * @date 2025-10-09
 */
@Component
class RedisUtil(
    private val redisTemplate: RedisTemplate<String, Any>
) {
    
    /**
     * 设置缓存
     */
    fun set(key: String, value: Any, timeout: Long = 0, unit: TimeUnit = TimeUnit.SECONDS) {
        if (timeout > 0) {
            redisTemplate.opsForValue().set(key, value, timeout, unit)
        } else {
            redisTemplate.opsForValue().set(key, value)
        }
    }
    
    /**
     * 获取缓存
     */
    fun get(key: String): Any? {
        return redisTemplate.opsForValue().get(key)
    }
    
    /**
     * 删除缓存
     */
    fun delete(key: String): Boolean {
        return redisTemplate.delete(key)
    }
    
    /**
     * 批量删除缓存
     */
    fun delete(keys: Collection<String>): Long {
        return redisTemplate.delete(keys) ?: 0
    }
    
    /**
     * 判断key是否存在
     */
    fun hasKey(key: String): Boolean {
        return redisTemplate.hasKey(key)
    }
    
    /**
     * 设置过期时间
     */
    fun expire(key: String, timeout: Long, unit: TimeUnit = TimeUnit.SECONDS): Boolean {
        return redisTemplate.expire(key, timeout, unit)
    }
    
    /**
     * 获取过期时间
     */
    fun getExpire(key: String): Long {
        return redisTemplate.getExpire(key) ?: -1
    }
    
    /**
     * 删除匹配的key
     */
    fun deleteByPattern(pattern: String) {
        val keys = redisTemplate.keys(pattern)
        if (keys.isNotEmpty()) {
            redisTemplate.delete(keys)
        }
    }
}


