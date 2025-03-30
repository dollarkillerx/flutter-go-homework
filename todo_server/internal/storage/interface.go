package storage

import (
	"gorm.io/gorm"
	"todo_server/pkg/models"
)

type Interface interface {
	DB() *gorm.DB

	CreateTodo(todo *models.Todo) error                            // 创建 todo
	UpdateTodoByID(id string, todo *models.Todo) error             // 更新 todo
	GetTodosByEmail(email string) ([]models.Todo, error)           // 获取 todo
	RegisterUser(email string, password string) error              // 注册用户
	LoginUser(email string, password string) (*models.User, error) // 登录
}
