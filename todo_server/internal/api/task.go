package api

import (
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"todo_server/internal/storage"
	"todo_server/pkg/models"
	"todo_server/pkg/request"
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
	// 获得当前用户user_id
	user_id, exists := ctx.Get("user_id")
	if !exists {
		response.Response(ctx, 401, "user_id not found", nil)
		return
	}

	var payload request.TaskCreate
	if err := ctx.ShouldBindJSON(&payload); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	err := t.storage.CreateTodo(&models.Todo{
		BaseModel: models.BaseModel{
			ID: uuid.New().String(),
		},
		UserID:      user_id.(string),
		Title:       payload.Title,
		Description: payload.Description,
	})
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}
	response.Response(ctx, 200, "success", nil)
}

func (t *TaskController) updateTask(ctx *gin.Context) {
	// 获得当前用户user_id
	user_id, exists := ctx.Get("user_id")
	if !exists {
		response.Response(ctx, 401, "user_id not found", nil)
		return
	}

	var payload request.TaskUpdate
	if err := ctx.ShouldBindJSON(&payload); err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}

	err := t.storage.UpdateTodoByID(payload.ID, &models.Todo{
		UserID:      user_id.(string),
		Title:       payload.Title,
		Description: payload.Description,
	})
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}
	response.Response(ctx, 200, "success", nil)
}
