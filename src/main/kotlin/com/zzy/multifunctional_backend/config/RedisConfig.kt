package com.zzy.multifunctional_backend.config

import com.fasterxml.jackson.annotation.JsonAutoDetect
import com.fasterxml.jackson.annotation.PropertyAccessor
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.data.redis.connection.RedisConnectionFactory
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer
import org.springframework.data.redis.serializer.StringRedisSerializer

/**
 * Redis配置
 * @author ZZY
 * @date 2025-10-09
 */
@Configuration
class RedisConfig {
    
    @Bean
    fun redisTemplate(connectionFactory: RedisConnectionFactory): RedisTemplate<String, Any> {
        val template = RedisTemplate<String, Any>()
        template.connectionFactory = connectionFactory
        
        // 使用Jackson2JsonRedisSerializer来序列化和反序列化redis的value值
        val jackson2JsonRedisSerializer = Jackson2JsonRedisSerializer(ObjectMapper(), Any::class.java)
        
        val objectMapper = ObjectMapper()
        objectMapper.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY)
        objectMapper.activateDefaultTyping(
            LaissezFaireSubTypeValidator.instance,
            ObjectMapper.DefaultTyping.NON_FINAL
        )
        
        // 使用StringRedisSerializer来序列化和反序列化redis的key值
        val stringRedisSerializer = StringRedisSerializer()
        
        // key采用String的序列化方式
        template.keySerializer = stringRedisSerializer
        // hash的key也采用String的序列化方式
        template.hashKeySerializer = stringRedisSerializer
        // value序列化方式采用jackson
        template.valueSerializer = jackson2JsonRedisSerializer
        // hash的value序列化方式采用jackson
        template.hashValueSerializer = jackson2JsonRedisSerializer
        
        template.afterPropertiesSet()
        return template
    }
}


