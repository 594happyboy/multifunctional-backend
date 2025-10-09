package com.zzy.multifunctional_backend.dto

import org.springframework.web.multipart.MultipartFile

/**
 * 文件上传请求DTO
 * @author ZZY
 * @date 2025-10-09
 */
data class FileUploadRequest(
    /** 上传的文件 */
    val file: MultipartFile,
    
    /** 用户ID(可选) */
    val userId: Long? = null
)


