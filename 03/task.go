package api

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
	"todo_server/internal/storage"
	"todo_server/pkg/models"
	"todo_server/pkg/response"
)

type TaskController struct {
	storage *storage.Storage
}

func NewTaskController(storage *storage.Storage) *TaskController {
	return &TaskController{storage: storage}
}

func (t *TaskController) getTasks(ctx *gin.Context) {
	// 获得当前用户user_id
	user_id, exists := ctx.Get("user_id")
	if !exists {
		response.Response(ctx, 401, "user_id not found", nil)
		return
	}

	todos, err := t.storage.GetTodosByUserId(user_id.(string))
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}
	response.Response(ctx, 200, "success", todos)
}

func (t *TaskController) createTask(ctx *gin.Context) {
	var todo models.Todo
	if err := ctx.ShouldBindJSON(&todo); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": "参数绑定失败"})
		return
	}

	// JWT设置了 userID
	title, exists := ctx.Get("title")
	if !exists {
		ctx.JSON(http.StatusUnauthorized, gin.H{"error": "没有标题"})
		return
	}
	description, exists := ctx.Get("description")
	if !exists {
		ctx.JSON(http.StatusUnauthorized, gin.H{"error": "没有内容"})
		return
	}

	todo.Title = title.(string)
	todo.Description = description.(string)

	if err := t.storage.CreateTodo(&todo).Error; err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{"error": "创建任务失败"})
		return
	}

	ctx.JSON(http.StatusOK, gin.H{"msg": "任务创建成功", "task": todo})
}

// 更新任务
func (t *TaskController) updateTask(ctx *gin.Context) {
	// 获取 user_id 验证是否为本人
	userID, exists := ctx.Get("user_id")
	if !exists {
		ctx.JSON(http.StatusUnauthorized, gin.H{"error": "未登录"})
		return
	}

	var existing models.Todo
	// 更新允许的字段
	existing.Title = existing.Title
	existing.Description = existing.Description
	if err := t.storage.UpdateTodoByID(strconv.FormatInt(userID.(int64), 10), &existing).Error; err != nil {
		ctx.JSON(http.StatusNotFound, gin.H{"error": "任务不存在"})
		return
	}

	ctx.JSON(http.StatusOK, gin.H{"msg": "任务更新成功", "task": existing})
}
