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
		v1.POST("/public/register", NewUserController(a.storage, a.conf).register) // 用户注册
		v1.POST("/public/login", NewUserController(a.storage, a.conf).login)       // 用户登录

		private := v1.Group("/private", middleware.Auth(a.conf.JWTSecretKey))
		{
			private.GET("/tasks", NewTaskController(a.storage).getTasks)   // 获取当前用户下所有的任务
			private.POST("/task", NewTaskController(a.storage).createTask) // 创建任务
			private.PUT("/task", NewTaskController(a.storage).updateTask)  // 更新任务
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
