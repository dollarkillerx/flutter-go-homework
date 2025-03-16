package api

import (
	"github.com/gin-gonic/gin"
	"todo_server/internal/middleware"
)

// Router sets up the API routes for the server.
//
// It defines the available endpoints and their corresponding handlers.
// No parameters.
// No return values.
// Router sets up the API routes for the server.
//
// It defines the available endpoints and their corresponding handlers.
// No parameters.
// No return values.
func (a *Server) Router() {
	a.app.GET("/health", a.HealthCheck) // 健康检查

	v1 := a.app.Group("/api/v1")
	{
		v1.POST("/public/register", NewUserController(a.storage).register) // 用户注册
		v1.POST("/public/login", NewUserController(a.storage).login)       // 用户登录

		private := v1.Group("/private", middleware.Auth(a.conf.JWTSecretKey))
		{
			private.GET("/tasks", a.getTasks)   // 获取任务列表
			private.POST("/task", a.createTask) // 创建任务
			private.PUT("/task", a.updateTask)  // 更新任务

			// 当app前台活跃的时候使用拉模式
			private.GET("/notice", a.notice) // 获取通知
		}
	}
}

// HealthCheck returns a health check response.
//
// ctx is the Gin context for the request.
// No return values.
// HealthCheck returns a health check response.
//
// ctx is the Gin context for the request.
// No return values.
func (a *Server) HealthCheck(ctx *gin.Context) {
	ctx.JSON(200, gin.H{
		"message": "ok",
	})
}
