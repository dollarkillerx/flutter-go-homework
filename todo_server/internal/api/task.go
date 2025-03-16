package api

import (
	"github.com/gin-gonic/gin"
	"todo_server/internal/storage"
)

type TaskController struct {
	storage *storage.Storage
}

func NewTaskController(storage *storage.Storage) *TaskController {
	return &TaskController{storage: storage}
}

func (t *TaskController) getTasks(ctx *gin.Context) {

}

func (t *TaskController) createTask(ctx *gin.Context) {

}
