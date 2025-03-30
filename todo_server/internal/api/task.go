package api

import (
	"github.com/gin-gonic/gin"
	"todo_server/internal/storage"
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

	todos, err := t.storage.GetTodosByEmail(user_id.(string))
	if err != nil {
		response.Response(ctx, 400, err.Error(), nil)
		return
	}
	response.Response(ctx, 200, "success", todos)
}

func (t *TaskController) createTask(ctx *gin.Context) {

}
