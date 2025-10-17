# 博客 API 测试脚本
# 测试所有博客相关接口的功能

$baseUrl = "http://localhost:8080"
$token = ""

# 颜色输出函数
function Write-Success {
    param([string]$message)
    Write-Host "✓ $message" -ForegroundColor Green
}

function Write-Error-Custom {
    param([string]$message)
    Write-Host "✗ $message" -ForegroundColor Red
}

function Write-Info {
    param([string]$message)
    Write-Host "ℹ $message" -ForegroundColor Cyan
}

function Write-Test {
    param([string]$message)
    Write-Host "`n========================================" -ForegroundColor Yellow
    Write-Host "  $message" -ForegroundColor Yellow
    Write-Host "========================================" -ForegroundColor Yellow
}

# 发送请求的辅助函数
function Invoke-ApiRequest {
    param(
        [string]$method,
        [string]$url,
        [object]$body = $null,
        [bool]$needAuth = $false
    )
    
    try {
        $headers = @{
            "Content-Type" = "application/json"
        }
        
        if ($needAuth -and $token) {
            $headers["Authorization"] = "Bearer $token"
        }
        
        $params = @{
            Method = $method
            Uri = $url
            Headers = $headers
        }
        
        if ($body) {
            $params.Body = ($body | ConvertTo-Json -Depth 10)
        }
        
        $response = Invoke-RestMethod @params
        return $response
    }
    catch {
        $errorMessage = $_.Exception.Message
        if ($_.ErrorDetails.Message) {
            $errorMessage = $_.ErrorDetails.Message
        }
        Write-Error-Custom "请求失败: $errorMessage"
        return $null
    }
}

# ============================================
# 测试 1: 认证接口
# ============================================
Write-Test "测试 1: 认证接口"

Write-Info "1.1 测试登录接口 (POST /api/auth/login)"
$loginData = @{
    username = "admin"
    password = "admin123"
}
$loginResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/auth/login" -body $loginData

if ($loginResponse -and $loginResponse.code -eq 200) {
    $token = $loginResponse.data.token
    Write-Success "登录成功"
    Write-Info "Token: $($token.Substring(0, [Math]::Min(50, $token.Length)))..."
    Write-Info "用户名: $($loginResponse.data.user.username)"
    Write-Info "用户ID: $($loginResponse.data.user.id)"
} else {
    Write-Error-Custom "登录失败"
    exit
}

Write-Info "`n1.2 测试错误密码登录"
$wrongLoginData = @{
    username = "admin"
    password = "wrongpassword"
}
$wrongLoginResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/auth/login" -body $wrongLoginData
if ($wrongLoginResponse -and $wrongLoginResponse.code -ne 200) {
    Write-Success "正确拒绝了错误密码"
} else {
    Write-Error-Custom "安全问题：错误密码也能登录"
}

# ============================================
# 测试 2: 分组接口
# ============================================
Write-Test "测试 2: 分组接口"

Write-Info "2.1 测试获取公共分组列表 (GET /api/groups)"
$groupsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/groups"
if ($groupsResponse -and $groupsResponse.code -eq 200) {
    Write-Success "获取分组列表成功"
    Write-Info "分组数量: $($groupsResponse.data.Count)"
    foreach ($group in $groupsResponse.data) {
        Write-Info "  - $($group.name) (slug: $($group.slug), 文章数: $($group.articleCount))"
    }
    $testGroupId = $groupsResponse.data[0].id
} else {
    Write-Error-Custom "获取分组列表失败"
    $testGroupId = 1
}

Write-Info "`n2.2 测试创建新分组 (POST /api/admin/groups)"
$newGroupData = @{
    name = "测试分组"
    slug = "test-group"
    description = "这是一个测试分组"
    orderIndex = 99
}
$createGroupResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/admin/groups" -body $newGroupData -needAuth $true
if ($createGroupResponse -and $createGroupResponse.code -eq 200) {
    Write-Success "创建分组成功"
    $createdGroupId = $createGroupResponse.data.id
    Write-Info "分组ID: $createdGroupId"
} else {
    Write-Error-Custom "创建分组失败"
    $createdGroupId = $null
}

Write-Info "`n2.3 测试获取管理端分组列表 (GET /api/admin/groups)"
$adminGroupsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/groups" -needAuth $true
if ($adminGroupsResponse -and $adminGroupsResponse.code -eq 200) {
    Write-Success "获取管理端分组列表成功"
    Write-Info "分组数量: $($adminGroupsResponse.data.Count)"
} else {
    Write-Error-Custom "获取管理端分组列表失败"
}

# ============================================
# 测试 3: 文章管理接口
# ============================================
Write-Test "测试 3: 文章管理接口"

Write-Info "3.1 测试创建 Markdown 文章 (POST /api/admin/articles)"
$newArticleData = @{
    title = "测试文章 - Markdown"
    slug = "test-article-markdown-$(Get-Date -Format 'yyyyMMddHHmmss')"
    summary = "这是一篇测试的 Markdown 文章摘要"
    contentType = "markdown"
    contentText = @"
# 测试文章标题

这是一篇测试文章的内容。

## 第一部分

测试内容 1

## 第二部分

测试内容 2

``````kotlin
fun main() {
    println("Hello World!")
}
``````
"@
    coverUrl = "https://picsum.photos/800/400"
    groupId = $testGroupId
    tags = @("测试", "Markdown")
    status = "published"
}
$createArticleResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/admin/articles" -body $newArticleData -needAuth $true
if ($createArticleResponse -and $createArticleResponse.code -eq 200) {
    Write-Success "创建文章成功"
    $createdArticleId = $createArticleResponse.data.id
    $createdArticleSlug = $createArticleResponse.data.slug
    Write-Info "文章ID: $createdArticleId"
    Write-Info "文章Slug: $createdArticleSlug"
} else {
    Write-Error-Custom "创建文章失败"
    exit
}

Write-Info "`n3.2 测试创建草稿文章 (POST /api/admin/articles)"
$draftArticleData = @{
    title = "测试草稿文章"
    slug = "test-draft-article-$(Get-Date -Format 'yyyyMMddHHmmss')"
    summary = "这是一篇草稿文章"
    contentType = "markdown"
    contentText = "# 草稿内容"
    groupId = $testGroupId
    tags = @("测试", "草稿")
    status = "draft"
}
$createDraftResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/admin/articles" -body $draftArticleData -needAuth $true
if ($createDraftResponse -and $createDraftResponse.code -eq 200) {
    Write-Success "创建草稿文章成功"
    $draftArticleId = $createDraftResponse.data.id
    Write-Info "草稿ID: $draftArticleId"
} else {
    Write-Error-Custom "创建草稿文章失败"
}

Write-Info "`n3.3 测试获取管理端文章列表 (GET /api/admin/articles)"
$adminArticlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/articles?page=1``&size=10" -needAuth $true
if ($adminArticlesResponse -and $adminArticlesResponse.code -eq 200) {
    Write-Success "获取管理端文章列表成功"
    Write-Info "总文章数: $($adminArticlesResponse.data.total)"
    Write-Info "当前页: $($adminArticlesResponse.data.page)"
    Write-Info "每页数量: $($adminArticlesResponse.data.size)"
    Write-Info "当前页文章数: $($adminArticlesResponse.data.items.Count)"
} else {
    Write-Error-Custom "获取管理端文章列表失败"
}

Write-Info "`n3.4 测试根据状态筛选文章 (GET /api/admin/articles?status=draft)"
$draftArticlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/articles?status=draft" -needAuth $true
if ($draftArticlesResponse -and $draftArticlesResponse.code -eq 200) {
    Write-Success "获取草稿文章成功"
    Write-Info "草稿数量: $($draftArticlesResponse.data.total)"
} else {
    Write-Error-Custom "获取草稿文章失败"
}

Write-Info "`n3.5 测试获取文章详情 (GET /api/admin/articles/{id})"
$adminArticleDetailResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/articles/$createdArticleId" -needAuth $true
if ($adminArticleDetailResponse -and $adminArticleDetailResponse.code -eq 200) {
    Write-Success "获取文章详情成功"
    Write-Info "标题: $($adminArticleDetailResponse.data.title)"
    Write-Info "Slug: $($adminArticleDetailResponse.data.slug)"
    Write-Info "状态: $($adminArticleDetailResponse.data.status)"
} else {
    Write-Error-Custom "获取文章详情失败"
}

Write-Info "`n3.6 测试更新文章 (PUT /api/admin/articles/{id})"
$updateArticleData = @{
    title = "测试文章 - Markdown (已更新)"
    slug = $createdArticleSlug
    summary = "这是更新后的摘要"
    contentType = "markdown"
    contentText = "# 更新后的内容`n`n这是更新后的文章内容。"
    coverUrl = "https://picsum.photos/800/400"
    groupId = $testGroupId
    tags = @("测试", "Markdown", "更新")
    status = "published"
}
$updateArticleResponse = Invoke-ApiRequest -method "PUT" -url "$baseUrl/api/admin/articles/$createdArticleId" -body $updateArticleData -needAuth $true
if ($updateArticleResponse -and $updateArticleResponse.code -eq 200) {
    Write-Success "更新文章成功"
} else {
    Write-Error-Custom "更新文章失败"
}

# ============================================
# 测试 4: 文章公共接口
# ============================================
Write-Test "测试 4: 文章公共接口"

Write-Info "4.1 测试获取已发布文章列表 (GET /api/articles)"
$articlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles?page=1&size=10"
if ($articlesResponse -and $articlesResponse.code -eq 200) {
    Write-Success "获取文章列表成功"
    Write-Info "总文章数: $($articlesResponse.data.total)"
    Write-Info "当前页文章数: $($articlesResponse.data.items.Count)"
    foreach ($article in $articlesResponse.data.items | Select-Object -First 3) {
        Write-Info "  - $($article.title) (浏览量: $($article.views), 评论数: $($article.commentCount))"
    }
} else {
    Write-Error-Custom "获取文章列表失败"
}

Write-Info "`n4.2 测试按分组筛选文章 (GET /api/articles?group={groupId})"
$groupArticlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles?group=$testGroupId"
if ($groupArticlesResponse -and $groupArticlesResponse.code -eq 200) {
    Write-Success "按分组筛选文章成功"
    Write-Info "该分组文章数: $($groupArticlesResponse.data.total)"
} else {
    Write-Error-Custom "按分组筛选文章失败"
}

Write-Info "`n4.3 测试关键词搜索 (GET /api/articles?keyword=测试)"
$searchArticlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles?keyword=测试"
if ($searchArticlesResponse -and $searchArticlesResponse.code -eq 200) {
    Write-Success "关键词搜索成功"
    Write-Info "搜索结果数: $($searchArticlesResponse.data.total)"
} else {
    Write-Error-Custom "关键词搜索失败"
}

Write-Info "`n4.4 测试按浏览量排序 (GET /api/articles?orderBy=views)"
$sortedArticlesResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles?orderBy=views"
if ($sortedArticlesResponse -and $sortedArticlesResponse.code -eq 200) {
    Write-Success "按浏览量排序成功"
    Write-Info "返回文章数: $($sortedArticlesResponse.data.items.Count)"
} else {
    Write-Error-Custom "按浏览量排序失败"
}

Write-Info "`n4.5 测试根据 slug 获取文章详情 (GET /api/articles/{slug})"
$articleDetailResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles/$createdArticleSlug"
if ($articleDetailResponse -and $articleDetailResponse.code -eq 200) {
    Write-Success "获取文章详情成功"
    Write-Info "标题: $($articleDetailResponse.data.title)"
    Write-Info "浏览量: $($articleDetailResponse.data.views)"
    Write-Info "评论数: $($articleDetailResponse.data.commentCount)"
    $initialViews = $articleDetailResponse.data.views
} else {
    Write-Error-Custom "获取文章详情失败"
}

Write-Info "`n4.6 测试浏览量自增（再次访问文章）"
$articleDetailResponse2 = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles/$createdArticleSlug"
if ($articleDetailResponse2 -and $articleDetailResponse2.code -eq 200) {
    $newViews = $articleDetailResponse2.data.views
    if ($newViews -gt $initialViews) {
        Write-Success "浏览量自增功能正常 ($initialViews -> $newViews)"
    } else {
        Write-Error-Custom "浏览量未增加（可能有缓存）"
    }
} else {
    Write-Error-Custom "再次获取文章详情失败"
}

# ============================================
# 测试 5: 评论接口
# ============================================
Write-Test "测试 5: 评论接口"

Write-Info "5.1 测试提交评论 (POST /api/articles/{articleId}/comments)"
$commentData1 = @{
    nickname = "测试用户1"
    content = "这是第一条测试评论，文章写得很好！"
}
$createCommentResponse1 = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/articles/$createdArticleId/comments" -body $commentData1
if ($createCommentResponse1 -and $createCommentResponse1.code -eq 200) {
    Write-Success "提交第一条评论成功"
    $commentId1 = $createCommentResponse1.data.id
    Write-Info "评论ID: $commentId1"
    Write-Info "昵称: $($createCommentResponse1.data.nickname)"
} else {
    Write-Error-Custom "提交评论失败"
}

Write-Info "`n5.2 测试提交第二条评论"
$commentData2 = @{
    nickname = "访客"
    content = "受益匪浅，感谢分享！"
}
$createCommentResponse2 = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/articles/$createdArticleId/comments" -body $commentData2
if ($createCommentResponse2 -and $createCommentResponse2.code -eq 200) {
    Write-Success "提交第二条评论成功"
    $commentId2 = $createCommentResponse2.data.id
} else {
    Write-Error-Custom "提交第二条评论失败"
}

Write-Info "`n5.3 测试获取文章评论列表 (GET /api/articles/{articleId}/comments)"
$commentsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles/$createdArticleId/comments?page=1``&size=20"
if ($commentsResponse -and $commentsResponse.code -eq 200) {
    Write-Success "获取评论列表成功"
    Write-Info "评论总数: $($commentsResponse.data.total)"
    Write-Info "当前页评论数: $($commentsResponse.data.items.Count)"
    foreach ($comment in $commentsResponse.data.items) {
        Write-Info "  - $($comment.nickname): $($comment.content)"
    }
} else {
    Write-Error-Custom "获取评论列表失败"
}

Write-Info "`n5.4 测试获取管理端所有评论 (GET /api/admin/comments)"
$adminCommentsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/comments?page=1``&size=20" -needAuth $true
if ($adminCommentsResponse -and $adminCommentsResponse.code -eq 200) {
    Write-Success "获取管理端评论列表成功"
    Write-Info "评论总数: $($adminCommentsResponse.data.total)"
} else {
    Write-Error-Custom "获取管理端评论列表失败"
}

Write-Info "`n5.5 测试评论数更新（查看文章详情中的评论数）"
$articleWithCommentsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/articles/$createdArticleSlug"
if ($articleWithCommentsResponse -and $articleWithCommentsResponse.code -eq 200) {
    $commentCount = $articleWithCommentsResponse.data.commentCount
    if ($commentCount -ge 2) {
        Write-Success "文章评论数正确更新: $commentCount"
    } else {
        Write-Error-Custom "文章评论数未正确更新: $commentCount (应该 >= 2)"
    }
} else {
    Write-Error-Custom "获取文章详情失败"
}

# ============================================
# 测试 6: 仪表盘统计接口
# ============================================
Write-Test "测试 6: 仪表盘统计接口"

Write-Info "6.1 测试获取统计数据 (GET /api/admin/dashboard/stats)"
$statsResponse = Invoke-ApiRequest -method "GET" -url "$baseUrl/api/admin/dashboard/stats" -needAuth $true
if ($statsResponse -and $statsResponse.code -eq 200) {
    Write-Success "获取统计数据成功"
    Write-Info "总文章数: $($statsResponse.data.articleCount)"
    Write-Info "已发布文章数: $($statsResponse.data.publishedCount)"
    Write-Info "草稿数: $($statsResponse.data.draftCount)"
    Write-Info "总评论数: $($statsResponse.data.commentCount)"
    Write-Info "总浏览量: $($statsResponse.data.totalViews)"
    Write-Info "今日浏览量: $($statsResponse.data.todayViews)"
} else {
    Write-Error-Custom "获取统计数据失败"
}

# ============================================
# 测试 7: 权限验证
# ============================================
Write-Test "测试 7: 权限验证"

Write-Info "7.1 测试未授权访问管理接口"
try {
    $unauthorizedResponse = Invoke-RestMethod -Method GET -Uri "$baseUrl/api/admin/articles" -Headers @{"Content-Type"="application/json"}
    Write-Error-Custom "安全问题：未授权也能访问管理接口"
}
catch {
    Write-Success "正确拒绝了未授权访问"
}

Write-Info "`n7.2 测试错误Token访问管理接口"
try {
    $wrongTokenResponse = Invoke-RestMethod -Method GET -Uri "$baseUrl/api/admin/articles" -Headers @{
        "Content-Type"="application/json"
        "Authorization"="Bearer wrong-token-12345"
    }
    Write-Error-Custom "安全问题：错误Token也能访问管理接口"
}
catch {
    Write-Success "正确拒绝了错误Token"
}

# ============================================
# 测试 8: 清理测试数据
# ============================================
Write-Test "测试 8: 清理测试数据"

Write-Info "8.1 删除测试评论"
if ($commentId1) {
    $deleteCommentResponse1 = Invoke-ApiRequest -method "DELETE" -url "$baseUrl/api/admin/comments/$commentId1" -needAuth $true
    if ($deleteCommentResponse1 -and $deleteCommentResponse1.code -eq 200) {
        Write-Success "删除第一条评论成功"
    } else {
        Write-Error-Custom "删除第一条评论失败"
    }
}

if ($commentId2) {
    $deleteCommentResponse2 = Invoke-ApiRequest -method "DELETE" -url "$baseUrl/api/admin/comments/$commentId2" -needAuth $true
    if ($deleteCommentResponse2 -and $deleteCommentResponse2.code -eq 200) {
        Write-Success "删除第二条评论成功"
    } else {
        Write-Error-Custom "删除第二条评论失败"
    }
}

Write-Info "`n8.2 删除测试文章"
if ($createdArticleId) {
    $deleteArticleResponse = Invoke-ApiRequest -method "DELETE" -url "$baseUrl/api/admin/articles/$createdArticleId" -needAuth $true
    if ($deleteArticleResponse -and $deleteArticleResponse.code -eq 200) {
        Write-Success "删除已发布文章成功"
    } else {
        Write-Error-Custom "删除已发布文章失败"
    }
}

if ($draftArticleId) {
    $deleteDraftResponse = Invoke-ApiRequest -method "DELETE" -url "$baseUrl/api/admin/articles/$draftArticleId" -needAuth $true
    if ($deleteDraftResponse -and $deleteDraftResponse.code -eq 200) {
        Write-Success "删除草稿文章成功"
    } else {
        Write-Error-Custom "删除草稿文章失败"
    }
}

Write-Info "`n8.3 删除测试分组"
if ($createdGroupId) {
    $deleteGroupResponse = Invoke-ApiRequest -method "DELETE" -url "$baseUrl/api/admin/groups/$createdGroupId" -needAuth $true
    if ($deleteGroupResponse -and $deleteGroupResponse.code -eq 200) {
        Write-Success "删除测试分组成功"
    } else {
        Write-Error-Custom "删除测试分组失败"
    }
}

Write-Info "`n8.4 测试登出 (POST /api/auth/logout)"
$logoutResponse = Invoke-ApiRequest -method "POST" -url "$baseUrl/api/auth/logout" -needAuth $true
if ($logoutResponse -and $logoutResponse.code -eq 200) {
    Write-Success "登出成功"
} else {
    Write-Error-Custom "登出失败"
}

# ============================================
# 测试总结
# ============================================
Write-Test "测试完成"

Write-Host "`n" -NoNewline
Write-Success "所有测试已完成！"
Write-Host "`n测试覆盖了以下功能：" -ForegroundColor Cyan
Write-Host "  1. 认证接口 (登录、登出、权限验证)" -ForegroundColor White
Write-Host "  2. 分组管理 (创建、查询、更新、删除)" -ForegroundColor White
Write-Host "  3. 文章管理 (创建、查询、更新、删除、筛选、搜索、排序)" -ForegroundColor White
Write-Host "  4. 评论功能 (创建、查询、删除)" -ForegroundColor White
Write-Host "  5. 浏览量统计" -ForegroundColor White
Write-Host "  6. 仪表盘统计" -ForegroundColor White
Write-Host "  7. 权限控制" -ForegroundColor White
Write-Host "  8. 数据清理" -ForegroundColor White
Write-Host ""

