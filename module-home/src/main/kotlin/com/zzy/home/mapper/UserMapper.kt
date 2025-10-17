package com.zzy.home.mapper

import com.baomidou.mybatisplus.core.mapper.BaseMapper
import com.zzy.home.entity.User
import org.apache.ibatis.annotations.Mapper

/**
 * 用户 Mapper
 */
@Mapper
interface UserMapper : BaseMapper<User>

